extends Node2D

var maxHealth = 4
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_health_component_health_changed(health):
    if(health <= maxHealth/2):
        $Sprite2D.texture = load('res://assets/powerup/shield cracked.png')
    if(health == 0):
        queue_free()


