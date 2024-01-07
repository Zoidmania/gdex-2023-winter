extends ParallaxBackground


@export var move_speed = 20
@onready var road_layer: ParallaxLayer = %road



func _process(delta: float) -> void:

    if move_speed > 0:

        road_layer.motion_offset.y += move_speed * delta
    else:
        road_layer.motion_offset.y = 0 * delta


