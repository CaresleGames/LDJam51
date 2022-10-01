class_name Level
extends Node2D

signal level_start()

func _ready() -> void:
	connect("level_start", self, "_on_level_start")
	
	yield(get_tree().create_timer(1), "timeout")
	emit_signal("level_start")


func _on_level_start() -> void:
	var timers = get_tree().get_nodes_in_group(Groups.game_timer)
	if timers.size() > 0:
		var game_timer : GameTimer = timers[0]
		game_timer.start()
