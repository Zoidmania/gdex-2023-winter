extends Node2D
class_name Stage

@onready var hud: HUD = $HUD
@onready var music: AudioStreamPlayer = $Music
@onready var death_player: AudioStreamPlayer = $SantaDeathPlayer
@onready var death_transition_timer: Timer = $DeathTransitionTimer
@onready var sleigh: Sleigh = $Sleigh

@export var game_stats: GameStats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

    music.connect("finished", Callable(self,"_on_audio_player_finished").bind(music))

    sleigh.dead.connect(func():
        death_player.play()
        sleigh.hide()
        sleigh.hurtbox_component.queue_free()
        sleigh.move_input_component.queue_free()
        sleigh.weapon.disabled = true
        music.volume_db = -25.0
    )

    death_player.finished.connect(func():
        death_transition_timer.start()
    )

    death_transition_timer.timeout.connect(func():
        get_tree().change_scene_to_file("res://menus/main_menu.tscn")
    )


func _on_audio_player_finished(player: AudioStreamPlayer):
    player.stream_paused = false
    player.play()
