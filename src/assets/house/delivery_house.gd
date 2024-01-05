extends House
class_name DeliveryHouse
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var present_timer: Timer = $PresentTimer
@onready var house = $House

signal lockdown
signal release
var deliverable = false
var delivered = false


## Called on input events.
func _input(event: InputEvent) -> void:

    var can_start_delivering = deliverable and \
        not delivered and \
        event is InputEventKey and \
        event.is_action_pressed("santa_land_or_take_off") and \
        present_timer.is_stopped()

    if can_start_delivering:
        progress_bar.show()
        present_timer.start()
        lockdown.emit()


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

    if not present_timer.is_stopped():
        progress_bar.value = present_timer.wait_time - present_timer.time_left
    else:
        progress_bar.hide()


func _on_area_2d_area_entered(area):
    if area.get_parent().name == 'Sleigh':
        deliverable = true


func _on_area_2d_area_exited(area):
    if area.get_parent().name == 'Sleigh':
        deliverable = false


func _on_present_timer_timeout():
    release.emit()
    delivered = true
