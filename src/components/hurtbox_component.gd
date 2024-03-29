class_name HurtboxComponent
extends Area2D
## An [Area2D] that emits [signal HurtboxComponent.hurt] when a child [CollisionShape2D] intersects
## a [HitboxComponent].
##
## Based on the component written by HeartBeast.


@export var health_component: HealthComponent
@export var scale_component: ScaleComponent
@export var flash_component: FlashComponent

@export var is_shield := false
@export var is_player := false

var game_stats: GameStats = preload("res://game_stats.tres")

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


## Init.
##
## Connects the [signal HurtBoxComponent.hurt] signal to an anonymous function that removes health
## equal to the damage from the associated [HitBoxComponent].
func _ready() -> void:

    if is_player:
        self.hurt.connect(
            func(hitbox_component: HitboxComponent):
                if game_stats.player_health - hitbox_component.damage <= game_stats.max_player_health:
                    health_component.health -= hitbox_component.damage
                    scale_component.tween_scale()
                    flash_component.flash()
                else:
                    health_component.health = game_stats.max_player_health
        )

    elif is_shield:
        self.hurt.connect(
            func(hitbox_component: HitboxComponent):
                health_component.health -= hitbox_component.damage
                scale_component.tween_scale()
                flash_component.flash()
        )
    else:
        self.hurt.connect(
            func(hitbox_component: HitboxComponent):
                health_component.health -= hitbox_component.damage
        )
