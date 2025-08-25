extends Area3D
class_name WaterSlow

@export var _is_deep_water : bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		# run the helper function to reduce the players speed
		if _is_deep_water:
			GhostManager.ref.lose_torch()
