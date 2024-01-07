extends Node
@onready var stage_north_america = $"."
@onready var hud: game_hud = $HUD


func _on_hud_done_all_deliveries():
    print('boss spawn') # Replace with function body.
   
    
    get_tree().change_scene_to_file('res://stages/stage_antarctica.tscn')


func _on_house_generator_delivery_completed():
    hud.complete_delivery() # Replace with function body.
