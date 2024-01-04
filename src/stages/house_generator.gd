extends Node2D
@onready var delivery_house: DeliveryHouse = $DeliveryHouse
@onready var red_house = $RedHouse
@onready var green_house = $GreenHouse
@onready var blue_house = $BlueHouse

@export var houseTimer: Timer
@export var sleigh: Sleigh
@export var spawn_loc: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
    houseTimer.timeout.connect(spawnHouse) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func spawnHouse() -> void:
    var type = randi_range(1, 10)
    if type == 10:
        delivery_house.spawn(spawn_loc)
        delivery_house.lockdown.connect()
    elif 1 <= type <= 3:
        red_house.spawn(spawn_loc)
    elif 4 <= type <= 6:
        blue_house.spawn(spawn_loc)
    else:
        green_house.spawn(spawn_loc)
