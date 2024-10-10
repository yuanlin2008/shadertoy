#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    float clr = checkRectangle(vec2(0.0,0.0),1.0, vec2(0.5, 0.8), pos);
    // Output to screen
    fragColor = vec4(clr, clr, clr, 1);
}