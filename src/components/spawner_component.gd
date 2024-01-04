class_name SpawnerComponent
extends Node2D
## Spawns an instance of a scene at a given global position.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


## The scene that will be spawned by this component.
@export var scene: PackedScene


## Spawn an instance of the scene at a specific global position on a parent.
##
## By default, the `parent` is the root scene.
##
## By default, an instance is created for you, and it's added to the `parent`. If passing an
## instance, you must add the instance to the parent yourself.
func spawn(
    global_spawn_position: Vector2 = global_position,
    parent: Node = get_tree().current_scene,
    instance: Node = null,
    flipped: bool = false
) -> Node:

    assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")

    if not instance:
        instance = scene.instantiate()
        parent.call_deferred("add_child", instance)
     
    instance.global_position = global_spawn_position

    return instance
