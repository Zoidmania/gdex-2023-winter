extends EnemyGenerator

@export var grey_goat_scene: PackedScene

@onready var grey_goat_timer: Timer = $GreyGoatTimer


## Init.
##
## Connects the spawn timers to spawn handler for each enemy type.
func _ready() -> void:

    grey_goat_timer.timeout.connect(
        handle_spawn.bind(grey_goat_scene, grey_goat_timer)
    )
