class_name Enemy
extends Node2D
## Base enemy type.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@onready var move_component: MoveComponent = $MoveComponent

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var flash_component: FlashComponent = $HurtFlashComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent

@onready var hurt_sfx: AudioStreamPlayer = $HurtSFX
@onready var death_sfx: AudioStreamPlayer = $DeathSFX

# Set in ready().
var x_margin: int
var y_margin: int


signal hurt(new_health: int)


## Called when the node enters the scene tree for the first time.
##
## Ensures that the enemy dequeues when leaving the viewport, or is destroyed.
func _ready() -> void:

    # Set the margin for this enemy equal to half the width of the visibility notifier.
    x_margin = visible_on_screen_notifier_2d.get_rect().size.x / 2
    y_margin = visible_on_screen_notifier_2d.get_rect().size.y / 2

    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)

    hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
        scale_component.tween_scale()
        flash_component.flash()
        shake_component.tween_shake()
        hurt.emit(health_component.health)
        hurt_sfx.play()
    )

    death_sfx.finished.connect(queue_free)

    health_component.no_health.connect(func():
        hitbox_component.queue_free()
        hurtbox_component.queue_free()
        animated_sprite_2d.hide()
        move_component.velocity = Vector2(0, 0)
        death_sfx.play()
    )

    # Destroy self when self's hitbox collides with a hurtbox (player)
    hitbox_component.hit_hurtbox.connect(func(_ignored):
        ## deal remaining self health to collided target
        hitbox_component.damage = health_component.health
        hitbox_component.queue_free()
        hurtbox_component.queue_free()
        animated_sprite_2d.hide()
        move_component.velocity = Vector2(0, 0)
        death_sfx.play()
        destroyed_component.destroy()
    )
