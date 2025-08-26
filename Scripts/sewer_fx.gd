extends Node3D

const MATERIAL_SMOOTHING: float = 4.0

func _ready():
	GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)
	

func _on_danger_level_changed(danger):
	var danger_tween: Tween = get_tree().create_tween()
	danger_tween.tween_property(self.material_override, "shader_parameter/danger_level", danger / 5.0, MATERIAL_SMOOTHING)
