extends BaseCollectable


func do_pickup_action() -> void:
	GhostManager.ref.get_torch()
	pass
