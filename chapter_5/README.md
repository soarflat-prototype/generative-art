# Chapter5 次元を加える
Processingがどのように3次元の描画をレンダリングするか学ぶ。

## 主役はパーリンノイズ
レンダリングにはパーリンノイズが主役となる。Chapter4までは`noise`関数に1つの引数
を指定し、1次元のノイズを生成していただけだが、今回は更に次元を加えてみる。

# 2次元のノイズ
2次元は1次元と見方が異なる。概念的には線から平面になる。

1次元のノイズは水平線上に見える山脈のように揺らぐ線のようであり、2次元のノイズは真上から山脈を見下ろしている面のようになる。

## ノイズグリッドを作る
説明だけだと解り辛いため、例を見せる。

**c_5_1_noise_grid/c_5_1_noise_grid.pde**

```processing
// 描画ウィンドウの幅と高さを指定する
size(300, 300);
// 滑らかな描画（アンチエイリアス）を有効にする
smooth();
// 背景職を指定
background(255);
float xStart = random(10);
float xNoise = xStart;
float yNoise = random(10);

for (int y = 0; y <= height; y += 1) {
    yNoise += 0.01;
    // 各列の開始時点でxNoiseをリセット
    xNoise = xStart;
    for (int x = 0; x <= width; x += 1) {
        xNoise += 0.01;
        int alph = int(noise(xNoise, yNoise) * 255);
        stroke(0, alph);
        line(x, y, x + 1, y + 1);
    }   
}
```

上記のスクリプトは1ピクセルずつごく短い線を描画しているものであり、300×300の正方形のピクセル上をループする。１ピクセル毎にシード値（乱数を生成するときの最初の設定値）に0.01を加算し、各列の開始時点でxのシード値を元の値に戻す。xとyのそれぞれの位置で`noise`関数が返す値は、各位置で描画する線のアルファ値として利用するため視覚化される。

結果として以下のような2Dパーリンノイズが描画される。

<img src="../README_resources/chapter_5/c_5_1_noise_grid.jpg" width="303">