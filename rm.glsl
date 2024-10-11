float sdSphere(in vec3 pos, in vec3 center, in float radius) {
    return length(pos - center) - radius;
}

struct Camera {
    // camera world position
    vec3 pos;
    // camera target position
    vec3 tar;
    // camera roll
    float roll;
    // screen distance.
    float dist;
};

struct Ray {
    vec3 ori;
    vec3 dir;
};

//
// Generate ray according to camera and pixel coords.
//
Ray genRay(in Camera cam, in vec2 fragCoord) {
    // camera to world matrix.
    vec3 cw = normalize(cam.tar - cam.pos);
    vec3 cp = vec3(sin(cam.roll), cos(cam.roll), 0.0);
    vec3 cu = normalize(cross(cw, cp));
    vec3 cv = cross(cu, cw);
    mat3 c2w = mat3(cu, cv, cw);

    // (-1, +1)
    vec2 p = (2.0 * fragCoord - iResolution.xy) / iResolution.y;
    vec3 dir = c2w * normalize(vec3(p, cam.dist));
    return Ray(cam.pos, dir);
}

float rayMarch(in Ray ray) {
    float dist = 0.0;
    for(int i = 0; i < 100; i++) {
        vec3 pos = ray.ori + ray.dir * dist;
        float d0 = pos.y;
        float d1 = sdSphere(pos, vec3(0, 0, 0), 1.0);
        float d2 = sdSphere(pos, vec3(0.5, 0, 1), 0.5);
        float d = min(d0, min(d1, d2));
        if(abs(d) < 0.0001) {
            break;
        }
        dist += d;
    }
    return dist;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    Camera cam;
    cam.pos = vec3(2, 1, 0);
    cam.tar = vec3(0, 0, 0);
    cam.roll = 0.0;
    cam.dist = 1.0;
    Ray ray = genRay(cam, fragCoord);

    fragColor = vec4((rayMarch(ray))/3.0);
}