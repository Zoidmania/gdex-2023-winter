class_name KrampusHealthBar
extends Node2D
## A health bar UI object.
##
## Written by jgotty777. Amended by Zoidmania.


@onready var curved_part: TextureProgressBar = $CurveHealth
@onready var straight_part: TextureProgressBar = $StraightHealth


## Max health of Krampus.
@export var max_health := 100


## Init.
func _ready() -> void:

    configure_bounds()
    set_health(max_health)


## Configures boundaries of the health bar components given a maximum value.
##
## Should only be called when the maximum health of Krampus changes, like on instantiation.
func configure_bounds() -> void:

    var mid_point: int = max_health / 2
    straight_part.min_value = 0
    straight_part.max_value = mid_point
    curved_part.min_value = mid_point
    curved_part.max_value = max_health


## Updates the tracked health value to the new one.
func set_health(new_health: int) -> void:

    # Ensure health is within bounds.
    # Nota Bene: even though the values on the health bars themselves are clamped, it's still good
    # practice to check your vars.
    new_health = clamp(new_health, 0, max_health)

    curved_part.set_value_no_signal(float(new_health))
    straight_part.set_value_no_signal(float(new_health))
