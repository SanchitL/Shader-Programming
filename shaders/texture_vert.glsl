attribute vec3 position; // Given vertex position in object space
attribute vec3 normal;  // Given vertex normal in object space
attribute vec2 texCoord; // Given texture (uv) coordinates
uniform mat4 projection, modelview, normalMat;	// Given scene transformation matrices

// These will be given to the fragment shader and interpolated automatically
varying vec3 normalInterp;
varying vec3 vertPos;
varying highp vec2 texCoordInterp;

void main() {
  // Your solution should go here.
  vec4 vertPos4 = modelview * vec4(position, 1.0);
  gl_Position = projection * vertPos4;
}
