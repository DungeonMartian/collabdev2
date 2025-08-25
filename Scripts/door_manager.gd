class_name DoorManager extends Node

static var ref : DoorManager 

func _init() -> void: 
	ref = self

var _locks_remaining : int = 3:
	get:
		return _locks_remaining
	set(val):
		val = clampi(val, 0, 3)
		if val == _locks_remaining:
			return
		_locks_remaining = val
		
		if _locks_remaining == 0:
			open_main_gate()


func unlock_door() -> void:
	_locks_remaining -=1


func open_main_gate() -> void:
	# I'm not sure here tbhtbhtbh
	pass
