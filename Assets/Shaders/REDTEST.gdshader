shader_type canvas_item;

uniform vec4 light_blue = vec4(0.373, 0.804, 0.894, 1.0);
uniform vec4 dark_blue = vec4(0.388, 0.608, 1.0, 1.0);
uniform vec4 light_red = vec4(1.0, 0.2, 0.2, 1.0);
uniform vec4 dark_red = vec4(0.6, 0.0, 0.0, 1.0);
uniform float threshold : hint_range(0.0, 1.0) = 0.1;
uniform float shimmer_speed : hint_range(0.0, 2.0) = 0.005;
uniform float shimmer_intensity : hint_range(0.0, 0.1) = 0.003;
uniform float wave_scale : hint_range(1.0, 20.0) = 5.0;

void fragment() {
    vec4 pixel_color = texture(TEXTURE, UV);

    if (distance(pixel_color.rgb, light_blue.rgb) < threshold) {
        float wave = sin(UV.x * wave_scale + TIME * shimmer_speed) * 0.1;
        wave += sin(UV.y * wave_scale + TIME * shimmer_speed * 0.7) * 0.1;
        vec3 shimmer = light_red.rgb - wave * shimmer_intensity;
        COLOR = vec4(shimmer, pixel_color.a);
    } else if (distance(pixel_color.rgb, dark_blue.rgb) < threshold) {
        COLOR = vec4(dark_red.rgb, pixel_color.a);
    } else {
        COLOR = pixel_color;
    }
}