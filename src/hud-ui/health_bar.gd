class_name PlayerHealthBar
extends Node2D
## A health bar UI object.
##
## Written by jgotty777. Amended by Zoidmania.


@export var game_stats: GameStats


@onready var curved_part: TextureProgressBar = $CurveHealth
@onready var straight_part: TextureProgressBar = $StraightHealth


## Max health of the player.
##
## Set by [method HealthBar.configure_bounds].
var max_health: int


## Init.
##
## Sets the maximum health of the player.
func _ready() -> void:

    await game_stats.health_initialized
    configure_bounds(game_stats.max_player_health)
    game_stats.health_changed.connect(set_health)
    set_health(game_stats.player_health)

## Configures boundaries of the health bar components given a maximum value.
##
## Should only be called when the maximum health of the player changes, like on instantiation.
func configure_bounds(new_max_health: int) -> void:

    max_health = new_max_health

    var mid_point: int = max_health / 2
    curved_part.min_value = 0
    curved_part.max_value = mid_point
    straight_part.min_value = mid_point
    straight_part.max_value = max_health


## Updates the tracked health value to the new one.
func set_health(new_health: int) -> void:

    # Ensure health is within bounds.
    # Nota Bene: even though the values on the health bars themselves are clamped, it's still good
    # practice to check your vars.
    new_health = clamp(new_health, 0, max_health)

    curved_part.set_value_no_signal(float(new_health))
    straight_part.set_value_no_signal(float(new_health))
