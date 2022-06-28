<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
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
			<li class="top"><img src="logo-sample/Sol-Ty-logo2.png"
				alt="solty"></li>
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
<body id="backImg">
	<!--実績一覧-->
	<div id="wrapper">
		<div id="achievementListAll">
			<c:forEach var="e" items="${achieveList}">
				<div class="achieve">
					<div class="soltyImage">
						<img src="image/achievement${e.achieveid}.png">
					</div>
					<div class="achievementList">
						<div id="achievementTop">
							<span class="acTitle">実績 <c:out value=" ${e.achieveid}"></c:out>
							</span>
							<span class="acContent"><c:out value="${e.title}"></c:out></span>
						</div>
						<div id="achievementbottom">
							<div class="bottomText">
								<span class="acTitle">取得条件</span> <span class="acContent">
									<c:out value="${e.condition}"></c:out>
								</span>
							</div>
							<div class="bottomText">
								<span class="acTitle">実績内容</span> <span class="acContent">
									<c:out value="${e.achievecontent}"></c:out>
								</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<style>
#wrapper {
	padding-top: 150px;
	display: flex;
	justify-content: center;
}

#achievementListAll {
	    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 85%;
    background: transparent;
}

#achievementTop {
	border-bottom: solid 0.5px;
}

#achievementbottom div {
	border-bottom: solid 0.5px;
}

.achievementList {
	margin: 30px 0;
	width: 100%;
	border: none;
}
.achieve {
    border: 2px solid;
    border-radius: 25px;
    margin: 10px;
    background-color: white;
    }
.soltyImage {
	display: flex;
	justify-content: center;
}

.soltyImage img {
	width: 30%;
	height: auto;
	margin: 0;
}
.bottomText {
    display: flex;
    justify-content: space-evenly;
}
.acContent {
	width: 70%;
	font-size: 35px;
}
</style>
	<script>
'use strict';
const background = '${user.bgicontent}';
document.getElementById("backImg").style = "background-image: url("+ background +")";
window.addEventListener('DOMContentLoaded', function() {
    // 実行したい処理を書く
    const taskCount = '${user.taskcount}';
	 const voiceSelect = '${user.voiceselect}';
	 const voiceSwitch = '${user.voiceswitch}';
 	if(taskCount > 0 && voiceSwitch === '0') {
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