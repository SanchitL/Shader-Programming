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
  // gl_FragColor = vec4(diffuseColor, 1.0);
  vec3 normDirection = normalize(normalInterp);
  vec3 lightDirection = normalize(lightPos - vertPos);
  float density = 50.0;

  // unit square to make calculations easier.
  vec2 screenCoord = vec2(gl_FragCoord.x/600.0, gl_FragCoord.y/600.0);

  // is the point on the right side of circle or left side of circle, 
  // is the point on the top or bottom half
  vec2 fractional = fract(density * screenCoord);
  vec2 closestCircle = 2.0 * fractional - 1.0;
  float distFromCircle = length(closestCircle);

  float intensity = min(max(0.0, dot(normDirection, lightDirection)), 0.9);
  // change size of circles on brighter parts of the shape.
  float radius = 1.1 - intensity;
  // interpolate between the colors in a binary way (is point in the circle or outside the circle?)
  vec3 color = mix(Ka*ambientColor, Kd*diffuseColor, step(radius, distFromCircle));
  gl_FragColor = vec4(color, 1.0);
}