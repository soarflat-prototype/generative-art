// 描画ウィンドウの幅と高さを指定する
size(300, 300);
// 滑らかな描画（アンチエイリアス）を有効にする
smooth();
// 背景色を指定
background(255);
float xStart = random(10);
float xNoise = xStart;
float yNoise = random(10);

for (int y = 0; y <= height; y += 1) {
    // シード値に0.01を加算
    yNoise += 0.01;
    // 各列の開始時点でxNoiseをリセット
    xNoise = xStart;
    for (int x = 0; x <= width; x += 1) {
        // シード値に0.01を加算
        xNoise += 0.01;
        // xとyのそれぞれの位置でnoise関数が返す値をアルファ値として利用する
        int alph = int(noise(xNoise, yNoise) * 255);
        stroke(0, alph);
        line(x, y, x + 1, y + 1);
    }   
}