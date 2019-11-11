attribute vec4 a_position; // �i���́j���W
attribute vec4 a_color; // �i���́j�F
attribute vec2 a_texCoord;  // �i���́j�e�N�X�`�����W

varying vec4 v_color; // �i�o�́j�F
varying vec2 v_texCoord; // �i�o�́j�e�N�X�`�����W

void main() {
	gl_Position = a_position;
	v_color = a_color;
	v_texCoord = a_texCoord;
}