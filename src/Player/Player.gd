class_name Player
extends KinematicBody2D

export var speed := 0
export var speed_acc : float = 0
export var speed_fri : float = 0
export var speed_air_acc : float = 0
export var speed_air_fri : float = 0

export var gravity : float = 0
export var jump_height : float = 0

var velocity := Vector2.ZERO
var direction = 1

var is_complete := false
var can_jump := false

onready var raycast_group : Node2D = $RaycastGroup
onready var raycast_left : RayCast2D = $RaycastGroup/Left
onready var raycast_center : RayCast2D = $RaycastGroup/Center
onready var raycast_right : RayCast2D = $RaycastGroup/Right

onready var anim : AnimationPlayer = $Anim
onready var sprite : Sprite = $Sprite

func _ready() -> void:
	add_to_group(Groups.player)


func get_input() -> float:
	return (
		Input.get_action_raw_strength("ui_right")
		- Input.get_action_raw_strength("ui_left")
	)


func _physics_process(delta: float) -> void:
	for ray in raycast_group.get_children():
		ray = ray as RayCast2D
		ray.force_raycast_update()
		if ray.is_colliding():
			can_jump = true
		else:
			can_jump = false
			


func velocity_apply(input: float, acc: float, fri: float) -> void:
	if input > 0:
		velocity.x = min(velocity.x + acc, speed)
		direction = 1
	elif input < 0:
		velocity.x = max(velocity.x - acc, -speed)
		direction = -1
	else:
		velocity.x = lerp(velocity.x, 0, fri)
	sprite.scale.x = direction
