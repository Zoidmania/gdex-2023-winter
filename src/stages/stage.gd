extends Node2D
class_name Stage

@onready var hud: HUD = $HUD
@onready var music: AudioStreamPlayer = $Music


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

    music.connect("finished", Callable(self,"_on_audio_player_finished").bind(music))


func _on_audio_player_finished(player: AudioStreamPlayer):
    print("loop")
    player.stream_paused = false
    player.play()
