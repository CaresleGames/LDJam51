class_name GameObject
extends Area2D

export (Groups.ObjectGroup) var group = Groups.ObjectGroup.NONE


func _ready() -> void:
	if group == Groups.ObjectGroup.DANGER:
		add_to_group(Groups.object_danger)
