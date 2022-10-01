class_name UILevel
extends Control

var game_timer : GameTimer

onready var label_timer : Label = $HBoxContainer/TimeLeft


func _ready() -> void:
	yield(owner, "ready")
	var timers = get_tree().get_nodes_in_group(Groups.game_timer)
	if timers.size() > 0:
		game_timer = timers[0]


func _process(_delta: float) -> void:
	label_timer.text = str(int(game_timer.time_left))
