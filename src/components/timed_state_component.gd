class_name TimedStateComponent
extends StateComponent
## A StateComponent that disables itself after a duration.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var duration: float = 1.0

var timer: = Timer.new()


## Init.
##
## This state exists for its [member TimedStateComponent.duration], then disables itself.
func _ready() -> void:

    add_child(timer)
    timer.timeout.connect(func():
        state_finished.emit()
        disable()
    )

    enabled.connect(timer.start.bind(duration))
