// Fragment shader template for the bonus question

precision mediump float; // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
// NOTE: You may need to edit this section to add additional variables
varying vec3 normalInterp; // Normal
varying vec3 vertPos; // Vertex position
varying vec3 viewVec; // Interpolated view vector

// uniform values remain the same across the scene
// NOTE: You may need to edit this section to add additional variables
uniform float Ka;   // Ambient reflection coefficient
uniform float Kd;   // Diffuse reflection coefficient
uniform float Ks;   // Specular reflection coefficient
uniform float shininessVal; // Shininess

// Material color
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 specularColor;

uniform vec3 lightPos; // Light position

uniform sampler2D uSampler;	// 2D sampler for the earth texture
uniform samplerCube envTexSampler;	// cube sampler for the environment map

void main() {
  // Your solution should go here.
  // Only the ambient colour calculations have been provided as an example.
  vec3 normDirection = normalize(normalInterp);
  vec3 lightDirection = normalize(lightPos - vertPos);
  float intensity = min(max(0.0, dot(normDirection, lightDirection)), 0.9);
  float density = 2.0;

  // unit square to make calculations easier.
  vec2 screenCoord = vec2(gl_FragCoord.x, gl_FragCoord.y);

  // make the lines by sheering a grid of circles into a grid of diagonal lines.
  screenCoord = mat2(0.1, -0.1, -0.1, 0.1) * screenCoord;
  // is the point on the right side of the circle or left side of circle, 
  // is the point on the top or bottom half
  vec2 fractional = fract(density * screenCoord);
  vec2 closestCircle = 2.0 * fractional - 1.0;
  float distFromCircle = length(closestCircle);
  // change size of the lines on brighter parts of the shape.
  float radius = 1.1 - intensity;
  // interpolate between the colors in a binary way (is point in the circle or outside the circle?)
  vec3 color = mix(Ka*ambientColor, Kd*diffuseColor, step(radius, distFromCircle));
  gl_FragColor = vec4(color, 1.0);
}
