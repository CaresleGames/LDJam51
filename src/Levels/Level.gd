class_name Level
extends Node2D

signal level_start()
signal level_end()

export var next_level : String


func _ready() -> void:
	add_to_group(Groups.level)
	connect("level_start", self, "_on_level_start")
	connect("level_end", self, "_on_level_end")
	
	yield(get_tree().create_timer(.25), "timeout")
	emit_signal("level_start")


func _on_level_start() -> void:
	var timers = get_tree().get_nodes_in_group(Groups.game_timer)
	if timers.size() > 0:
		var game_timer : GameTimer = timers[0]
		game_timer.start()


func _on_level_end() -> void:
	if not next_level == "":
		get_tree().change_scene(next_level)
