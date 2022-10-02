class_name IdleState
extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:
	if player.is_complete:
		return
		
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	var input_x := player.get_input()
	if input_x != 0:
		state_machine.transition_to("Run")
	
	if not player.is_on_floor():
		state_machine.transition_to("Air")
	
	if Input.is_action_just_pressed("ui_jump"):
		state_machine.transition_to("Air", {jump = true})
