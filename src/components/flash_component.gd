class_name FlashComponent
extends Node


## Flash material to produce this effect. It turns the whole sprite white.
const FLASH_MATERIAL = preload("res://effects/white_flash_material.tres")

@export var sprite: CanvasItem
@export var flash_duration: = 0.2

var flash_duration_timer: Timer = Timer.new()
# Stores the original sprite's material so we can reset it after the flash
var original_sprite_material: Material


## Init.
##
## Adds the `flash_duration_timer` on init, and captures the original material.
func _ready() -> void:

    add_child(flash_duration_timer)

    original_sprite_material = sprite.material


## Applies the flash effect to the sprite for the associated `flash_duration`.
##
## The effect is acheived by setting the sprite's material to the flash material, waiting for the
## duration, and setting the material back to the original material.
func flash() -> void:

    sprite.material = FLASH_MATERIAL
    flash_duration_timer.start(flash_duration)
    await flash_duration_timer.timeout
    sprite.material = original_sprite_material
