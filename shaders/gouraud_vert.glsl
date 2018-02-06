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

  // calculate the necessary vectors
  vec4 vertPos4 = modelview * vec4(position, 1.0);
  gl_Position = projection * vertPos4;
  vertPos = vec3(vertPos4);
  vec4 norm4 = normalMat * vec4(normal, 1.0);
  vec3 normDirection = normalize(vec3(norm4));
  vec3 lightDirection = normalize(lightPos - vertPos);
  vec3 viewDirection = normalize(vec3(0.0, 0.0, 0.0) - vertPos);

  //calculate ambient and diffuse terms
  vec3 ambientTerm = (Ka * ambientColor);
  vec3 diffuseTerm = (Kd * diffuseColor * max(0.0, dot(normDirection, lightDirection)));
  vec3 specularTerm;

  // dont draw specular highlights on wrong side
  if (dot(normDirection, lightDirection) < 0.0) {
    specularTerm = vec3(0.0, 0.0, 0.0);
  } else {
    specularTerm = Ks * specularColor * pow(max(0.0, dot(reflect(-lightDirection, normDirection), viewDirection)), shininessVal);
  }
  
  // set the color
  vec3 illumination = ambientTerm + diffuseTerm + specularTerm;
  color = vec4(illumination, 1.0);
}