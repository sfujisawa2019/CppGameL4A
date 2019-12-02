varying vec4 v_color; // （入力）色

// center(640,480)
uniform vec2 center;

void main(){

	// 描画ピクセルの座標と図形の中心座標の差を計算
	// gl_FragCoord.xy(640,480)
	// gl_FragCoord.xy(740,580)
	vec2 p = gl_FragCoord.xy - center;

	// p(0,0,0,1)
	gl_FragColor = vec4(p.x, p.y, 0, 1);
	
	//gl_FragColor *= v_color;
}