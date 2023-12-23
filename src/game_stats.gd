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

## The highest score acheived when any of the games ended, since the application was launched.
@export var highscore := 0


signal score_changed(new_score: int)
