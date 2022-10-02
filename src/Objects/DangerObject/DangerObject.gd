class_name DangerObject
extends GameObject



func _on_DangerObject_body_entered(body: KinematicBody2D) -> void:
	if body.is_in_group(Groups.player):
		GameManager.emit_signal("level_restart")
