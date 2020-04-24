extends Area2D

enum GHOST_ACT {
	stand,
	moving,
	faster
}
export (GHOST_ACT) var type
onready var anim_player = $AnimationPlayer
var SPEED = Global.parallax_speed

func _ready():
	anim_player.play("flying")

func _process(delta):
	
	var motion = Vector2(-SPEED, 0)
	position += motion * delta
	if type == GHOST_ACT.moving:
		pass
#		tween.interpolate_property(
#			self,
#			"position",
#			Vector2(30,0),
#			Vector2(30,100),
#			1,
#			Tween.TRANS_CUBIC,
#			Tween.EASE_IN_OUT
#		)
#		tween.start()

func kill():
	Global.score += 1
	queue_free()

func _on_GhostA_body_entered(body):
	if body.name == "Player":
		body.take_damage()

func _on_GhostB_body_entered(body):
	if body.name == "Player":
		body.take_damage()

func _on_GhostC_body_entered(body):
	if body.name == "Player":
		body.take_damage()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
