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
  // get position and normal
  vertPos = vec3(vertPos4);
  normalInterp = normalize(vec3(normalMat * vec4(normal, 1.0)));
  // change the point of origin from bottom left to top-left.
  texCoordInterp = vec2(texCoord.x, 1.0 - texCoord.y);
}
