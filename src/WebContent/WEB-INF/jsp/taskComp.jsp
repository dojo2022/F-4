<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>完了タスク | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">
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
			<li><a href="/Sol_ty/CalenderServlet">カレンダー</a></li>
			<li><a href="/Sol_ty/AchievementServlet">実績</a></li>
			<li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
			<li><a href="/Sol_ty/SettingServlet">設定</a></li>
		</ul>
	</div>
	<div class="navtext">
		<h2>完了タスク</h2>
	</div>
	<a href="LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>

</header>

<body>
	<form id="taskCompList" method="POST"
		action="/Sol_ty/UpdateDeleteServlet">
		<div id="taskCompleted">
			<c:forEach var="e" items="${compList}">
				<div class="taskComp">
					<input type="checkbox" name="taskcompName" class="taskcompCheck">
					<div><c:out value="${e.taskcontent}"></c:out></div>
					<div><c:out value="${e.deadline}"></c:out></div>
					<div><c:out value="${e.compday}"></c:out></div>
				</div>
			</c:forEach>

		</div>
		<button type="submit" name="backIncomp" value="未完了に戻す" id="backIncomp">未完了に戻す</button>
	</form>
</body>
</html>