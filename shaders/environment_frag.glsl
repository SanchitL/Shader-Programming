precision mediump float; // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
varying vec3 normalInterp; // Normal
varying vec3 vertPos; // Vertex position
varying vec3 viewVec; // View vector (eye to fragment)

uniform float Ka;   // Ambient reflection coefficient
uniform float Kd;   // Diffuse reflection coefficient
uniform float Ks;   // Specular reflection coefficient
uniform float shininessVal; // Shininess

// Material color
// HINT: Use the environment map as the ambient color
uniform vec3 diffuseColor;
uniform vec3 specularColor;
uniform vec3 lightPos; // Light position

uniform samplerCube envTexSampler; // A GLSL sampler represents a single texture. A samplerCube can be used to sample a cubemap texture.

void main() {
  // Your solution should go here.
  
  // The model is currently rendered in black
  gl_FragColor = vec4(vec3(0.0), 1.0);
}
