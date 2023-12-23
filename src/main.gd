extends Node

@export var mob_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
    new_game() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

# Reset the game state. Also good for initialization.
# TO DO: The main menu should include a start button that calls this.
func new_game():

    # delete all lingering mobs
    get_tree().call_group("mobs", "queue_free")

    # place player at start position for the level
    # TO DO: place StartPosition at starting location. Location TBD.
    $Player.start($StartPosition.position)

    # Show the HUD once the game starts. It's hidden when viewing the main menu.
    # TO DO: flesh out HUD
    $HUD.show()

    $BG_Music.play()

    # Starts the "grace period" timer. Mobs don't start until the grace period ends.
    $GameStartTimer.start()


# Ends the game
func end_game():

    $MobTimer.stop()
    $BG_Music.stop()


# TO DO: accept arg for type, and maybe quantity
func spawn_new_mob():

    var mob = mob_scene.instantiate()

    # choose a random location along the spawn path to place the new mob instance

    var mob_spawn_location = get_node("MobSpawnPath/MobSpawnLocation")
    mob_spawn_location.progress_ratio = randf()

    mob.position = mob_spawn_location.position

    add_child(mob)


# Starts the mob timer after game start grace period ends
func _on_game_start_timer_timeout():

    $MobSpawnTimer.start()


# Spawns a new mob every tick.
func _on_mob_spawn_timer_timeout():

    spawn_new_mob()
