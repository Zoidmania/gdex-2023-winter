class_name TimedStateComponent
extends StateComponent


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
