/*
	Custom Crosshair Shader by: Quot3e - https://github.com/Quot3e
	MIT License
*/

shader_type canvas_item;

uniform vec4 line_color : source_color = vec4(0,1,0, 0.8);
uniform vec3 line_outline_color : source_color = vec3(0.0);
uniform float line_thickness : hint_range(0.0, 1.0) = 0.2;
uniform float line_length : hint_range(0.0, 1.0) = 0.2;
uniform float line_offset : hint_range(0.0, 1.0) = 0.2;
uniform float line_outline_thickness : hint_range(0.0, 1.0) = 0.5;

uniform vec4 dot_color : source_color = vec4(0,1,0, 0.8);
uniform vec3 dot_outline_color : source_color = vec3(0.0);
uniform float dot_size : hint_range(0.0, 1.0) = 0.2;
uniform float dot_outline_thickness : hint_range(0.0, 1.0) = 0.5;

//fake :P
uniform float antialiasing : hint_range(0.0, 1.0) = 1.0;

float draw_crosshair_lines(vec2 uv, float outline) {
	float smoothing = clamp(antialiasing, 0.1, 1.0) * 0.01;
	float clamped_line_length = clamp(line_length, 0.01, 1.0);
	float clamped_line_thickness = clamp(line_thickness, 0.1, 1.0);
	float clamped_line_offset = clamp(line_offset, 0.0, 1.0);

	float adjusted_offset = 0.5 - (clamped_line_offset - outline) / 2.0;
	float adjusted_length = 0.5 - (clamped_line_length + clamped_line_offset + outline) / 2.0;
	float adjusted_thickness = 0.5 - (clamped_line_thickness * 0.1 + outline) / 2.0;

	float inner = 1.0 - smoothstep(adjusted_offset, adjusted_offset + smoothing, 1.0 - uv.x)
		* smoothstep(adjusted_offset, adjusted_offset + smoothing, uv.x);
	float outer = smoothstep(adjusted_length, adjusted_length + smoothing, 1.0 - uv.x)
		* smoothstep(adjusted_length, adjusted_length + smoothing, uv.x);
	float diagonal = smoothstep(adjusted_thickness, adjusted_thickness + smoothing, uv.y)
		* smoothstep(adjusted_thickness, adjusted_thickness + smoothing, 1.0 - uv.y);

	return inner * outer * diagonal;
}

float draw_circle(vec2 uv, float outline) {
	float smoothing = clamp(antialiasing, 0.1, 1.0) * 0.01;
	float clamped_dot_size = clamp(dot_size, 0.1, 1.0) * 0.1;
	return 1.0 - smoothstep(clamped_dot_size + outline - smoothing, clamped_dot_size + outline, distance(vec2(0.5), uv));
}

void fragment() {
	float crosshair = draw_crosshair_lines(UV.xy, 0.0) + draw_crosshair_lines(UV.yx, 0.0);
	float crosshair_outline = draw_crosshair_lines(UV.xy, line_outline_thickness * 0.05)
		+ draw_crosshair_lines(UV.yx, line_outline_thickness * 0.05);

	float center_dot = draw_circle(UV, 0.0);
	float center_dot_outline = draw_circle(UV, dot_outline_thickness * 0.025);

	COLOR.rgb = crosshair_outline * line_outline_color + center_dot_outline * dot_outline_color
		+ line_color.rgb * crosshair + center_dot * dot_color.rgb;

	COLOR.a = crosshair_outline + center_dot_outline;
	
	COLOR.a *= crosshair_outline * line_color.a + center_dot_outline * dot_color.a;
}
