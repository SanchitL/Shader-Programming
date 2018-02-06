precision mediump float; // It is required to set a floating point precision in all fragment shaders.

// Interpolated values from vertex shader
varying vec3 normalInterp; // Normal
varying vec3 vertPos; // Vertex position

uniform float Ka;   // Ambient reflection coefficient
uniform float Kd;   // Diffuse reflection coefficient
uniform float Ks;   // Specular reflection coefficient
uniform float shininessVal; // Shininess

// Material color
uniform vec3 ambientColor;
uniform vec3 diffuseColor;
uniform vec3 specularColor;
uniform vec3 lightPos; // Light position

void main() {
  // Your solution should go here
  // Only the ambient colour calculations have been provided as an example.
  //gl_FragColor = vec4(ambientColor, 1.0);
  //calculate nessessary vectors.
  vec3 normDirection = normalize(normalInterp);
  vec3 lightDirection = normalize(lightPos - vertPos);
  vec3 viewDirection = normalize(vec3(vec4(0.0, 0.0, 0.0, 1.0) - vec4(vertPos, 1.0)));
  //ambient term
  vec3 ambientTerm = (Ka * ambientColor);

  float intensity = dot(normDirection, lightDirection);
  // make intensity discerte rather than continous.
  if (intensity > 0.67) {
    intensity = 1.0;
  } else if(intensity > 0.33) {
    intensity = 0.67;
  } else if(intensity > 0.00) {
    intensity = 0.33;
  }
  // diffuse teerm
  vec3 diffuseTerm = (Kd * diffuseColor * max(0.0, intensity));
  vec3 specularTerm;

  intensity = dot(reflect(-lightDirection, normDirection), viewDirection);
  // make intensity discerte rather than continous.
  if (intensity > 0.98) {
    intensity = 1.0;
  } else {
    intensity = 0.0;
  }
  // don't draw highlights on the wrong side.
  if (dot(normDirection, lightDirection) < 0.0) {
    specularTerm = vec3(0.0, 0.0, 0.0);
  } else {
    specularTerm = Ks * specularColor * pow(max(0.0, intensity), shininessVal);
  }
  // set color
  vec3 illumination = ambientTerm + diffuseTerm + specularTerm;
  gl_FragColor = vec4(illumination, 1.0);
}