class_name Projectile
extends Node2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

@onready var scale_component: ScaleComponent = $ScaleComponent

@onready var hitbox_component: HitboxComponent = $HitboxComponent

@onready var move_component: MoveComponent = $MoveComponent


## Called when the node enters the scene tree for the first time.
##
## Lasers are initially flashed and scaled for a short duration and tweened down to standard size.
func _ready() -> void:

    scale_component.tween_scale()
    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
    # The `hurt_hitbox` signal sends 1 argument, so we need to unbind it since `queue_free` doesn't
    # accept any arguments.
    hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))


func set_velocity(vel: Vector2) -> void:

    move_component.velocity = vel

