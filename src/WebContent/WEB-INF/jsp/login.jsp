<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | Sol-ty</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="/Sol_ty/css/style.css">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="http://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/move02/5-11/css/reset.css">
<link rel="stylesheet" type="text/css" href="http://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/move02/5-11/css/5-11.css">
</head>
<!--ヘッダーここから-->
<body>
<div class="container">
    <svg viewBox="0 0 3387 1270">
    <path id="planePath" class="planePath" d="M-226 626c439,4 636,-213 934,-225 755,-31 602,769 1334,658 562,-86 668,-698 266,-908 -401,-210 -893,189 -632,630 260,441 747,121 1051,91 360,-36 889,179 889,179" />
    <g id="plane">
      <polygon class="fil1" points="-141,-10 199,0 -198,-72 -188,-61 -171,-57 -184,-57 " />
      <!--<polygon class="fil2" points="199,0 -141,-10 -163,63 -123,9 " />-->
      <polygon class="fil3" points="-95,39 -113,32 -123,9 -163,63 -105,53 -108,45 -87,48 -90,45 -103,41 -94,41 " />
      <path class="fil4" d="M-87 48l-21 -3 3 8 19 -4 -1 -1zm-26 -16l18 7 -2 -1 32 -7 -29 1 11 -4 -24 -1 -16 -18 10 23zm10 9l13 4 -4 -4 -9 0z" />
      <polygon class="fil1" points="-83,28 -94,32 -65,31 -97,38 -86,49 -67,70 199,0 -123,9 -107,27 " />
    </g>
    <!-- Define the motion path animation -->
    <animateMotion xlink:href="#plane" dur="5s" repeatCount="indefinite" rotate="auto">
      <mpath xlink:href="#planePath" />
    </animateMotion>
  </svg>
    <div class = "titleLogo">
    	<img src="logo-sample/Sol-Ty-logo2.png" alt="solty">
    </div>
<!--ヘッダーここまで-->
    <!--メインここから-->
    <form  id="loginForm" method="POST" action="/Sol_ty/LoginServlet">
      <div class="loginForm">
      <input type="text" name="USERNAME" placeholder=" &nbsp;UserName" class="textInput">
      </div>
      <div class="loginForm">
      <input type="text" name="PASSWORD" placeholder=" &nbsp;Password" class="textInput" id="textPassword">
      <span id="buttonEye" class="fa fa-eye" onclick="pushHideButton()"></span>
    </div>
      <input type="submit" name="login" class="submitButton" id="loginButton"value="ログイン">
      <p id ="output"></p>
      <span id="errorMessage"></span>
    </form>
    <hr id="hrLeft">
    <p id="loginOr">または</p>
    <hr id="hrRight">
    <a href="/Sol_ty/UserRegistServlet" id = "signUp">新規登録</a>
    <canvas id="waveCanvas"></canvas>
<!--/wrapper--></div>
    <!--メインここまで-->
<script src="http://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/move02/5-11/js/5-11.js"></script>
    <script>
        'use strict';
        function pushHideButton() {
          var txtPass = document.getElementById("textPassword");
          var btnEye = document.getElementById("buttonEye");
          if (txtPass.type === "text") {
            txtPass.type = "password";
            btnEye.className = "fa fa-eye";
          } else {
            txtPass.type = "text";
            btnEye.className = "fa fa-eye-slash";
          }
        }
      document.getElementById('loginForm').onsubmit = function(event){
        const user = document.getElementById('loginForm').username.value;
        const pass = document.getElementById('loginForm').password.value;

    if (user === '' && pass === '') {
      document.getElementById('output').textContent = `※IDとパスワードが入力されていません`;
      return false;
    }else if (user === ''){
      document.getElementById('output').textContent = `※IDが入力されていません`;
      return false;
    }else if (pass === ''){
      document.getElementById('output').textContent = `※パスワードが入力されていません`;
      return false;
    }
  }
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
</html>