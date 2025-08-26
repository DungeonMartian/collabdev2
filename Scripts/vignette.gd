extends BaseLens

func _ready() -> void:
	start_lens()


func start_lens() -> void:
	var tween = create_tween()
	tween.set_trans(tween.TRANS_CIRC) 
	tween.tween_property(shader_material, "shader_parameter/radius", .214, 5.0)
	tween.parallel().tween_property(shader_material, "shader_parameter/radius", .315, 5.0)
	pass
