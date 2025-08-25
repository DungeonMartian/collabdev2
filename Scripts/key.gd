extends BaseCollectable

## there are only 3 keys, maybe we make those keys further inherited scenes
@export var _key_num : int:
	get:
		return _key_num
	set(val):
		_key_num = clampi(val, 0,2)
		_key_num = val

func do_pickup_action() -> void:
	DoorManager.ref.unlock_door()
	# TODO an animation
	queue_free()
