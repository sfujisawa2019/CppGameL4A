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

	float col;
	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̋���(0�`250)
	float len = length(p);
	// �c�����̍ő�l�Ŋ���(0�`1)
	col = len / size_div2.x;
	// �������](0�`1�`0)
	col = 1.0 - col;
	// ����0�Ȃ�0�A����ȏ�Ȃ�1
	col = sign(col);
	//col = step(0.00000001, col);

	gl_FragColor = vec4(col, col, col, 1);
	
	//gl_FragColor *= v_color;
}