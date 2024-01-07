extends Node
@onready var stage_north_america = $"."
@onready var hud: game_hud = $HUD
const KRAMPUS = preload("res://enemies/krampus.tscn")

func _on_hud_done_all_deliveries():
    print('boss spawn') # Replace with function body.
    var boss:Krampus = KRAMPUS.instantiate()
    boss.position = Vector2(0, 50)
    boss.target = $Sleigh
    get_tree().current_scene.call_deferred("add_child", boss)


func _on_house_generator_delivery_completed():
    hud.complete_delivery() # Replace with function body.
