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
    
    if target != null:
        var projectile: Projectile = projectile_spawner.spawn(muzzle.position)
        var shootVector: Vector2 = target.position - muzzle.position
        #this essentially makes a vector that points in teh correct direction with a "speed" of 250
        shootVector = shootVector.normalized() * 250 
        projectile.set_velocity(shootVector)
   

