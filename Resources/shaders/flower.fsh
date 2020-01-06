varying vec4 v_color; // �i���́j�F

// center(640,480)
uniform vec2 center;
// �}�`�̑傫���i�̔����j
uniform vec2 size_div2;
// �o�ߎ��ԁi�b�j
uniform float time;

float u(float x)
{
	// x��0���傫�����1�A�����łȂ����0��Ԃ�
	return (x > 0.0) ? 1.0 : 0.0;
}

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// �`��s�N�Z���̍��W�Ɛ}�`�̒��S���W�̍����v�Z
	// (-250�`+250)
	vec2 p = gl_FragCoord.xy - center;
	// (-1�`+1)
	p /= size_div2;

	// ���S����̊p�x
	float a = atan(p.x, p.y);

	// ���S����̋���
	float r = length(p);
	
	// (-1�`+1)
	float w = cos(time * 3.14 - r * 2.0);

	float h = 0.5 + 0.5 * cos(12.0*a - w * 7.0 + r * 8.0);
	
	float d = 0.25 + 0.75 * pow(h,1.0*r)*(0.7 + 0.3*w);

	float col = u(d-r) * sqrt(1.0-r/d)*r*2.5;

	col *= 1.25+0.25*cos((12.0*a-w*7.0+r*8.0)/2.0);
	col *= 1.0 - 0.35*(0.5+0.5*sin(r*30.0))*(0.5+0.5*cos(12.0*a-w*7.0+r*8.0));

	gl_FragColor = vec4(
	col,
	col-h*0.5+r*0.2,
	col-h*r + 0.1 * h * (1.0-r),
	1);
}