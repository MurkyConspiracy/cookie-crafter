shader_type canvas_item;

uniform vec4 light_blue = vec4(0.373, 0.804, 0.894, 1.0);
uniform vec4 dark_blue = vec4(0.388, 0.608, 1.0, 1.0);
uniform vec4 light_red = vec4(1.0, 0.2, 0.2, 1.0);
uniform vec4 dark_red = vec4(0.6, 0.0, 0.0, 1.0);
uniform float threshold : hint_range(0.0, 1.0) = 0.1;

void fragment() {
    vec4 pixel_color = texture(TEXTURE, UV);
    
    if (distance(pixel_color.rgb, light_blue.rgb) < threshold) {
        COLOR = vec4(light_red.rgb, pixel_color.a);
    } else if (distance(pixel_color.rgb, dark_blue.rgb) < threshold) {
        COLOR = vec4(dark_red.rgb, pixel_color.a);
    } else {
        COLOR = pixel_color;
    }
}