extends Area2D

var speed = 750

func _physics_process(delta):
    position += transform.x * speed * delta
    


func _on_body_entered(body):
    #print(body.is_in_group('mobs'))
    #if body.is_in_group("mobs"):
        #body.queue_free()
    queue_free() 


func _on_visible_on_screen_notifier_2d_screen_exited():
    queue_free()