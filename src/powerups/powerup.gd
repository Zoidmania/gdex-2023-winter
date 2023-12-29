class_name PowerUp
extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D



@onready var hitbox_component: HitboxComponent = $HitboxComponent


## Called when the node enters the scene tree for the first time.
##
## Lasers are initially flashed and scaled for a short duration and tweened down to standard size.
func _ready() -> void:

   
    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
    # The `hurt_hitbox` signal sends 1 argument, so we need to unbind it since `queue_free` doesn't
    # accept any arguments.
    hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))
    
    
    
    

