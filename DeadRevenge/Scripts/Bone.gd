extends Area2D

const VELOCITY = 3
onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("going")

func _process(delta):
	position.x += VELOCITY
