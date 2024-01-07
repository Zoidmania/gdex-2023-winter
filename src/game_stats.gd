class_name GameStats
extends Resource
## Keeps track of scores for the current game session.
##
## Scores are not serialized to disk. Highscore is initialized when the game starts, and isn't
## persistent when the application closes.


## The current score for this particular game.
@export var score := 0:
    set(value):
        score = value
        score_changed.emit(score)

@export var required_score := 10

@export var max_health:= 20

@export var player_health:= 20:
    set(value):
        player_health = value
        health_changed.emit(player_health)


signal score_changed(new_score: int)
signal health_changed(new_health: int)

# Player emits this to prevent timing issues with initializing the HUD.
signal health_initialized
