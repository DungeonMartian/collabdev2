extends Area3D

var player_nearby: bool = false

@onready var lock_1: MeshInstance3D = $door/Cube
@onready var lock_2: MeshInstance3D = $door/Cube_001
@onready var lock_3: MeshInstance3D = $door/Cube_002

var lock_array: Array[MeshInstance3D]

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	lock_array = [lock_1,lock_2,lock_3]
	
func _input(_event: InputEvent) -> void:
	if player_nearby and Input.is_action_just_pressed("Action"):
		if KeyManager.ref.key_count > 0:
			DoorManager.ref.unlock_door()
			remove_next_lock()
			if DoorManager.ref.get_locks_remaining() <= 0:
				_open_door()

func remove_next_lock() -> void:
	var lock_to_remove: MeshInstance3D = lock_array.pop_back()
	lock_to_remove.visible = false
				
func _open_door() -> void:
	queue_free()
	
func _on_body_entered(body) -> void:
	if body is Player:
		player_nearby = true
		
func _on_body_exited(body) -> void:
	if body is Player:
		player_nearby = false
