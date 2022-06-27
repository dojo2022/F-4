<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>ユーザー登録画面</title>
</head>
<body>
    <div class="container">
    <div class="titleLogoUserRegist">
        <img src="logo-sample/Sol-Ty-logo2.png" alt="solty">
    </div>
    <div id="signupTitleSignUp">
    <hr id="signUpHrLeft">
    <h2 id="userRegistTitle">新規登録</h2>
    <hr id="signUpHrright">
    </div>
    <form method="post" id="signUpText" action="/Sol_ty/UserRegistServlet">
        <p>-SignUp Form-</p>
    <div class="newRegistForm">
    <input type="text" value="" name="USERNAME" placeholder="*ユーザーネーム入力" class="newRegistQuestion"></p>
    </div>
    <div class="newRegistForm">
    <input type="text" value="" name="PASSWORD" placeholder="*パスワード入力" class="newRegistQuestion"></p>
    </div>

        <div class="question">
            <label for="prefecture">*秘密の質問</label><br>
            <select name="SECQUESTION">
            <option value="">選択してください</option>
            <option value="出身小学校の名前は？">出身小学校の名前は？</option>
            <option value="最初に飼ったペットの名前は？">最初に飼ったペットの名前は？</option>
            <option value="生まれた町の名前は？">生まれた町の名前は？</option>

            </select>
        </div>

    <input type="text" value="" name="SECANSWER" id="secretQuestion" placeholder="*秘密の質問入力" ></p>


        <input type="submit" value="登録" id="regist" class="submitButton">
    </form>

    <canvas id="waveCanvas"></canvas>
</div>
<script src="http://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/move02/5-11/js/5-11.js"></script>
<script>
    'use strict';

  var unit = 100,
    canvasList, // キャンバスの配列
    info = {}, // 全キャンバス共通の描画情報
    colorList; // 各キャンバスの色情報

/**
 * Init function.
 *
 * Initialize variables and begin the animation.
 */
function init() {
    info.seconds = 0;
    info.t = 0;
    canvasList = [];
    colorList = [];
    // canvas1個めの色指定
    canvasList.push(document.getElementById("waveCanvas"));
    colorList.push(['#afeeee', '#add8e6', '#1e90ff']);//重ねる波の色設定
  // 各キャンバスの初期化
for(var canvasIndex in canvasList) {
        var canvas = canvasList[canvasIndex];
        canvas.width = document.documentElement.clientWidth; //Canvasのwidthをウィンドウの幅に合わせる
        canvas.height = 200;//波の高さ
        canvas.contextCache = canvas.getContext("2d");
    }
    // 共通の更新処理呼び出し
    update();
}

function update() {
    for(var canvasIndex in canvasList) {
        var canvas = canvasList[canvasIndex];
        // 各キャンバスの描画
        draw(canvas, colorList[canvasIndex]);
    }
    // 共通の描画情報の更新
    info.seconds = info.seconds + .014;
    info.t = info.seconds*Math.PI;
    // 自身の再起呼び出し
    setTimeout(update, 35);
}

/**
 * Draw animation function.
 *
 * This function draws one frame of the animation, waits 20ms, and then calls
 * itself again.
 */
function draw(canvas, color) {
    // 対象のcanvasのコンテキストを取得
    var context = canvas.contextCache;
    // キャンバスの描画をクリア
    context.clearRect(0, 0, canvas.width, canvas.height);

    //波の重なりを描画 drawWave(canvas, color[数字（波の数を0から数えて指定）], 透過, 波の幅のzoom,波の開始位置の遅れ )
    drawWave(canvas, color[0], 0.5, 3, 0);//0.5⇒透過具合50%、3⇒数字が大きいほど波がなだらか
    drawWave(canvas, color[1], 0.4, 2, 250);
    drawWave(canvas, color[2], 0.2, 1.6, 100);
}

/**
* 波を描画
* drawWave(色, 不透明度, 波の幅のzoom, 波の開始位置の遅れ)
*/
function drawWave(canvas, color, alpha, zoom, delay) {
    var context = canvas.contextCache;
    context.fillStyle = color;//塗りの色
    context.globalAlpha = alpha;
    context.beginPath(); //パスの開始
    drawSine(canvas, info.t / 0.5, zoom, delay);
    context.lineTo(canvas.width + 10, canvas.height); //パスをCanvasの右下へ
    context.lineTo(0, canvas.height); //パスをCanvasの左下へ
    context.closePath() //パスを閉じる
    context.fill(); //波を塗りつぶす
}

/**
 * Function to draw sine
 *
 * The sine curve is drawn in 10px segments starting at the origin.
 * drawSine(時間, 波の幅のzoom, 波の開始位置の遅れ)
 */
function drawSine(canvas, t, zoom, delay) {
    var xAxis = Math.floor(canvas.height/2);
    var yAxis = 0;
    var context = canvas.contextCache;
    // Set the initial x and y, starting at 0,0 and translating to the origin on
    // the canvas.
    var x = t; //時間を横の位置とする
    var y = Math.sin(x)/zoom;
    context.moveTo(yAxis, unit*y+xAxis); //スタート位置にパスを置く

    // Loop to draw segments (横幅の分、波を描画)
    for (i = yAxis; i <= canvas.width + 10; i += 10) {
        x = t+(-yAxis+i)/unit/zoom;
        y = Math.sin(x - delay)/3;
        context.lineTo(i, unit*y+xAxis);
    }
}

init();
</script>


</body>