extends Node2D
class_name EnemyWeapon

@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner
@onready var cooldown_timer: Timer = $CooldownTimer

@export var fire_rate := 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
     cooldown_timer.wait_time = fire_rate# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

