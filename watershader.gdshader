shader_type canvas_item;
uniform sampler2D noise: repeat_enable;
uniform sampler2D screen: hint_screen_texture;
uniform float distort: hint_range(-1, 1) = 0.05;
uniform vec2 scroll = vec2(0.1, 0.1);
void fragment() {
	if (texture(TEXTURE, UV)[3] != 1.0) {
		discard;
	}
	vec4 noisecol = texture(noise, UV + scroll * TIME);
	vec4 screencol = texture(screen, SCREEN_UV + distort * noisecol.rr);
	vec4 funcol = mix(screencol, noisecol, 0.6);
	COLOR = mix(funcol, texture(TEXTURE, UV), 0.3);
}