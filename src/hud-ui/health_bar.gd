class_name HealthBar
extends Node2D


@export var game_stats: GameStats


## Init.
##
## Sets the maximum health of the player.
func _ready() -> void:

    configure_bounds(game_stats.player_health)
    game_stats.health_changed.connect(set_health)


## Confgiures boundaries of the health bar components given a maximum value.
##
## Should only be called when the maximum health of the player changes, like on instantiation.
func configure_bounds(max_health: int) -> void:

    var midPoint = max_health / 2
    $CurveHealth.min_value = 0
    $CurveHealth.max_value = midPoint
    $StraightHealth.min_value = midPoint
    $StraightHealth.max_value = max_health


func set_health(new_health: int) -> void:

    print(new_health)
