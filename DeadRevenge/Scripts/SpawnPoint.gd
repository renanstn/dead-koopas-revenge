extends Position2D

export (PackedScene) var enemy
export (bool) var active = true
onready var timer : Timer = $SpawnTimer
var types = ["A", "B", "C"]

func _ready():
	reload_timer()

func _on_SpawnTimer_timeout():
	if active:
		var ghost = enemy.instance()
		ghost.type = types[randi() % types.size()]
		ghost.global_position = position
		get_parent().add_child(ghost)
		reload_timer()

func reload_timer():
	var next_time = rand_range(
		Global.spawn_time_range[0],
		Global.spawn_time_range[1]
	)
	timer.wait_time = next_time
	timer.start()
