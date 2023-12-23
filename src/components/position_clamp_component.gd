class_name PositionClampComponent
extends Node2D
## Clamps a Node2D's global position on the x-axis to a given range, with an optional margin.
##
## Nota bene: does [i]not[/i] clamp on the y-axis.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var actor: Node2D
@export var margin: = 8

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")


## Called every frame.
##
## Clamps the x position of the assocaited actor between the left and right borders of the viewport,
## accounting for the associated margin. Does *not* affect the top and bottom borders viewport.
func _process(delta: float) -> void:

    actor.global_position.x = clamp(
        actor.global_position.x, left_border+margin, right_border-margin
    )
