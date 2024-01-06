extends CanvasLayer
class_name  game_hud


@onready var ui_panel = $HSplitContainer/UIPanel
@onready var delivery_labels: Control = $HSplitContainer/UIPanel/DeliveryLabels
@onready var total_deliveries: Label = $HSplitContainer/UIPanel/DeliveryLabels/totalDeliveries
@onready var done_deliveries: Label = $HSplitContainer/UIPanel/DeliveryLabels/doneDeliveries

@onready var h_split_container: HSplitContainer = $HSplitContainer
@onready var health_bar: PlayerHealthBar = $HSplitContainer/UIPanel/PlayerHealthBar

@onready var pause_screen_layer: CanvasLayer = $PauseScreenLayer
@onready var pause_text_layer: CanvasLayer = $PauseScreenLayer/PauseTextLayer

@export var game_stats: GameStats
# If it's a boss stage, set to true.
@export var is_boss_stage:= false

var play_area_width = ProjectSettings.get_setting("display/window/size/playable_area_width")

signal done_all_deliveries


## Init.
##
## Ensures that the split offset of the container matches the value defined in project settings.
func _ready() -> void:

    pause_screen_layer.hide()
    pause_text_layer.hide()

    if is_boss_stage:

        delivery_labels.hide()

    else:

        game_stats.score = 0
        total_deliveries.text = str(game_stats.required_score)
        done_deliveries.text = str(game_stats.score)

    h_split_container.split_offset = play_area_width


func _process(delta: float) -> void:
    if Input.is_action_just_pressed("ui_cancel"):
        if get_tree().paused:
            process_mode = Node.PROCESS_MODE_PAUSABLE
            get_tree().paused = false
            pause_screen_layer.hide()
            pause_text_layer.hide()

        else:
            process_mode = Node.PROCESS_MODE_WHEN_PAUSED
            get_tree().paused = true
            pause_screen_layer.show()
            pause_text_layer.show()


func complete_delivery() -> void:

    game_stats.score += 1
    done_deliveries.text = str(game_stats.score)
    if game_stats.score == 10:
        done_all_deliveries.emit()

