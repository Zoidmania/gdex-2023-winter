extends ParallaxBackground

@onready var snow_layer: ParallaxLayer = %snow

@onready var road_layer: ParallaxLayer = %road

func _process(delta: float) -> void:
    snow_layer.motion_offset.y += 40 * delta
    road_layer.motion_offset.y += 20 * delta
    
