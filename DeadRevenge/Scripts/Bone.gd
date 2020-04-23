extends Area2D

const VELOCITY = 150
onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("going")

func _process(delta):
	position.x += VELOCITY * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bone_area_entered(area):
	if "enemy" in area.get_groups():
		area.kill()
		# play sound
		queue_free()
