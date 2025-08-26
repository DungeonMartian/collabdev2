##The manager for ghost related events 
class_name GhostManager extends Node

static var ref : GhostManager 

signal danger_level_changed(level: int)

func _init() -> void: 
	ref = self

## the current danger level
var _danger_level : int = 0:
	get:
		return _danger_level
	set(val):
		val = clampi(val,0,5)
		if _danger_level == val:
			return
		_danger_level = val
		danger_level_changed.emit(get_danger_level())

## The percentage of the current level. Increases over time if the player does not have a torch
var _danger_percentage : float = 0.0:
	get:
		return _danger_percentage
	set(val):
		if val >= 100.0:
			_danger_percentage = 0
			increase_danger_level()
			return
		_danger_percentage = val

## Does the player have a torch. do not call directly
var _has_torch : bool = false

## the rate modified by delta that the danger percentage increases over time
var _danger_increase_rate : float = 10

func get_danger_percentage() -> float:
	return _danger_percentage

## used to set danger val to a specific value. can be called by ghost encounters, or by getting key
func set_danger_level(level : int) -> void:
	_danger_level = level

## used to get danger val
func get_danger_level() -> int:
	return _danger_level

## called when the danger percent is over its value
func increase_danger_level() -> void:
	_danger_level = _danger_level+1

## call this when the player gets a torch
func get_torch() -> void:
	_has_torch = true

## call this when the player loses the torch
func lose_torch() -> void:
	_has_torch = false

func _process(delta: float) -> void:
	if _danger_level >= 5:
		_danger_percentage = 0.
		return
	if ! _has_torch:
		_danger_percentage += _danger_increase_rate * delta
		return
	
	_danger_percentage -= _danger_increase_rate * delta
	
