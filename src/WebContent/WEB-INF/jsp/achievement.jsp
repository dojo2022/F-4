<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>実績 | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">
<link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>
<script src='https://unpkg.com/v-calendar'></script>
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
  <ul class="hamburgermenu">
    <li class="top">username</li>
    <li><a href="/Sol_ty/UpdateDeleteServlet">タスク表示</a></li>
    <li><a href="/Sol_ty/TaskRegistServlet">タスク登録</a></li>
    <li><a href="/Sol_ty/???Servlet">カレンダー</a></li>
    <li><a href="/Sol_ty/???Servlet">実績</a></li>
    <li><a href="/Sol_ty/???Servlet">完了タスク</a></li>
    <li><a href="/Sol_ty/SettingDeleteServlet">設定</a></li>
  </ul>
    </div>
  <div class="navtext"><h2>実績</h2></div>
    <a href = "login.html"><img src="image/logout.png" alt="ログアウト"></a>
</div>
</header>
<body>
  <!--ヘッダーここまで-->
<body>
    <!--実績一覧-->
<div id = "achievementListAll">
    <c:forEach var="" items="${}">
    <div class = "achievementList">
        <div id = "achievementTop">
            <div>実績</div>
            <div>title</div>
        </div>
        <div id = "achievementbottom">取得条件と取得ポイント</div><br>
    </div>
    </c:forEach>
</div>
    <!--実績一覧ここまで-->
</body>