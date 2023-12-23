class_name EnemyGenerator
extends Node2D
## Generates enemies in a scene.
##
## Extend this script to customize timers for a given level/stage.


@export var game_stats: GameStats

@onready var spawner_component: SpawnerComponent = $SpawnerComponent

var play_area_width = ProjectSettings.get_setting("display/window/size/playable_area_width")


## Spawns enemies at a random location above the screen.
##
## The spawn rate of each enemy is roughly `time_offset / score`; increasing `time_offset` increases
## the time delta between spawns, and vice versa. `time_offset` must be a positive number.
func handle_spawn(enemy_scene: PackedScene, timer: Timer, time_offset: float = 1.0) -> void:

    # instance the enemy _now_ instead of letting spawn() do it so we can access its margin values
    var instance: Enemy = enemy_scene.instantiate()
    # An instance's `_ready()` isn't called until the instance joins the tree, so we add it here so
    # margins get set.
    get_tree().current_scene.add_child(instance)
    var x_margin = instance.x_margin
    var y_margin = instance.y_margin

    spawner_component.scene = enemy_scene
    spawner_component.spawn(
        # random horizontal, always just above the viewport
        Vector2(randf_range(x_margin, play_area_width-(x_margin*2)), 0-(y_margin*2)),
        get_tree().current_scene, # the root of the scene tree
        instance # an instanced enemy scene
    )

    # TO DO: decide whether to keep this mechanic, and whether to scale on score or time.
    # Gently increase the spawn rate based on the current score. That is, spawn rate, which is the
    # delta between when spawns occur, gets smaller, which increases spawn frequency. Asymptotically
    # approaches 0.
    #time_offset = abs(time_offset)
    #var spawn_rate = time_offset / (0.5 + game_stats.score * 0.01)
    #timer.start(spawn_rate + randf_range(0.25, 0.5))

    timer.start()
