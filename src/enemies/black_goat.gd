extends Enemy
## Represents a Black Goat Enemy.
##
## Black Goats fire a small black projectile straight downward.


@onready var fire_timer: Timer = $FireTimer
@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner
@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_fire_sfx: AudioStreamPlayer = $ProjectileFireSFX


signal fired


## Init.
func _ready() -> void:
    super()
    fire_timer.timeout.connect(fire_projectile)


## Causes the associated [SpawnerComponent] to create a projectile.
##
## The projectile's speed is controlled by the [Projectile]'s [MoveComponent].
func fire_projectile() -> void:

    projectile_spawner.spawn(muzzle.global_position)
    scale_component.tween_scale()
    fire_timer.start()
    fired.emit()
    projectile_fire_sfx.play()
