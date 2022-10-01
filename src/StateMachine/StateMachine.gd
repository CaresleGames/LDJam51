class_name StateMachine
extends Node

export var init_state : NodePath

var state : State

func _ready() -> void:
	yield(get_parent(), "ready")
	state = get_node(init_state)
	
	for child in get_children():
		if child is State:
			child.state_machine = self
	state.enter()


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
	
func _unhandled_input(event: InputEvent) -> void:
	state.handled_input(event)


func transition_to(new_state: String, msg := {}) -> void:
	if not has_node(new_state):
		return
	
	state.exit()
	state = get_node(new_state)
	state.enter(msg)
