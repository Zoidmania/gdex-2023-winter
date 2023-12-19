extends Node2D

@export var maxHealth: int
    
# Called when the node enters the scene tree for the first time.
func _ready():
    var midPoint = maxHealth / 2
    $CurveHealth.min_value = 0
    $CurveHealth.max_value = midPoint
    $StraightHealth.min_value = midPoint 
    $StraightHealth.max_value = maxHealth


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func _on_h_slider_value_changed(health):
    print(health)
    $CurveHealth.value = health
    $StraightHealth.value = health
