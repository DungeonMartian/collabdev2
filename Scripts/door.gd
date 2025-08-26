extends Area3D

var player_nearby: bool = false

@onready var label: Label3D = %Label3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _input(_event: InputEvent) -> void:
	if player_nearby and Input.is_action_just_pressed("Action"):
		if KeyManager.ref.key_count > 0:
			DoorManager.ref.unlock_door()
			label.text = str(DoorManager.ref.get_locks_remaining())
			if DoorManager.ref.get_locks_remaining() <= 0:
				_open_door()
				
func _open_door() -> void:
	queue_free()
	
func _on_body_entered(body) -> void:
	if body is Player:
		player_nearby = true
		
func _on_body_exited(body) -> void:
	if body is Player:
		player_nearby = false
