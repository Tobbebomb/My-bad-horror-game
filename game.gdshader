shader_type spatial;
render_mode unshaded,diffuse_burley,specular_disabled;
uniform sampler2D texture_albedo : filter_linear_mipmap;
uniform float alpha : hint_range(0.0, 1.0) = 0.5;


uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
const int pixel_size = 5; 

void vertex() {

	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = SCREEN_UV;
	vec4 albedo_tex = texture(texture_albedo,uv);
	ALBEDO = albedo_tex.rgb;
	ALPHA = albedo_tex.a * alpha;


	float x = float(int(FRAGCOORD.x) % pixel_size);
	float y = float(int(FRAGCOORD.y) % pixel_size);
	
	x = FRAGCOORD.x + floor(float(pixel_size) / 2.0) - x;
	y = FRAGCOORD.y + floor(float(pixel_size) / 2.0) - y;
	
	ALBEDO = texture(SCREEN_TEXTURE, vec2(x, y) / VIEWPORT_SIZE).xyz;
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
