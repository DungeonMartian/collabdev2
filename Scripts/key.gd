extends BaseCollectable

## there are only 3 keys, maybe we make those keys further inherited scenes
@export var _key_num : int:
	get:
		return _key_num
	set(val):
		_key_num = clampi(val, 0,2)
		_key_num = val

var 	rotation_speed: float = 1.4

func _process(delta: float) -> void:
	global_rotate(Vector3.UP, rotation_speed * delta)	

func do_pickup_action() -> void:
	KeyManager.ref.key_count += 1
	GhostManager.ref.set_danger_level(0)
	GhostManager.ref.set_danger_percentage(0)
	queue_free()
