class_name BorderBounceComponent
extends Node
## Causes a moving actor to "bounce" off of the left or right borders of the viewport.
##
## Nota bene: this component does [i]not[/i] cause bouncing behavior on the top or bottom borders of
## the viewport, only on the left and right.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var margin:= 8
@export var actor: Node2D
@export var move_component: MoveComponent

var left_border:= 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")


## Called every frame.
##
## Causes the associated `actor` to bounce on the left and right sides of the viewport (respecting
## the margin) if moving toward those sides. It *does not* produce the same effect for the top and
## bottom of the viewport.
func _process(delta: float) -> void:

    # If the actor's x position is *less* than the left border plus the margin, bounce off the left
    # side of the screen.
    if actor.global_position.x < left_border + margin:

        # Clamp actor's minimum x position to the left margin.
        actor.global_position.x = left_border + margin
        # When bouncing we use the .bounce function which takes a wall normal. This wall normal is
        # the direction of the face of the wall. A wall on the left would have a wall face with a
        # normal of RIGHT.
        move_component.velocity = move_component.velocity.bounce(Vector2.RIGHT)

    # If the actor's x position is *greater* than the right border plus the margin, bounce off the
    # right side of the screen
    elif actor.global_position.x > right_border - margin:

        # Clamp actor's maximum x position to the right margin.
        actor.global_position.x = right_border - margin

        # Remember, the wall normal is the direction of the face of the wall. A wall on the left
        # would have a wall face with a normal of RIGHT.
        move_component.velocity = move_component.velocity.bounce(Vector2.LEFT)

