shader_type canvas_item;

uniform float Strength : hint_range(0,20) = 5;
uniform float RandomOffset = 1.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
float random( float seed )
{
	return fract( 543.2543 * sin( dot( vec2( seed, seed ), vec2( 3525.46 + RandomOffset, -54.3415 ) ) ) );
}

void vertex()
{
	vec2 VERTEX_OFFSET = VERTEX;
	VERTEX_OFFSET.x += (
		random(
			( trunc( VERTEX_OFFSET.y))
		+ TIME
		) - 0.5
	) * Strength ;

	VERTEX_OFFSET.y += (
		random(
			( trunc( VERTEX_OFFSET.x))
		+	TIME
		) - 0.5
	) * Strength;
	
	VERTEX = VERTEX_OFFSET;
}

void fragment()
{
	COLOR = texture(SCREEN_TEXTURE, VERTEX);
}