class_name MoveComponent
extends Node


@export var actor: Node2D
@export var velocity: Vector2


## Called every frame.
##
## Moves the [member MoveComponent.actor] according to the [member MoveComponent.velocity].
func _process(delta: float) -> void:

    actor.translate(velocity * delta)
