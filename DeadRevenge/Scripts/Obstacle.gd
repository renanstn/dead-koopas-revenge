extends Area2D

var SPEED = Global.parallax_speed

func _process(delta):
	var motion = Vector2(-SPEED, 0)
	position += motion * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Obstacle_body_entered(body):
	if body.name == "Player":
		body.take_damage()
