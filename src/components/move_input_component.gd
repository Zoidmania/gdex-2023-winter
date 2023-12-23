class_name MoveInputComponent
extends Node


@export var move_component: MoveComponent
@export var move_stats: MoveStats


## Called on input events.
##
## Since the player ship only moves horizontally, this function builds a velocity [Vector2] using
## [member MoveInputComponent.move_stats]'s [member MoveStats.speed] value and sets
## [member MoveInputComponent.move_component]'s [member MoveComponent.velocity] to it.
func _input(event: InputEvent) -> void:

    var input_axis = Input.get_axis("ui_left", "ui_right")
    move_component.velocity = Vector2(input_axis * move_stats.speed, 0)
