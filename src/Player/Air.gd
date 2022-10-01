class_name AirState
extends PlayerState

func enter(msg := {}) -> void:
	print('air state')
	if msg.has("jump"):
		if msg["jump"]:
			player.velocity.y = -player.jump_height
	
	
func physics_update(delta : float) -> void:
	player.velocity.y += player.gravity * delta
	
	var input_x := player.get_input()
	player.velocity_apply(input_x, player.speed_air_acc, player.speed_air_fri)
	
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	
	if player.is_on_floor():
		state_machine.transition_to("Run")
