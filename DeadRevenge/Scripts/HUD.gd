extends Control

signal jump
signal shoot

var player

func _ready():
	player = get_parent().get_parent().get_parent().get_node("Player")
	show()

func _on_JumpButton_pressed():
	if player.is_on_floor():
		emit_signal("jump")

func _on_ShootButton_pressed():
	emit_signal("shoot")
