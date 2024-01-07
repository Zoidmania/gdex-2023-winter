class_name Projectile
extends Node2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var move_component: MoveComponent = $MoveComponent

@onready var impact_sfx: AudioStreamPlayer = $ImpactSFX

@onready var sprite: Sprite2D = $Sprite2D


## Used to set the velocity vector for projectiles that need to be dynamically set on spawn.
var init_velocity: Vector2


## Called when the node enters the scene tree for the first time.
##
## Projectiles are initially flashed and scaled up, then tweened down to standard size.
func _ready() -> void:

    scale_component.tween_scale()
    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
    impact_sfx.finished.connect(queue_free)
    hitbox_component.hit_hurtbox.connect(func(_ignored):
        hitbox_component.queue_free()
        sprite.hide()
        impact_sfx.play()
    )

    if init_velocity:
        move_component.velocity = init_velocity


func set_velocity(vel: Vector2) -> void:
    init_velocity = vel

