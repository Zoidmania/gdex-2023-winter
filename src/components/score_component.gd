class_name ScoreComponent
extends Node

@export var game_stats: GameStats
@export var adjust_amount = 5

## Adjusts the linked [member GameStats.score] value but the amount specified.
##
## The argument ``amount`` is optional; by default, it's set to the global ``adjust_amount``.
func adjust_score(amount: int = adjust_amount):
    game_stats.score += amount
