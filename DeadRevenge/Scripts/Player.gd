extends KinematicBody2D


const GRAVITY = 20
const UP = Vector2(0, -1)
const JUMP_FORCE = 350

export (PackedScene) var bone
onready var anim_player = $AnimationPlayer
onready var bone_spawn = $BoneSpawnPoint
var motion : Vector2 = Vector2()
var can_flu : bool = false

func _ready():
	anim_player.play("walking")

func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_just_pressed("jump"):
		jump()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	motion = move_and_slide(motion)
	
func jump():
	motion.y -= JUMP_FORCE

func shoot():
	anim_player.play("attacking")

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
