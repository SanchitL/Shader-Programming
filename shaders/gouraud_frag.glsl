precision mediump float; // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
varying vec4 color; 
varying vec3 normalInterp; // Normal
varying vec3 vertPos; // Vertex positon

void main() {
  // Your solution goes here.
  gl_FragColor = color;
}