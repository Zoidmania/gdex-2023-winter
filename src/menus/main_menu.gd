extends Control

@export var game_stats: GameStats


func _ready() -> void:

    game_stats.player_health = game_stats.max_health


func _process(delta: float) -> void:
    if Input.is_action_just_pressed("ui_accept"):
        get_tree().change_scene_to_file("res://stages/stage_north_america.tscn")
