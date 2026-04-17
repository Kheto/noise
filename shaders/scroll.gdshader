shader_type spatial;

uniform sampler2D textureImage : source_color;

void vertex() {
}

void fragment() {
    float scrollSpeed = 2.0;
    float moveAmount = TIME * scrollSpeed;
    vec2 adm = vec2(moveAmount*2.0, moveAmount);
    vec4 tex = texture(textureImage, UV + moveAmount);
    ALBEDO = tex.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
