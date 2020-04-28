extends Control

signal jump
signal shoot

func _ready():
	show()

func _on_JumpButton_pressed():
	emit_signal("jump")

func _on_ShootButton_pressed():
	emit_signal("shoot")
