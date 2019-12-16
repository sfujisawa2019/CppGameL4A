varying vec4 v_color; // �i���́j�F

// center(640,480)
uniform vec2 center;
// �}�`�̑傫���i�̔����j
uniform vec2 size_div2;

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// (-250�`+250)
	vec2 p = gl_FragCoord.xy - center;

	float col = 1.0;
	float alpha;
	float alpha2;
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̋���(0�`250)
	float len = length(p);
	// �c�����̍ő�l�Ŋ���(0�`1)
	alpha2 = len / size_div2.x;
	// �������](0�`1�`0)
	alpha2 = 1.0 - alpha2;
	// ����0�Ȃ�0�A����ȏ�Ȃ�1
	alpha2 = sign(alpha2);

	// X������̊p�x�����W�A���ŋ��߂�i-�΁`+�΁j
	float angle = atan(p.y,p.x);
	// �p�x��x���@�ɕϊ�����i-180�`+180�j
	float deg = degrees(angle);
	// �}�C�i�X���v���X�ɕϊ�(180�`0�`180)
	deg = abs(deg);
	// 30�x�ȏ�͈̔͂�1�ɂ���i0 or 1)
	alpha = step(30, deg);
	// (-0.5�`+0.5)
	//col = deg / 360.0;

	// alpha��alpha2������1�̏������A���ʂ�1�ɂȂ�
	alpha = alpha * alpha2;

	gl_FragColor = vec4(col, col, 0, alpha);
	
	//gl_FragColor *= v_color;
}