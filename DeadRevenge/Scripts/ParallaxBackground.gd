extends ParallaxBackground

onready var parallax_layer = $ParallaxSky
onready var parallax_floor = $ParallaxFloor
var SPEED : float = Global.parallax_speed

func _process(delta):
	# Movimento do parallax
	var movement_bg = Vector2(-SPEED / 2, 0)
	var movement_floor = Vector2(-SPEED, 0)
	parallax_layer.motion_offset += movement_bg * delta
	parallax_floor.motion_offset += movement_floor * delta
