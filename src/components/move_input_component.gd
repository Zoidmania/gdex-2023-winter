class_name MoveInputComponent
extends Node
## Handles wiring input events to a [MovementComponent].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var move_component: MoveComponent
@export var move_stats: MoveStats


## Called on input events.
##
## Since the player ship only moves horizontally, this function builds a velocity [Vector2] using
## [member MoveInputComponent.move_stats]'s [member MoveStats.speed] value and sets
## [member MoveInputComponent.move_component]'s [member MoveComponent.velocity] to it.
func _input(event: InputEvent) -> void:

    var x_axis = Input.get_axis("ui_left", "ui_right")
    var y_axis = Input.get_axis("ui_up", "ui_down")
    var velocity = Vector2(x_axis, y_axis)

    if velocity.length() > 0:
        velocity = velocity.normalized() * move_stats.speed

    move_component.velocity = velocity
