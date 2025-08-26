extends Node3D

@onready var mesh: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	mesh.visible = false
