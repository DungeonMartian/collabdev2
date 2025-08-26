class_name TorchManager extends Node

static var ref: TorchManager

const MAX_FUEL: float = 100.

var _fuel_remaining: float = 100.:
	get:
		return _fuel_remaining
	set(val):
		if val <= 0.0:
			lose_torch()
			return
		_fuel_remaining = val
		DebugUI.ref.progress_torch_fuel.value = val
		

@export var _fuel_decrease_rate: float = 10.

## Does the player have a torch. do not call directly
var _has_torch : bool = false

func has_torch() -> bool:
	return _has_torch

## call this when the player gets a torch
func get_torch() -> void:
	_has_torch = true
	DebugUI.ref.debug_torch.visible = true
	GhostManager.ref.update_torch(true)
	GhostManager.ref.set_danger_percentage(0.)
	Player.ref.torch_visibility(true)
	

## call this when the player loses the torch
func lose_torch() -> void:
	_has_torch = false
	DebugUI.ref.debug_torch.visible = false
	GhostManager.ref.update_torch(false)
	Player.ref.torch_visibility(false)
	_fuel_remaining = MAX_FUEL

func _init() -> void:
	ref = self
	
func _process(delta: float) -> void:
	if not _has_torch:
		return
	
	_fuel_remaining -= _fuel_decrease_rate * delta
		
