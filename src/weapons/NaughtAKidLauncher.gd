extends EnemyWeapon
class_name NaughtAKidLauncher

@export var target: Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
    super() # Replace with function body.
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_cooldown_timer_timeout():
    var shootVector: Vector2 = target.global_position - muzzle.global_position  # Replace with function body.
