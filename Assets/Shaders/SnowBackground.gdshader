shader_type canvas_item;

uniform float darkness : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec4 pixel_color = texture(TEXTURE, UV);
    COLOR = mix(pixel_color, vec4(0.0, 0.0, 0.0, pixel_color.a), darkness);
}