class_name Enemy
extends Node2D
## Base enemy type.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@onready var move_component: MoveComponent = $MoveComponent

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

@onready var flash_component: FlashComponent = $FlashComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var shake_component: ShakeComponent = $ShakeComponent

@onready var hitbox_component: HitboxComponent = $HitboxComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var stats_component: StatsComponent = $StatsComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent

@onready var score_component: ScoreComponent = $ScoreComponent

# Set in ready().
var x_margin: int
var y_margin: int


## Called when the node enters the scene tree for the first time.
##
## Ensures that the enemy dequeues when leaving the viewport, or is destroyed.
func _ready() -> void:

    # Set the margin for this enemy equal to half the width of the visibility notifier.
    x_margin = visible_on_screen_notifier_2d.rect.size.x / 2
    y_margin = visible_on_screen_notifier_2d.rect.size.y / 2

    stats_component.no_health.connect(func():
        score_component.adjust_score()
    )

    visible_on_screen_notifier_2d.screen_exited.connect(queue_free)

    hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
        scale_component.tween_scale()
        flash_component.flash()
        shake_component.tween_shake()
    )

    stats_component.no_health.connect(queue_free)
    hitbox_component.hit_hurtbox.connect(destroyed_component.destroy.unbind(1))
