#include "common.glsl"

float fill(in float dist, in float edge){
    return 1.0 - smoothstep(0.f, edge, dist);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 pos = screenToWorld(fragCoord);
    pos = mod(pos, 1.0)-0.5;
    vec3 bg = vec3(0.0);
    float rect1 = distToRect(vec2(0.0,0.0),iTime, vec2(0.4, 0.2), pos);
    float rect2 = distToRect(vec2(0.0,0.0),iTime, vec2(0.2, 0.4), pos);
    float circle = distToCircle(vec2(0.0,0.0), 0.4, pos);
    float c = fill(max(-circle, min(rect1, rect2)), 0.03);
    fragColor = vec4(mix(bg, vec3(1,1,0), c), 1);
}