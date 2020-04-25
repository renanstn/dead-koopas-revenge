extends Area2D

var SPEED = Global.parallax_speed

func _process(delta):
	var motion = Vector2(-SPEED, 0)
	position += motion * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
