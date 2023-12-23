class_name GameStats
extends Resource


@export var score := 0:
    set(value):
        score = value
        score_changed.emit(score)

@export var highscore := 0


signal score_changed(new_score: int)


