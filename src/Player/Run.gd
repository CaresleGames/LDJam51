class_name RunState
extends PlayerState

func enter(_msg := {}) -> void:
	print('run')
	
	
func physics_update(_delta: float) -> void:
	var input_x := player.get_input()
	player.velocity_apply(input_x, player.speed_acc, player.speed_fri)
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if is_equal_approx(player.velocity.x, 0) and is_equal_approx(input_x, 0):
		state_machine.transition_to("Idle")
	
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		
	if Input.is_action_just_pressed("ui_jump"):
		state_machine.transition_to("Air", { jump = true})
