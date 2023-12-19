extends Area2D

@export var health = 2
@export var enemyBullet: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
    $WeaponTimer.wait_time = 1
    $WeaponTimer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free() # Replace with function body.


func _on_weapon_timer_timeout():
    var b = enemyBullet.instantiate()
    get_parent().add_child(b)
    b.transform = $Node2D/EnemyWeapon.global_transform # Replace with function body.




func _on_area_entered(area):
    if(area.is_in_group('player_bullet')):
        health -= 1
        if(health <= 0):
            queue_free()
        area.queue_free()
