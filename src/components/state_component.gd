class_name StateComponent
extends Node


## Emitted when the state has been enabled.
signal enabled()
## Emitted when the state has been disabled.
signal disabled()
## Emited when the state is finished (distinct from disabling).
signal state_finished()


## Disables this state (and all its children).
##
## Also fires the [signal StateComponent.disabled] signal.
func disable() -> void:

    disabled.emit()
    process_mode = Node.PROCESS_MODE_DISABLED


## Disables this state (and all its children).
##
## Also fires the [signal StateComponent.enabled] signal.
func enable() -> void:

    enabled.emit()
    process_mode = Node.PROCESS_MODE_INHERIT
