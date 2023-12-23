class_name DestroyedComponent
extends Node

@export var actor: Node2D
@export var stats_component: StatsComponent
# Export and grab access to a spawner component so we can create an effect on death
@export var destroy_effect_spawner_component: SpawnerComponent


## Init.
##
## Connects the `no_health` signal on our stats to the `destroy` function.
func _ready() -> void:

    stats_component.no_health.connect(destroy)


## Creates an effect from the associated `destroy_effect_spawner_component` and frees the associated
## `actor`.
func destroy() -> void:

    destroy_effect_spawner_component.spawn(actor.global_position)
    actor.queue_free()
