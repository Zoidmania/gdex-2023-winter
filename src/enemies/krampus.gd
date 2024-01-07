extends Enemy
class_name Krampus


@onready var mouth_launcher:NaughtAKidLauncher = $MouthLauncher
@onready var left_hand_launcher:NaughtAKidLauncher = $LeftHandLauncher
@onready var right_hand_launcher: NaughtAKidLauncher = $RightHandLauncher

@export var target: Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    super()
    mouth_launcher.target = target # Replace with function body.
    right_hand_launcher.target = target # Replace with function body.
    left_hand_launcher.target = target # Replace with function body.

