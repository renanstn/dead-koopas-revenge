extends ParallaxBackground

onready var parallax_layer = $ParallaxSky
onready var parallax_floor = $ParallaxFloor

func _process(delta):
	var speed : float = Global.parallax_speed
	# Movimento do parallax
	var movement_bg = Vector2(-speed / 2, 0)
	var movement_floor = Vector2(-speed, 0)
	parallax_layer.motion_offset += movement_bg * delta
	parallax_floor.motion_offset += movement_floor * delta
