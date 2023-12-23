class_name HitboxComponent
extends Area2D

## The amount of damage this hitbox deals.
@export var damage = 1.0

## Emitted when this hitbox hits a "hurtbox".
signal hit_hurtbox(hurtbox)


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
