attribute vec4 a_position; // �i���́j���W
attribute vec4 a_color; // �i���́j�F
varying vec4 v_color; // �i�o�́j�F

void main() {
	gl_Position = a_position;
	v_color = a_color;
}