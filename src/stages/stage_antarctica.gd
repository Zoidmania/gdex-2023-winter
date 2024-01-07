extends Stage


@onready var krampus: Krampus = $Krampus


func _ready():
    super()
    krampus.hurt.connect(hud.update_krampus_health)

    sleigh.dead.connect(func():
        krampus.move_component.velocity = Vector2(0, 0)
        krampus.mouth_launcher.queue_free()
        krampus.right_hand_launcher.queue_free()
        krampus.left_hand_launcher.queue_free()
    )

    krampus.dead.connect(func():
        hud.win_label.show()
        await get_tree().create_timer(5.0).timeout
        get_tree().change_scene_to_file('res://menus/credits.tscn')
    )
