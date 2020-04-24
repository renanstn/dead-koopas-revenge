extends KinematicBody2D

const GRAVITY = 20
const UP = Vector2(0, -1)
const JUMP_FORCE = 300

export (PackedScene) var bone
onready var anim_player = $AnimationPlayer
onready var anim_effects = $AnimationEffects
onready var bone_spawn = $BoneSpawnPoint
var motion : Vector2 = Vector2()
var can_flu : bool = false
var can_hit : bool = true

func _ready():
	anim_player.play("walking")

func _physics_process(delta):
	motion.y += GRAVITY
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	motion = move_and_slide(motion, UP)

func jump():
	motion.y -= JUMP_FORCE

func shoot():
	anim_player.play("attacking")

func take_damage():
	if can_hit:
		can_hit = false
		Global.lives -= 1
		if Global.lives <= 0:
			die()
		else:
			anim_effects.play("damage")

func die():
	get_tree().quit()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attacking":
		anim_player.play("walking")
		var new_bone = bone.instance()
		new_bone.global_position = bone_spawn.global_position
		get_parent().add_child(new_bone)

func _on_HUD_jump():
	jump()

func _on_HUD_shoot():
	shoot()

func _on_AnimationEffects_animation_finished(anim_name):
	if anim_name == "damage":
		can_hit = true
