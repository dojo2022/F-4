<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>実績 | Sol-ty</title>
<link rel="stylesheet" href="/Sol_ty/css/style.css">
<link rel='stylesheet'
	href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>
<script src='https://unpkg.com/v-calendar'></script>
</head>
<!--ヘッダーここから-->
<header class="header">
	<a href="#sidemenu" class="hamburger-menu">
		<div class="ham-top"></div>
		<div></div>
		<div></div>
	</a>
	<div id="sidemenu" class="sidenavs">
		<label for="sidemenu" class="back"></label> <a href="#"
			class="close-btn">&times;</a>
		<ul class="hamburgermenu">
			<li class="top">username</li>
			<li><a href="/Sol_ty/InCompTaskServlet">タスク表示</a></li>
			<li><a href="/Sol_ty/TaskRegistServlet">タスク登録</a></li>
			<li><a href="/Sol_ty/CalendarServlet">カレンダー</a></li>
			<li><a href="/Sol_ty/AchievementServlet">実績</a></li>
			<li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
			<li><a href="/Sol_ty/SettingServlet">設定</a></li>
		</ul>
	</div>
	<div class="navtext">
		<h2>実績</h2>
	</div>
	<div>
		<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png"
			alt="ログアウト"></a>
	</div>
</header>
	<!--ヘッダーここまで-->
<body>
	<!--実績一覧-->
	<div id="achievementListAll">
		<c:forEach var="e" items="${achieveList}">
			<div class="achievementList">
				<div id="achievementTop">
					<div>実績</div>
					<div>
						<c:out value="${e.achieveid}"></c:out>
					</div>
					<div>title</div>
					<c:out value="${e.title}"></c:out>
				</div>
				<div id="achievementbottom">
					<div>取得条件</div>
					<div>
						<c:out value="${e.condition}"></c:out>
					</div>
					<div>実績内容</div>
					<div>
						<c:out value="${e.achievecontent}"></c:out>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!--実績一覧ここまで-->
</body>