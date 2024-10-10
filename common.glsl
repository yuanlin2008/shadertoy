/** Screen to world coord. */
vec2 screenToWorld(in vec2 fragCoord){
    vec2 pos = fragCoord / iResolution.xy - 0.5;
    pos.x *= iResolution.x/iResolution.y;
    return pos*2.0;
}

vec2 worldToLocal(in vec2 translation, in float rotation, in vec2 pos){
    pos -= translation;
    float sin = sin(rotation);
    float cos = cos(rotation);
    return mat2(
        cos, sin,
        -sin, cos
    ) * pos;
}

float SDFCircle(in vec2 center, in float radius, float edge, in vec2 pos){
    return 1.-smoothstep(radius, radius + edge, length(pos - center));
}

float SDFRect(in vec2 center, in float rot, in vec2 size, float edge, in vec2 pos){
    pos = worldToLocal(center, rot, pos);
    vec2 d = vec2(1) - smoothstep(size, size + vec2(edge), abs(pos));
    return d.x*d.y;
}