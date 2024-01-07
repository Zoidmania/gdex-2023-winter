extends Node2D
class_name Sheild


@onready var dmg_sfx: AudioStreamPlayer = $DmgSFX
@onready var crack_sfx: AudioStreamPlayer = $CrackSFX

@onready var sprite_2d: Sprite2D = $Sprite2D


var maxHealth = 4
var cracked = false

signal destroyed


func _on_health_component_health_changed(health):

    if health <= maxHealth/2:
        cracked = true
        sprite_2d.texture = load('res://assets/powerup/shield cracked.png')

    if health == 0:
        destroyed.emit()
        queue_free()
    elif cracked:
        crack_sfx.play()
    else:
        dmg_sfx.play()

