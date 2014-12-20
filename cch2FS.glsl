precision highp float;
varying vec3 v_normal;
uniform vec4 u_ambient;
uniform vec4 u_diffuse;
uniform vec4 u_emission;
varying vec3 v_light0Direction;
uniform vec3 u_light0Color;
void main(void) {
vec3 normal = normalize(v_normal);
if (gl_FrontFacing == false) normal = -normal;
vec4 color = vec4(0., 0., 0., 0.);
vec4 diffuse = vec4(0., 0., 0., 1.);
vec3 diffuseLight = vec3(0., 0., 0.);
vec4 emission;
vec4 ambient;
ambient = u_ambient;
diffuse = u_diffuse;
emission = u_emission;
{
float specularIntensity = 0.;
float attenuation = 1.0;
vec3 l = normalize(v_light0Direction);
diffuseLight += u_light0Color * max(dot(normal,l), 0.) * attenuation;
}
diffuse.xyz *= diffuseLight;
color.xyz += diffuse.xyz;
color.xyz += emission.xyz;
color = vec4(color.rgb * diffuse.a, diffuse.a);
gl_FragColor = color;
}
