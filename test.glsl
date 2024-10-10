#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    float clr = 0.0;
    clr += inCircle(vec2(0.0,0.0), 0.2, 0.1, pos);
    clr += inRect(vec2(0.8,0.4),iTime, vec2(5.4, 0.0), 0.02, pos);
    fragColor = vec4(clr, clr, clr, 1);
}