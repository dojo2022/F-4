<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>設定画面</title>
<link rel="stylesheet" type="text/css" href="/Sol_ty/css/style.css">
</head>

<!--ヘッダーここから-->
<header class="header">
  <a href="#sidemenu" class="hamburger-menu">
    <div class = "ham-top"></div>
    <div></div>
    <div></div>
  </a>
    <div id="sidemenu" class="sidenavs">
  <label for = "sidemenu" class="back"></label>
  <a href="#" class="close-btn">&times;</a>
  <ul class="hamburgerMenu">
    <li class="top">username</li>
    <li><a href="/Sol_ty/InCompTaskServlet">タスク表示</a></li>
    <li><a href="/Sol_ty/TaskRegistServlet">タスク登録</a></li>
    <li><a href="/Sol_ty/CalendarServlet">カレンダー</a></li>
    <li><a href="/Sol_ty/AchievementServlet">実績</a></li>
    <li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
    <li><a href="/Sol_ty/SettingServlet">設定</a></li>
</ul>
</div>
<div class="navtext"><h2>未完了タスク</h2></div>
<a href = "/Sol_ty/LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>
</div>
</header>
<body>
    <form id="language">
    <p>音声設定<br>
        <input type="radio" class="voiceSwitch"name="q1" value="ON"> ON
        <input type="radio" class= "voiceSwitch"name="q2" value="OFF"> OFF
        </p>
        <p>
            Voice
        <select name="voice">
            <option value="男1">男1</option>
            <option value="男2">男2</option>
            <option value="男3">男3</option>
            </select>
        </p>

        <p>
            壁紙
        <select name="wallpaper">
            <option value="男1">男1</option>
            <option value="男2">男2</option>
            <option value="男3">男3</option>
            </select>
        </p>


            <form action="/Sol_ty/BgiUploadServlet" method="post" class="bgiSend" enctype="multipart/form-data" >
              <div class="wokka">
                <p>
                  画像アップロード
                <input type="file" name="test" >
              </p>
              <div>
                <input type="submit" id="bgiSubmit" value="送信">
              </div>

          </div>

          <input type="submit" id="bgiSubmit"value="反映">

        </form>
</body>
</html>