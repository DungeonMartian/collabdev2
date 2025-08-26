extends BaseLens

#shader_material.set_shader_parameter("radius", 1)
func _ready() -> void:
	shader_material.set_shader_parameter("strength", 0)
	#start_lens()

func start_lens() -> void:
	var tween = create_tween()
	tween.set_trans(tween.TRANS_SPRING) 
	tween.tween_property(shader_material, "shader_parameter/strength", 40.0, 4.0)
