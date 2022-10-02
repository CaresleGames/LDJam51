extends Control

export var scene : PackedScene


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_jump"):
		get_tree().change_scene_to(scene)
	if Input.is_action_just_pressed("ui_exit"):
		get_tree().quit()

func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Start_pressed() -> void:
	get_tree().change_scene_to(scene)
