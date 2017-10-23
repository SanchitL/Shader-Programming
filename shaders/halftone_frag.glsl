precision mediump float; // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
varying vec3 normalInterp; // Normal
varying vec3 vertPos; // Vertex position

uniform float Ka;   // Ambient reflection coefficient
uniform float Kd;   // Diffuse reflection coefficient

// Material color
uniform vec3 ambientColor;	// Use this as the foreground (dark) color
uniform vec3 diffuseColor;  // Use this as the background (light) color

uniform vec3 lightPos; // Light position

// HINT: Use the built-in variable gl_FragCoord to get the screen-space coordinates

void main() {
  // Your solution should go here.
  // Only the background color calculations have been provided as an example.
  gl_FragColor = vec4(diffuseColor, 1.0);
}