extends Node2D
class_name HouseGenerator


@onready var delivery_house: SpawnerComponent = $DeliveryHouse
@onready var red_house: SpawnerComponent = $RedHouse
@onready var green_house: SpawnerComponent = $GreenHouse
@onready var blue_house: SpawnerComponent = $BlueHouse

@export var houseTimer: Timer
@export var sleigh: Sleigh
@export var right_spawn: Marker2D
@export var left_spawn: Marker2D
@export var game_stats: GameStats

## Used for counting the number of houses that have spawned since a deliverable house has spawned.
var spawned_houses = 0

signal delivery_completed


# Called when the node enters the scene tree for the first time.
func _ready():
    houseTimer.timeout.connect(spawnRightHouse) # Replace with function body.
    houseTimer.timeout.connect(spawnLeftHouse)


func spawnRightHouse() -> void:


    var type = randi_range(1, 10)

    if type == 10 or spawned_houses >= 8:
        var action_house: DeliveryHouse = delivery_house.spawn(
            right_spawn.global_position, get_tree().current_scene, null, true)
        action_house.lockdown.connect(enact_lockdown)
        action_house.release.connect(lift_lockdown)
        spawned_houses = 0

    elif 1 <= type and type <= 3:
        red_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)
        spawned_houses += 1

    elif 4 <= type and type <= 6:
        blue_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)
        spawned_houses += 1

    else:
        green_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)
        spawned_houses += 1


func spawnLeftHouse() -> void:

    var type = randi_range(1, 10)

    if type == 10 or spawned_houses >= 8:
        var action_house: DeliveryHouse = delivery_house.spawn(
            left_spawn.global_position, get_tree().current_scene, null)
        action_house.lockdown.connect(enact_lockdown)
        action_house.release.connect(lift_lockdown)
        spawned_houses = 0

    elif 1 <= type and type <= 3:
        red_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
        spawned_houses += 1

    elif 4 <= type and type <= 6:
        blue_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
        spawned_houses += 1

    else:
        green_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
        spawned_houses += 1


func enact_lockdown() -> void:
    var tree = get_tree()
    for house: House in tree.get_nodes_in_group('house'):
        house.move_component.velocity = Vector2.ZERO

    for timer in tree.get_nodes_in_group('timer'):

        timer.paused = true

    for scroller in tree.get_nodes_in_group('background_scroll'):

        scroller.move_speed = 0

    sleigh.move_input_component.speed = 0
    sleigh.sleigh_sprite.play('delivering')


func lift_lockdown() -> void:
    var tree = get_tree()
    for house: House in tree.get_nodes_in_group('house'):
        house.move_component.velocity = Vector2(0,20)

    for timer in tree.get_nodes_in_group('timer'):
        timer.paused = false

    for scroller in tree.get_nodes_in_group('background_scroll'):
        scroller.move_speed = 20
    sleigh.move_input_component.speed = 200
    sleigh.sleigh_sprite.play('flying')

    delivery_completed.emit()

