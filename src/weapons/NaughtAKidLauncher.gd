extends EnemyWeapon
class_name NaughtAKidLauncher


@export var target: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_cooldown_timer_timeout():
    var projectile: Projectile = projectile_spawner.spawn(muzzle.position)
    print(projectile.get_children())
    if target:
        var shootVector: Vector2 = target.position - muzzle.position
        projectile.set_velocity(shootVector)

