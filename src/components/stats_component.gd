class_name StatsComponent
extends Node


## Sets this actor's health. Also emits a signal that the health value changed. If the health is
## `0`, also emits another signal.
@export var health:= 1:
    set(value):

        health = value
        health_changed.emit()
        if health == 0:
            no_health.emit()


signal health_changed()
signal no_health()
