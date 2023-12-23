class_name HurtComponent
extends Node
## Handles wiring updating a [member StatsComponent.health] when a [signal HurtboxComponent.hurt] is
## emitted by a colliding [HitboxComponent].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


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
