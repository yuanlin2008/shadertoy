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

float distToHeart(in vec2 center, in float rot,in float size, in vec2 pos){
    pos = worldToLocal(center, rot, pos);
    float x = pos.x;
    float y = pos.y;
    float xx = x*x;
    float yy = y*y;
    float yyy = yy*y;
    float group = xx + yy - size;
    return group * group * group - xx * yyy;
}