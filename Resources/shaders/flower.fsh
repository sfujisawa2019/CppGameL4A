varying vec4 v_color; // �i���́j�F

// center(640,480)
uniform vec2 center;
// �}�`�̑傫���i�̔����j
uniform vec2 size_div2;
// �o�ߎ��ԁi�b�j
uniform float time;

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// (-250�`+250)
	vec2 p = gl_FragCoord.xy - center;
	// (-1�`+1)
	p /= size_div2;

	float col = 1.0;

	float angle = atan(p.y, p.x);

	// ���S����̋����ŐF�����߂�(0�`1)
	float len = length(p);
	
	// (-1�`+1)
	float w = sin(time * 3.14);
	// sin�̒��_(+1.0)�t�߂͈̔͂ŌJ��Ԃ�
	//w = sin(w+1.57);
	w = cos(w);
	// (0�`1)
	w = w / 2.0 + 0.5;

	// �~�ɂ���
	col = len;
	// �F�𔽓]
	col = 1 - col;
	// sin�J�[�u�̉e��
	col *= w;

	gl_FragColor = vec4(col, col, col, 1);
}