extends Node2D
@onready var delivery_house: SpawnerComponent = $DeliveryHouse
@onready var red_house: SpawnerComponent = $RedHouse
@onready var green_house: SpawnerComponent = $GreenHouse
@onready var blue_house: SpawnerComponent = $BlueHouse

@export var houseTimer: Timer
@export var sleigh: Sleigh
@export var right_spawn: Marker2D
@export var left_spawn: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
    houseTimer.timeout.connect(spawnRightHouse) # Replace with function body.
    houseTimer.timeout.connect(spawnLeftHouse)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass



func spawnRightHouse() -> void:
    var type = randi_range(1, 10)
    if type == 10:
        delivery_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)      
    elif 1 <= type <= 3:
        red_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)
    elif 4 <= type <= 6:
        blue_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)
    else:
        green_house.spawn(right_spawn.global_position, get_tree().current_scene, null, true)

func spawnLeftHouse() -> void:
    var type = randi_range(1, 10)
    if type == 10:
        delivery_house.spawn(left_spawn.global_position, get_tree().current_scene, null)      
    elif 1 <= type <= 3:
        red_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
    elif 4 <= type <= 6:
        blue_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
    else:
        green_house.spawn(left_spawn.global_position, get_tree().current_scene, null)
