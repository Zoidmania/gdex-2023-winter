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
