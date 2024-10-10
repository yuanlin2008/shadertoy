/** Screen to world coord. */
vec2 screenToWorld(in vec2 fragCoord) {
    vec2 pos = fragCoord / iResolution.xy - 0.5;
    pos.x *= iResolution.x / iResolution.y;
    return pos * 2.0;
}

vec2 worldToLocal(in vec2 translation, in float rotation, in vec2 pos) {
    pos -= translation;
    float sin = sin(rotation);
    float cos = cos(rotation);
    return mat2(cos, sin, -sin, cos) * pos;
}

float distToCircle(in vec2 center, in float radius, in vec2 pos) {
    return length(pos - center) - radius;
}

float distToRect(in vec2 center, in float rot, in vec2 size, in vec2 pos) {
    pos = abs(worldToLocal(center, rot, pos))-size;
    return max(pos.x, pos.y);
}