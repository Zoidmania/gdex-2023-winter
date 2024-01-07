class_name GameStats
extends Resource
## Keeps track of scores for the current game session.
##
## Score reflects the number of houses that have been delivered to.


## The current score.
@export var score := 0:
    set(value):
        score = value
        score_changed.emit(score)

## The score required to complete the stage.
@export var required_score := 10

<<<<<<< HEAD
@export var max_health:= 20

## Globally track the player's health.
@export var player_health:= 20:
    set(value):
        player_health = value
        health_changed.emit(player_health)


signal score_changed(new_score: int)
signal health_changed(new_health: int)

# Player emits this to prevent timing issues with initializing the HUD.
signal health_initialized
