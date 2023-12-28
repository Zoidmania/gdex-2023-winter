class_name VariablePitchAudioStreamPlayer
extends AudioStreamPlayer
## Plays an audio stream with variable pitch.
##
## Written by HeartBeast. Amended by Zoidmania.
## @tutorial: https://www.youtube.com/playlist?list=PL9FzW-m48fn09w6j8NowI_pSBVcsb3V78


@export var pitch_min = 0.6
@export var pitch_max = 1.2

@export var auto_play_with_variance: = false


## Init.
##
## Plays the audio stream if [member VariablePitchAudioStreamPlayer.auto_play_with_variance] is
## enabled.
func _ready() -> void:

    if auto_play_with_variance:
        play_with_variance(0.0)


## Plays the audio stream using a variance in the pitch.
##
## By default, plays from the beginning, unless `from_position` is passed in.
func play_with_variance(from_position: float = 0.0) -> void:

    # Set the pitch scale before playing the sound
    pitch_scale = randf_range(pitch_min, pitch_max)
    play(from_position)
