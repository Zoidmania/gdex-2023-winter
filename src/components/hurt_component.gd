class_name HurtComponent
extends Node

@export var stats_component: StatsComponent
@export var hurtbox_component: HurtboxComponent


## Init.
##
## Connects the [signal HurtBoxComponent.hurt] signal to an anonymous function that removes health
## equal to the damage from the associated [HitBoxComponent].
func _ready() -> void:

    hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
        stats_component.health -= hitbox_component.damage
    )
