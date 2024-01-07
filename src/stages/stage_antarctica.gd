extends Stage


@onready var krampus: Krampus = $Krampus


func _ready():
    super()
    krampus.hurt.connect(hud.update_krampus_health)
