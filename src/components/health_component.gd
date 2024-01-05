class_name HealthComponent
extends Node
## Tracks statistics about an actor.
##
## So far, only `health` (int) is tracked. Emits signals for when the health value changed and when
## it reaches 0.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


## Dynamically sets this actor's health, and emits signals.
@export var health:= 1:
    set(value):

        health = value
        health_changed.emit(health)
        if health <= 0:
            no_health.emit()


signal health_changed(health: int)
signal no_health()
