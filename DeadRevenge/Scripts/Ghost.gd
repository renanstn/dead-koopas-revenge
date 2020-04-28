extends Area2D

export (String, "A", "B", "C") var type

var sprite : Sprite
var anim_player : AnimationPlayer
var player : KinematicBody2D
var SPEED = Global.parallax_speed

# ---------------------------------------------------------
func _ready():
	sprite = get_node("Sprite_" + type)
	anim_player = get_node("AnimationType_" + type)
	sprite.show()
	anim_player.play("flying")
	player = get_parent().get_node("Player")

func _process(delta):
	var motion = Vector2(-SPEED, 0)
	position += motion * delta
# ---------------------------------------------------------

func kill():
	Global.score += 1
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Ghost_body_entered(body):
	if body.name == "Player":
		body.take_damage()
		queue_free()

func _on_Head_body_entered(body):
	if body.name == "Player" and not body.mounted and body.can_hit:
		body.mount_ghost(type)
		queue_free()
