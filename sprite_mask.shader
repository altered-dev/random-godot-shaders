shader_type canvas_item;
uniform sampler2D mask;

void fragment() {
	vec4 _tex_read = texture(TEXTURE, UV.xy);
	vec4 _mask = texture(mask, UV.xy);
	COLOR.rgb = _tex_read.rgb;
	COLOR.a = _tex_read.a * _mask.a;
}