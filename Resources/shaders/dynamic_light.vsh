attribute vec4 a_position; // �i���́j���W
attribute vec4 a_color; // �i���́j�F
attribute vec2 a_texCoord;

varying vec4 v_color; // �i�o�́j�F
varying vec2 v_texCoord;

uniform mat4 u_wvp_matrix;// �i���́j���[���h�s��

void main() {
	gl_Position = u_wvp_matrix * a_position;
	//gl_Position = a_position;
	v_color = a_color;
	v_texCoord = a_texCoord;
}