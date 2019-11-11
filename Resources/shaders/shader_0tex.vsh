attribute vec4 a_position; // �i���́j���W
attribute vec4 a_color; // �i���́j�F
varying vec4 v_color; // �i�o�́j�F
uniform mat4 u_wvp_matrix;// �i���́j���[���h�s��

void main() {
	gl_Position = u_wvp_matrix * a_position;
	//gl_Position = a_position;
	v_color = a_color;
}