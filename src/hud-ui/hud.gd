extends CanvasLayer


@export var game_stats: GameStats


@onready var h_split_container: HSplitContainer = $HSplitContainer
@onready var game_viewport: ReferenceRect = %GameViewport
@onready var health_bar: Node2D = %HealthBar


var play_area_width = ProjectSettings.get_setting("display/window/size/playable_area_width")


## Init.
##
## Ensures that the split offset of the container matches the value defined in project settings.
func _ready() -> void:

    h_split_container.split_offset = play_area_width
