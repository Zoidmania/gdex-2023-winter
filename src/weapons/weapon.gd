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


## Called on input events.
func _input(event: InputEvent) -> void:

    if event is InputEventKey and event.is_action_pressed("santa_shoot"):

        if not cooldown_timer.is_stopped():
            await cooldown_timer.timeout
        else:
            fire_projectile()
            fire_rate_timer.start()
            cooldown_timer.start()

    elif event is InputEventKey and event.is_action_released("santa_shoot"):
        fire_rate_timer.stop()


func _notification(what: int) -> void:

    # Nota bene: Fixes an issue where pausing the game while holding the fire button then letting
    # go of the firing button before unpausing causes the weapon to continue firing.
    if what == NOTIFICATION_PAUSED:
        fire_rate_timer.stop()


## Causes the associated [SpawnerComponent] to create a projectile.
##
## The projectile's speed is controlled by the [Projectile]'s [MoveComponent].
func fire_projectile() -> void:

    projectile_spawner.spawn(muzzle.global_position)
    scale_component.tween_scale()
    fire_rate_timer.start()
    fired.emit()
