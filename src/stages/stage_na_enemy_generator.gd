extends EnemyGenerator

@export var grey_goat_scene: PackedScene
@export var black_goat_scene: PackedScene

@onready var grey_goat_timer: Timer = $GreyGoatTimer
@onready var black_goat_timer: Timer = $BlackGoatTimer


## Init.
##
## Connects the spawn timers to spawn handler for each enemy type.
func _ready() -> void:

    # wire the signal from game_stats re: score changing
    super()

    grey_goat_timer.timeout.connect(
        handle_spawn.bind(grey_goat_scene, grey_goat_timer)
    )

    black_goat_timer.timeout.connect(
        handle_spawn.bind(black_goat_scene, black_goat_timer)
    )


func update_spawn_pattern(score: int) -> void:
    pass
