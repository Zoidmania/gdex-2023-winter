class_name OnetimeAnimatedEffect
extends AnimatedSprite2D


## Init.
##
## Connects [signal AnimatedSprite2D.animation_finished] and
## [signal AnimatedSprite2D.animation_looped] to `queue_free`, facilitating the "one time" nature
## of this animation.
func _ready() -> void:

    animation_finished.connect(queue_free)
    animation_looped.connect(queue_free)
