extends BaseCollectable

func do_pickup_action() -> void:
	if TorchManager.ref.has_torch():
		return	
	TorchManager.ref.get_torch()
	queue_free()
