<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<script>
window.onload = () => {
 sound();
</script>
<head>
<meta charset="UTF-8">
<title>実績 | Sol-ty</title>
<link rel="stylesheet" href="/Sol_ty/css/style.css">
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
			<li class="top"><img src="logo-sample/Sol-Ty-logo2.png" alt="solty"></li>
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
	<div id="logoutLogo">
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
	<script>
'use strict';
window.addEventListener('DOMContentLoaded', function() {
    // 実行したい処理を書く
    const taskCount = '${user.taskcount}';
	 const voiceSelect = '${user.voiceselect}';
	 //console.log(voiceSelect);
 	if(taskCount >= 0) {
 		const voicePath = ["VoiceAchieveDisplayKotaro.wav","VoiceAchieveDisplayRyusei.wav",
 			  "VoiceAchieveDisplayMetan.wav","VoiceAchieveDisplayTsumugi.wav"];
 	    const music = new Audio("voice/" + voicePath[voiceSelect-1]);
 	    //const music = new Audio("voice/" + voicePath[1]);
 	    music.play();
 	    music.loop = false;
 	}
})
</script>
</body>