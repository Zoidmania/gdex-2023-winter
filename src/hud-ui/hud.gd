extends CanvasLayer
class_name  game_hud
@onready var ui_panel = $HSplitContainer/UIPanel
@onready var done_deliveries = $HSplitContainer/UIPanel/doneDeliveries
@onready var total_deliveries = $HSplitContainer/UIPanel/totalDeliveries

@onready var h_split_container: HSplitContainer = $HSplitContainer
@onready var health_bar: HealthBar = $HSplitContainer/UIPanel/HealthBar
@export var completed_deliveries = 0
@export var needed_deliveries = 10

signal done_all_deliveries
var play_area_width = ProjectSettings.get_setting("display/window/size/playable_area_width")


## Init.
##
## Ensures that the split offset of the container matches the value defined in project settings.
func _ready() -> void:
    total_deliveries.text = '10'
    done_deliveries.text = '0'
    h_split_container.split_offset = play_area_width

func complete_delivery() -> void:
    done_deliveries.text = str(int(done_deliveries.text) + 1)
    if done_deliveries.text == '10':
        done_all_deliveries.emit()

