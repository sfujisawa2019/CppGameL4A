varying vec4 v_color; // �i���́j�F

void main(){
	// ���͏��RED���ő�l
	// 1�ȏ�͏�ɍő�l
	// 0.0~1.0f�܂Ŕ͈͂ŐF���w�肵�悤�I
	gl_FragColor = vec4(gl_FragCoord.x/1280.0, 0, 0, 1);
	
	//gl_FragColor *= v_color;
}