extends Node

signal level_restart()
signal level_complete()

func _ready() -> void:
	connect("level_restart", self, "_on_level_restart")
	connect("level_complete", self, "_on_level_complete")
	
	
func _on_level_restart() -> void:
	var error = get_tree().reload_current_scene()
	if error != OK:
		print('there is an error in the restart level')


func _on_level_complete() -> void:
	var timers = get_tree().get_nodes_in_group(Groups.game_timer)
	var levels = get_tree().get_nodes_in_group(Groups.level)
	if timers.size() > 0:
		var timer : GameTimer = timers[0]
		print('level complete')
		timer.emit_signal("stop_timer")
	if levels.size() > 0:
		var level : Level = levels[0]
		level.emit_signal("level_end")
