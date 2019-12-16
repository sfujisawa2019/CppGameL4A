varying vec4 v_color; // （入力）色

// center(640,480)
uniform vec2 center;
// 図形の大きさ（の半分）
uniform vec2 size_div2;

void main(){

//center(1280-250, )
//gl_FragCoord.x(1280-250, )

	// 描画ピクセルの座標と図形の中心座標の差を計算
	// (-250～+250)
	vec2 p = gl_FragCoord.xy - center;

	float col;
	// 描画ピクセルの座標と図形の中心座標の距離(0～250)
	float len = length(p);
	// 縦か横の最大値で割る(0～1)
	col = len / size_div2.x;
	// 白黒反転(0～1～0)
	col = 1.0 - col;
	// 元が0なら0、それ以上なら1
	col = sign(col);
	//col = step(0.00000001, col);

	gl_FragColor = vec4(col, col, col, 1);
	
	//gl_FragColor *= v_color;
}