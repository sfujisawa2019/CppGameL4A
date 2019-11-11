varying vec4 v_color; // �i���́j�F
varying vec2 v_texCoord; // �i���́j�e�N�X�`�����W
uniform sampler2D sampler; // �i���́j�e�N�X�`���T���v���[

void main(){
	// �e�N�X�`���̎w����W�̐F���擾
	vec4 texcolor = texture2D(sampler, v_texCoord);
	// �e�N�X�`���J���[�ƒ��_�J���[���|���ďo��
	gl_FragColor = texcolor * v_color;
	//                   R    G    B    A
	//gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}