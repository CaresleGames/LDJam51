class_name GameTimer
extends Timer

signal stop_timer()

func _ready() -> void:
	add_to_group(Groups.game_timer)
	connect("stop_timer", self, "_on_stop_timer")


func _on_GameTimer_timeout() -> void:
	GameManager.emit_signal("level_restart")


func _on_stop_timer() -> void:
	stop()
	print("timer stop")
