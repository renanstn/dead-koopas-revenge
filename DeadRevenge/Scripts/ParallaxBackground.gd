extends ParallaxBackground

onready var parallax_layer = $ParallaxLayer
var SPEED : float = Global.parallax_speed

func _process(delta):
	# Movimento do parallax
	var movement = Vector2(-SPEED, 0)
	parallax_layer.motion_offset += movement * delta
