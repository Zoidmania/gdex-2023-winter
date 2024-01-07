extends GPUParticles2D



func _notification(what: int) -> void:

    if what == NOTIFICATION_PAUSED:
        interpolate = false
    else:
        interpolate = true
