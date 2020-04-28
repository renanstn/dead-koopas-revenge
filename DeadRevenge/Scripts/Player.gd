extends KinematicBody2D

const GRAVITY = 20
const FLY_POWER = 10
const V_SPEED_LIMIT = 80
const UP = Vector2(0, -1)
const JUMP_FORCE = 300

export (PackedScene) var bone
onready var anim_player = $AnimationPlayer
onready var anim_effects = $AnimationEffects
onready var bone_spawn = $BoneSpawnPoint
onready var timer_vulnerable = $TimerVulnerable
var motion : Vector2 = Vector2()
var sprite_mount : Sprite
var can_hit : bool = true
var mounted : bool

func _ready():
	anim_player.play("walking")

# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y += GRAVITY
	if mounted:
		if Input.is_action_just_pressed("jump"):
			jump()
	else:
		if is_on_floor() and Input.is_action_just_pressed("jump"):
			jump()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	motion = move_and_slide(motion, UP)

func jump():
	motion.y = -JUMP_FORCE

func shoot():
	anim_player.play("attacking")

func take_damage():
	if can_hit:
		if mounted:
			unmount()
		else:
			can_hit = false
			Global.lives -= 1
			if Global.lives <= 0:
				die()
			else:
				timer_vulnerable.start()
				anim_effects.play("damage")

func mount_ghost(ghost_type : String):
	mounted = true
	sprite_mount = get_node("Mount_" + ghost_type)
	sprite_mount.show()

func unmount():
	sprite_mount.hide()
	mounted = false
	can_hit = false
	timer_vulnerable.start()
	anim_effects.play("damage")

func die():
	Global.reset()
	get_tree().reload_current_scene()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attacking":
		anim_player.play("walking")
		var new_bone = bone.instance()
		new_bone.global_position = bone_spawn.global_position
		get_parent().add_child(new_bone)

func _on_HUD_jump():
	if mounted:
		jump()
	if not mounted and is_on_floor():
		jump()

func _on_HUD_shoot():
	shoot()

func _on_AnimationEffects_animation_finished(anim_name):
	pass

func _on_TimerVulnerable_timeout():
	can_hit = true
