class_name MoveInputComponent
extends Node
## Handles wiring input events to a [MovementComponent].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var move_component: MoveComponent
@export var speed: int


## Called on input events.
##
## Since the player ship only moves horizontally, this function builds a velocity [Vector2] using
## [member MoveInputComponent.speed] value and sets [member MoveInputComponent.move_component]'s
## [member MoveComponent.velocity] to it.
func _input(event: InputEvent) -> void:

    var x_axis = Input.get_axis("santa_move_left", "santa_move_right")
    var y_axis = Input.get_axis("santa_move_up", "santa_move_down")
    var velocity = Vector2(x_axis, y_axis)

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed

    move_component.velocity = velocity
