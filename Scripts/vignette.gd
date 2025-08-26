extends BaseLens

func _ready() -> void:
#start_lens()
	shader_material.set_shader_parameter("radius", 0)
	shader_material.set_shader_parameter("softness", 0)


func start_lens() -> void:
	var tween = create_tween()
	tween.set_trans(tween.TRANS_CIRC) 
	tween.tween_property(shader_material, "shader_parameter/radius", .214, 5.0)
	tween.parallel().tween_property(shader_material, "shader_parameter/softness", .315, 5.0)


func reset_lens() ->void:
	var tween = create_tween()
	tween.set_trans(tween.TRANS_CIRC) 
	tween.tween_property(shader_material, "shader_parameter/radius", 1, 1.0)
	tween.parallel().tween_property(shader_material, "shader_parameter/softness", 1, 1.0)
