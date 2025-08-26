class_name KeyManager extends Node

static var ref: KeyManager

@export var max_keys: int = 3

var key_count: int:
	set(value):
		if key_count < max_keys:
			key_count = value
		
		DebugUI.ref.label_key_count.text = str(value)

func _init() -> void:
	ref = self
	
func get_key_count() -> int:
	return key_count
