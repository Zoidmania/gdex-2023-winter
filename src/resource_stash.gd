extends Node
## Loads a reference to a [GameStats] resource.
##
## This is meant to be autoloaded in your project settings. It keeps a constant reference to a
## [GameStats] resource so Godot doesn't garbage collect it when transitioning scenes.


var game_stats: GameStats = load("res://game_stats.tres")
