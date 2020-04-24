extends Position2D

export (PackedScene) var obstacle
export (bool) var active = true
onready var timer : Timer = $SpawnTimer

func _ready():
	reload_timer()

func _on_SpawnTimer_timeout():
	if active:
		var new_obstacle = obstacle.instance()
		new_obstacle.global_position = position
		get_parent().add_child(new_obstacle)
		reload_timer()

func reload_timer():
	var next_time = rand_range(3, 6)
	timer.wait_time = next_time
	timer.start()
