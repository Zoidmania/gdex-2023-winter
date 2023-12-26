class_name HealthBar
extends Node2D
## A health bar UI object.
##
## Written by jgotty777. Amended by Zoidmania.


@export var game_stats: GameStats

var max_health: int


## Init.
##
## Sets the maximum health of the player.
func _ready() -> void:

    configure_bounds(game_stats.player_health)
    game_stats.health_changed.connect(set_health)


## Configures boundaries of the health bar components given a maximum value.
##
## Should only be called when the maximum health of the player changes, like on instantiation.
func configure_bounds(new_max_health: int) -> void:

    max_health = new_max_health

    var midPoint = max_health / 2
    $CurveHealth.min_value = 0
    $CurveHealth.max_value = midPoint
    $StraightHealth.min_value = midPoint
    $StraightHealth.max_value = max_health


## Udpates the tracked health value to the new one.
func set_health(new_health: int) -> void:

    # Ensure health is within bounds.
    new_health = clamp(new_health, 0, max_health)

    print(new_health)
