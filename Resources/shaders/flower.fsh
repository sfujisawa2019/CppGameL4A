varying vec4 v_color; // �i���́j�F

// center(640,480)
uniform vec2 center;
// �}�`�̑傫���i�̔����j
uniform vec2 size_div2;

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	vec2 p = gl_FragCoord.xy - center;

	float col;

	// �`��s�N�Z���Ɛ}�`�̒��S���W�̍��𐳋K��(-1�`+1)
	col = p.x / size_div2.x;

	gl_FragColor = vec4(col, col, col, 1);
	
	//gl_FragColor *= v_color;
}