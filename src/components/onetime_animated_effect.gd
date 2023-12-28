class_name OnetimeAnimatedEffect
extends AnimatedSprite2D
## Runs a [AnimatedSprite2D]'s animation [i]once[/i], then destroys itself.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


## Init.
##
## Connects [signal AnimatedSprite2D.animation_finished] and
## [signal AnimatedSprite2D.animation_looped] to `queue_free`, facilitating the "one time" nature
## of this animation.
func _ready() -> void:

    animation_finished.connect(queue_free)
    animation_looped.connect(queue_free)
