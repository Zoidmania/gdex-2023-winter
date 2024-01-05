extends Node2D
class_name House
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var move_component = $MoveComponent

func _ready():
  visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
