class_name ScoreComponent
extends Node
## Tracks a player's score.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var game_stats: GameStats
@export var adjust_amount = 5


## Adjusts the linked [member GameStats.score] value but the amount specified.
##
## The argument ``amount`` is optional; by default, it's set to the global ``adjust_amount``.
func adjust_score(amount: int = adjust_amount):
    game_stats.score += amount
