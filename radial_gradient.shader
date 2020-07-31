shader_type canvas_item;
uniform vec4 color_from : hint_color;
uniform vec4 color_to : hint_color;
uniform vec2 center;
uniform vec2 border;

void fragment() {
	vec4 _tex_read = texture(TEXTURE, UV);
	float time, dist = distance(center, border);
	time = distance(UV, center) / dist;
	
	vec4 color;
	if (time >= 1.0) color = color_to;
	else color = (1.0 - time) * color_from + time * color_to;
	
	COLOR.rgb = _tex_read.rgb + color.rgb - vec3(1.0, 1.0, 1.0);
	COLOR.a = _tex_read.a * color.a;
}