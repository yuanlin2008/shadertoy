#include "common.glsl"

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    float clr = 0.0;
    clr += inRect(vec2(0.,0.),iTime*1., vec2(5.4, 0.0), 0.04, pos);
    clr += inCircle(vec2(0.0,0.0), 0.1, 0.3, pos);
    fragColor = vec4(clr, clr, clr, 1);
}