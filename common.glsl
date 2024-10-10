/** Screen to world coord. */
vec2 screenToWorld(in vec2 fragCoord){
    vec2 pos = fragCoord / iResolution.xy - 0.5;
    pos.x *= iResolution.x/iResolution.y;
    return pos*2.0;
}

vec2 worldToLocal(in vec2 translation, in float rotation, in vec2 pos){
    float sin = sin(rotation);
    float cos = cos(rotation);
    return (inverse(mat3(
        vec3(cos, -sin, 0),
        vec3(sin, cos, 0),
        vec3(translation.xy, 1)
    )) * vec3(pos,1)).xy;
}

float checkCircle(in vec2 center, in float radius, in vec2 pos){
    return step(length(pos - center), radius);
}

float checkRectangle(in vec2 center, in float rot, in vec2 size, in vec2 pos){
    pos = worldToLocal(center, rot, pos);
    vec2 d = step(abs(pos - center), size);
    return d.x*d.y;
}