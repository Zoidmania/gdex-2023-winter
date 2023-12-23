class_name Weapon
extends Node2D


## Amount of time, in seconds, bewteen projectile spawns from this weapon while firing.

@onready var fire_timer: Timer = $FireTimer
@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner
@onready var scale_component: ScaleComponent = $ScaleComponent


signal fired


func _ready() -> void:

    fire_timer.timeout.connect(fire_projectile)


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

    if Input.is_action_just_pressed("santa_shoot"):
        fire_projectile()
        fire_timer.start()

    if Input.is_action_just_released("santa_shoot"):
        fire_timer.stop()


## Causes the associated [SpawnerComponent] to create a projectile.
##
## The projectile's speed is controlled by the [Projectile]'s [MoveComponent].
func fire_projectile() -> void:

    projectile_spawner.spawn(muzzle.global_position)
    scale_component.tween_scale()
    fire_timer.start()
    fired.emit()
