varying vec4 v_color; // （入力）色

// center(640,480)
uniform vec2 center;

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// 描画ピクセルの座標と図形の中心座標の差を計算
	vec2 p = gl_FragCoord.xy - center;

	float col;

	col = p.x;

	gl_FragColor = vec4(col/250, col/250, col/250, 1);
	
	//gl_FragColor *= v_color;
}