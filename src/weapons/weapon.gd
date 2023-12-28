class_name Weapon
extends Node2D


@export var fire_rate := 1.0


## Amount of time, in seconds, bewteen projectile spawns from this weapon while firing.
##
## Set on init.
@onready var fire_rate_timer: Timer = $FireRateTimer

## Used to prevent firing another shot faster than the weapon's fire rate.
##
## Wait time set on init to match the fire rate timer.
@onready var cooldown_timer: Timer = $CooldownTimer

@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner
@onready var scale_component: ScaleComponent = $ScaleComponent


signal fired


func _ready() -> void:

    fire_rate_timer.wait_time = fire_rate
    cooldown_timer.wait_time = fire_rate


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

    if Input.is_action_just_pressed("santa_shoot"):

        if not cooldown_timer.is_stopped():
            await cooldown_timer.timeout

        fire_projectile()
        fire_rate_timer.start()
        cooldown_timer.start()

    if Input.is_action_just_released("santa_shoot"):
        fire_rate_timer.stop()


## Causes the associated [SpawnerComponent] to create a projectile.
##
## The projectile's speed is controlled by the [Projectile]'s [MoveComponent].
func fire_projectile() -> void:

    projectile_spawner.spawn(muzzle.global_position)
    scale_component.tween_scale()
    fire_rate_timer.start()
    fired.emit()
