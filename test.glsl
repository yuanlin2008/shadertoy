#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    float clr = SDFRect(vec2(0.8,0.4),iTime, vec2(0.4, 0.2), 0.1, pos);
    //float clr = SDFCircle(vec2(0.8,0.4), 0.2, 0.3, pos);
    // Output to screen
    fragColor = vec4(clr, clr, clr, 1);
}