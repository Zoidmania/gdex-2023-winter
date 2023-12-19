extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

# Reset the game state. Also good for initialization.
func reset():

    # delete all lingering mobs
    get_tree().call_group("mobs", "queue_free")

    # place player at start position for the level
    # TO DO: place StartPosition at starting location. Location TBD.
    $Player.start($StartPosiiton.position)

    # Show the HUD once the game starts. It's hidden when viewing the main menu.
    # TO DO: flesh out HUD
    $HUD.show()

    $BG_Music.play()


