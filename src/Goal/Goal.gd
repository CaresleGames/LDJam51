extends Area2D



func _on_Goal_body_entered(body: KinematicBody2D) -> void:
	if body.is_in_group(Groups.player):
		body.is_complete = true
		GameManager.emit_signal("level_complete")
		
