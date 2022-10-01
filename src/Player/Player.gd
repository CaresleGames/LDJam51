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


func _ready() -> void:
	add_to_group(Groups.player)


func get_input() -> float:
	return (
		Input.get_action_raw_strength("ui_right")
		- Input.get_action_raw_strength("ui_left")
	)
	
func velocity_apply(input: float, acc: float, fri: float) -> void:
	if input > 0:
		velocity.x = min(velocity.x + acc, speed)
		direction = 1
	elif input < 0:
		velocity.x = max(velocity.x - acc, -speed)
		direction = -1
	else:
		velocity.x = lerp(velocity.x, 0, fri)
