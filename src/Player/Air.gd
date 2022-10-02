class_name AirState
extends PlayerState

func enter(msg := {}) -> void:
	print('air state')
	if msg.has("jump"):
		if msg["jump"]:
			player.velocity.y = -player.jump_height
	
	
func physics_update(delta : float) -> void:
	if player.is_complete:
		return
	
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if not player.is_on_floor():
		player.velocity.y += player.gravity * delta
		
	var input_x := player.get_input()
	player.velocity_apply(input_x, player.speed_air_acc, player.speed_air_fri)
	
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
	
	if Input.is_action_just_pressed("ui_jump") and player.can_jump:
		state_machine.transition_to("Air", {jump=true})
