shader_type spatial;

uniform sampler2D base_albedo_tex;
uniform sampler2D eyeballs_1;
uniform sampler2D eyeballs_2;
uniform sampler2D eyeballs_3;
uniform sampler2D eyeballs_4;
uniform float danger_level: hint_range(0.0, 1.0, 0.01);


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 base_albedo = texture(base_albedo_tex, 10.0*UV).rgb;
	vec4 eyeballs_1_color = texture(eyeballs_1, 10.0*UV);
	vec4 eyeballs_2_color = texture(eyeballs_2, 10.0*UV);
	vec4 eyeballs_3_color = texture(eyeballs_3, 10.0*UV);
	vec4 eyeballs_4_color = texture(eyeballs_4, 10.0*UV);
	
	vec3 darkened_base_albedo = mix(base_albedo, vec3(0.0), danger_level*danger_level);
	
	vec3 albedo_step_1 = mix(darkened_base_albedo, eyeballs_1_color.rgb, min(4.0 * danger_level * eyeballs_1_color.a, 1.0));
	vec3 albedo_step_2 = mix(albedo_step_1, eyeballs_2_color.rgb, clamp((4.0 * danger_level - 1.0) * eyeballs_2_color.a, 0.0, 1.0));
	vec3 albedo_step_3 = mix(albedo_step_2, eyeballs_3_color.rgb, clamp((4.0 * danger_level - 2.0) * eyeballs_3_color.a, 0.0, 1.0));
	vec3 albedo_step_4 = mix(albedo_step_3, eyeballs_4_color.rgb, clamp((4.0 * danger_level - 3.0) * eyeballs_4_color.a, 0.0, 1.0));
	
	ALBEDO = albedo_step_4;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
