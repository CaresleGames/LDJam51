extends Control

export var scene : PackedScene

func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Start_pressed() -> void:
	get_tree().change_scene_to(scene)
