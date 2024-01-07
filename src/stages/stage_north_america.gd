extends Stage

@onready var stage_north_america = $"."


func _on_hud_done_all_deliveries():

    get_tree().change_scene_to_file('res://stages/stage_antarctica.tscn')


func _on_house_generator_delivery_completed():
    hud.complete_delivery() # Replace with function body.
