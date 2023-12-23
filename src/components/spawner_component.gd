class_name SpawnerComponent
extends Node2D


## The scene that will be spawned by this component.
@export var scene: PackedScene


## Spawn an instance of the scene at a specific global position on a parent.
##
## By default, the `parent` is the root scene.
func spawn(
    global_spawn_position: Vector2 = global_position,
    parent: Node = get_tree().current_scene,
) -> Node:

    assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")

    var instance = scene.instantiate()
    parent.add_child(instance)
    instance.global_position = global_spawn_position

    return instance
