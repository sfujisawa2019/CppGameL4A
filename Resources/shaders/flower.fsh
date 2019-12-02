varying vec4 v_color; // （入力）色

void main(){
	// 今は常にREDが最大値
	// 1以上は常に最大値
	// 0.0~1.0fまで範囲で色を指定しよう！
	// xが1280の時にrが1.0fになるように数式で調整
	//gl_FragColor = vec4(gl_FragCoord.x/1280.0, 0, 0, 1);
	// 練習２
	gl_FragColor = vec4(gl_FragCoord.x/1280.0, gl_FragCoord.y/720.0, 0, 1);
	
	//gl_FragColor *= v_color;
}