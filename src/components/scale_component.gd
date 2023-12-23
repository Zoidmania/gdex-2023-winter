class_name ScaleComponent
extends Node


@export var sprite: Node2D
@export var scale_amount = Vector2(1.5, 1.5)
@export var scale_duration: = 0.4


## Animates a brief scaling of the associated [member ScaleComponent.sprite].
##
## The sprite immediately is scaled by the associated [member ScaleComponent.scale_amount], and is
## then tweened down to the original size using the associated
## [member ScaleComponent.scale_duration].
func tween_scale() -> void:

    # First, create a smooth tween.
    var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)

    # Next, scale the sprite to the scale amount (in 1/10th of the scale duration).
    tween.tween_property(sprite, "scale", scale_amount, scale_duration * 0.1).from_current()

    # Finally, scale back to a value of 1 for the other 9/10ths of the scale duration.
    # Nota bene: consider that this always scales to a value of 1, which doesn't work for sprites
    # that aren't scaled to 1 in either direction.
    tween.tween_property(sprite, "scale", Vector2.ONE, scale_duration * 0.9).from(scale_amount)
