extends BaseLens

func _ready() -> void:
	shader_material.set_shader_parameter("fade_cutoff", 0)
	shader_material.set_shader_parameter("fade_intensity", 0)
	#start_lens()

func start_lens() -> void:
	var tween = create_tween()
	tween.set_trans(tween.TRANS_SPRING) 
	tween.tween_property(shader_material, "shader_parameter/fade_cutoff", .508, 4.0)
	tween.parallel().tween_property(shader_material, "shader_parameter/fade_intensity", 2.127, 4.0)

func reset_lens() ->void:
	var tween = create_tween()
	tween.tween_property(shader_material, "shader_parameter/fade_cutoff", .0, 1.0)
	tween.parallel().tween_property(shader_material, "shader_parameter/fade_intensity" ,0, 1.0)

	pass
