class_name PowerUp
extends Node2D


@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var pickup_sfx: AudioStreamPlayer = $PickupSFX
@onready var sprite: Sprite2D = $Sprite2D


## Called when the node enters the scene tree for the first time.
func _ready() -> void:

    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
    pickup_sfx.finished.connect(queue_free)

    hitbox_component.hit_hurtbox.connect(func(_ignored):
        sprite.hide()
        pickup_sfx.play()
        hitbox_component.queue_free()
    )





