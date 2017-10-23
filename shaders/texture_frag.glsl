precision mediump float;  // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
varying highp vec2 texCoordInterp;

// uniform values are the same across the scene
uniform sampler2D uSampler;	// A GLSL sampler represents a single texture. A sampler2D can be used to sample a 2D texture.

void main() {
  // Your solution should go here.
  // The model is currently rendered in black
  gl_FragColor = vec4(vec3(0.0), 1.0);
}