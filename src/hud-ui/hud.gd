extends CanvasLayer
class_name  game_hud

@onready var ui_panel = $HSplitContainer/UIPanel
@onready var done_deliveries = $HSplitContainer/UIPanel/doneDeliveries
@onready var total_deliveries = $HSplitContainer/UIPanel/totalDeliveries

@onready var h_split_container: HSplitContainer = $HSplitContainer
@onready var health_bar: HealthBar = $HSplitContainer/UIPanel/HealthBar

@export var game_stats: GameStats

var play_area_width = ProjectSettings.get_setting("display/window/size/playable_area_width")

signal done_all_deliveries


## Init.
##
## Ensures that the split offset of the container matches the value defined in project settings.
func _ready() -> void:

    game_stats.score = 0
    total_deliveries.text = str(game_stats.required_score)
    done_deliveries.text = str(game_stats.score)
    h_split_container.split_offset = play_area_width


func complete_delivery() -> void:

    game_stats.score += 1
    done_deliveries.text = str(game_stats.score)
    if game_stats.score == 10:
        done_all_deliveries.emit()

