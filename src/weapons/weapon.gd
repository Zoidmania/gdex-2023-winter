class_name Weapon
extends Node2D


@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner
@onready var scale_component: ScaleComponent = $ScaleComponent


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

    if Input.is_action_just_pressed("santa_shoot"):
        fire_projectile()


## Causes the associated [SpawnerComponent] to create a projectile.
##
## The projectile's speed is controlled by the [Projectile]'s [MoveComponent].
func fire_projectile() -> void:

    projectile_spawner.spawn(muzzle.global_position)
    scale_component.tween_scale()
