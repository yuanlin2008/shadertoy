#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    float clr = 0.0;
    clr += smoothstep(0., 0.1, 0.1-distToRect(vec2(0.,0.),iTime, vec2(5.4, 0.01), pos));
    clr += smoothstep(0., 0.1, 0.1-distToCircle(vec2(0.0,0.0), 0.2, pos));
    fragColor = vec4(clr, clr, clr, 1);
}