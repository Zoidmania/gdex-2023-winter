extends Node
class_name DestroyedComponent

## Wires up destruction behavior when an actor runs out of health.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var actor: Node2D
@export var health_component: HealthComponent
# Export and grab access to a spawner component so we can create an effect on death
@export var destroy_effect_spawner_component: SpawnerComponent


## Init.
##
## Connects the `no_health` signal on our stats to the `destroy` function.
func _ready() -> void:

    health_component.no_health.connect(destroy)


## Creates an effect from the associated `destroy_effect_spawner_component` and frees the associated
## `actor`.
func destroy() -> void:
    
    destroy_effect_spawner_component.spawn(actor.global_position)
    actor.queue_free()
