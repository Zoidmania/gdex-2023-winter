extends Area2D

signal hit
@export var health = 100
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@export var Bullet: PackedScene

func _ready():
    screen_size = get_viewport_rect().size
    


    

func _process(delta):
    var velocity = Vector2.ZERO # The player's movement vector.
    
    if Input.is_action_just_pressed("santa_shoot"):
        shoot()
    
    if Input.is_action_pressed("santa_move_right"):
        velocity.x += 1
    if Input.is_action_pressed("santa_move_left"):
        velocity.x -= 1
        
    if Input.is_action_pressed("santa_move_down"):
        velocity.y += 1
       
    if Input.is_action_pressed("santa_move_up"):
        velocity.y -= 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        

    position += velocity * delta
            
    position = position.clamp(Vector2.ZERO, screen_size)
   

func shoot():
    var b = Bullet.instantiate()
    get_parent().add_child(b)
    b.transform = $Node2D/Muzzle.global_transform

func start(pos):
    position = pos
    show()
    $CollisionShape2D.disabled = true


func _on_Player_body_entered(_body):
    
    if(_body.is_in_group('enemy_projectile')):
        health -= 1
        if(health <= 0):
            hide()
    
    # Must be deferred as we can't change physics properties on a physics callback.
    $CollisionShape2D.set_deferred(&"disabled", true)
