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

	float col = 1.0;
	float alpha;
	float alpha2;
	// 描画ピクセルの座標と図形の中心座標の距離(0～250)
	float len = length(p);
	// 縦か横の最大値で割る(0～1)
	alpha2 = len / size_div2.x;
	// 白黒反転(0～1～0)
	alpha2 = 1.0 - alpha2;
	// 元が0なら0、それ以上なら1
	alpha2 = sign(alpha2);

	// X軸からの角度をラジアンで求める（-π～+π）
	float angle = atan(p.y,p.x);
	// 角度を度数法に変換する（-180～+180）
	float deg = degrees(angle);
	// マイナスをプラスに変換(180～0～180)
	deg = abs(deg);
	// 30度以上の範囲を1にする（0 or 1)
	alpha = step(30, deg);
	// (-0.5～+0.5)
	//col = deg / 360.0;

	// alphaとalpha2が両方1の所だけ、結果が1になる
	alpha = alpha * alpha2;

	gl_FragColor = vec4(col, col, 0, alpha);
	
	//gl_FragColor *= v_color;
}