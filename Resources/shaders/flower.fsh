varying vec4 v_color; // �i���́j�F

void main(){
	// ���͏��RED���ő�l
	// 1�ȏ�͏�ɍő�l
	// 0.0~1.0f�܂Ŕ͈͂ŐF���w�肵�悤�I
	// x��1280�̎���r��1.0f�ɂȂ�悤�ɐ����Œ���
	//gl_FragColor = vec4(gl_FragCoord.x/1280.0, 0, 0, 1);
	// ���K�Q
	gl_FragColor = vec4(gl_FragCoord.x/1280.0, gl_FragCoord.y/720.0, 0, 1);
	
	//gl_FragColor *= v_color;
}