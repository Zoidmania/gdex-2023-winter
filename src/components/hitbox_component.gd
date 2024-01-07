class_name HitboxComponent
extends Area2D
## An [Area2D] that emits [signal HitboxComponent.hit_hurtbox] when a child [CollisionShape2D]
## intersects a [HurtboxComponent].
##
## Also causes the the intersecting [HurtboxComponent] to be hurt by
## [member HitboxComponent.damage].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


## The amount of damage this hitbox deals.
@export var damage = 1.0

## Emitted when this hitbox hits a "hurtbox".
signal hit_hurtbox(hurtbox: HurtboxComponent)


## Init.
##
## Connects the `area_entered` signal to the associated `on_hurtbox_entered` function.
func _ready() -> void:

    area_entered.connect(_on_hurtbox_entered)


## Fired when this hitbox enters a hurtbox.
##
## Emits a signal when colliding with a [HurtBoxComponent], unless the collided hurtbox is
## "invincible" or is not a [HurtBoxComponent]. Also causes the collided [HurtBoxComponent] to emit
## the [signal HurtBoxComponent.hurt] signal.
func _on_hurtbox_entered(hurtbox: HurtboxComponent) -> void:

    if not hurtbox is HurtboxComponent: return
    if hurtbox.is_invincible: return

    hit_hurtbox.emit(hurtbox)
    hurtbox.hurt.emit(self)
