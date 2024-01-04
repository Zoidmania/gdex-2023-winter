extends Node2D

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var present_timer: Timer = $PresentTimer
@onready var house = $House


var deliverable = false
# Called when the node enters the scene tree for the first time.
func _ready():
   house.play()
    

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if(deliverable):
        if(Input.is_action_just_pressed("santa_land_or_take_off") and present_timer.is_stopped()):
            progress_bar.show()
            present_timer.start()
    
    if( not present_timer.is_stopped()):
        progress_bar.value = present_timer.wait_time - present_timer.time_left  
    else:
        progress_bar.hide()
        
                  


func _on_area_2d_area_entered(area):
    
     # Replace with function body.
    if(area.get_parent().name == 'Sleigh'):
        print('player here')
        deliverable = true


func _on_area_2d_area_exited(area):
    if(area.get_parent().name == 'Sleigh'):
        print('player left')
        deliverable = false # Replace with function body.
