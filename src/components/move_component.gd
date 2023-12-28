class_name MoveComponent
extends Node
## Handles actor ([Node2D]) movement given a [member MoveComponent.velocity].
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var actor: Node2D
@export var velocity: Vector2


## Called every frame.
##
## Moves the [member MoveComponent.actor] according to the [member MoveComponent.velocity].
func _process(delta: float) -> void:

    actor.translate(velocity * delta)
