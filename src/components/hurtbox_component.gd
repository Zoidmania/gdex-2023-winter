class_name HurtboxComponent
extends Area2D
## An [Area2D] that emits [signal HurtboxComponent.hurt] when a child [CollisionShape2D] intersects
## a [HitboxComponent].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


## Indicates that this [HurtboxComponent] cannot be damaged, meaning that all child collision shapes
## should be disabled.
var is_invincible = false :
    set(value):

        is_invincible = value

        for child in get_children():
            if not child is CollisionShape2D and not child is CollisionPolygon2D:
                continue
            child.set_deferred("disabled", is_invincible)


## Emitted when this [HurtBoxComponent] is hurt. The only argument of this signal is an assoicated
## [HitBoxComponent], indicating that that [HitBoxComponent] collided with this [HurtBoxComponent].
signal hurt(hitbox: HitboxComponent)
