class_name ShakeComponent
extends Node
## Spawns an instance of a scene at a given global position.
##
## Nota bene: shake the [i]sprite[/i] and not the root node or you'll get unexpected behavior since
## we are manipulating the position of the node and moving it to <0,0>.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var node: Node2D
@export var shake_amount: = 2.0   # The initial shake amount.
@export var shake_duration: = 0.4 # The duration of the tween.

# Stores the current amount the node is shaking (decreases over time via the tween).
var shake = 0


## Animates a shaking effect on this sprite.
##
## Sets the starting shake amount to [member ShakeComponent.shake_amount] from current down to `0`
## over the [member ShakeComponent.shake_duration]. The tweening is executed via the
## [method ShakeComponent._physics_process].
func tween_shake() -> void:

    shake = shake_amount
    var tween = create_tween()
    tween.tween_property(self, "shake", 0.0, shake_duration).from_current()


## Executes the tweening animation for the associated [member ShakeComponent.node].
##
## Changes the position of the node by picking a random x and y position between positive and
## negative [member ShakeComponent.shake] every physics frame.
func _physics_process(delta: float) -> void:

    node.position = Vector2(randf_range(-shake, shake), randf_range(-shake, shake))
