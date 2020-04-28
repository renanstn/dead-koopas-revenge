extends Node

var score : int = 0
var lives : int = 3
var parallax_speed : float = 80
var spawn_time_range = [1, 5]

func increase_speed():
	parallax_speed += 5
#	print(parallax_speed)
	if fmod(parallax_speed, 50) == 0:
		decrease_spawn_time()

func decrease_spawn_time():
#	print("decrease spawn")
	spawn_time_range[0] -= 1
	spawn_time_range[1] -= 1
	spawn_time_range[0] = clamp(spawn_time_range[0], 0.3, 5)
	spawn_time_range[1] = clamp(spawn_time_range[1], 1, 5)

func reset():
	score = 0
	lives = 3
	parallax_speed = 80
	spawn_time_range = [1, 5]
