attribute vec3 position; // Given vertex position in object space
attribute vec3 normal; // Given vertex normal in object space

uniform mat4 projection, modelview, normalMat; // Given scene transformation matrices

// These will be given to the fragment shader and interpolated automatically
varying vec3 normalInterp;
varying vec3 vertPos;
varying vec4 color;

uniform float Ka;   // Ambient reflection coefficient
uniform float Kd;   // Diffuse reflection coefficient
uniform float Ks;   // Specular reflection coefficient
uniform float shininessVal; // Shininess

// Material color
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 specularColor;
uniform vec3 lightPos; // Light position


void main(){
  // Your solution should go here.
  // Only the ambient colour calculations have been provided as an example.

  

  vec4 vertPos4 = modelview * vec4(position, 1.0);
  gl_Position = projection * vertPos4;
  color = vec4(ambientColor, 1.0); 
}