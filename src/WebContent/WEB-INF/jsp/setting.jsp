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
		<div class="ham-top"></div>
		<div></div>
		<div></div>
	</a>
	<div id="sidemenu" class="sidenavs">
		<label for="sidemenu" class="back"></label> <a href="#"
			class="close-btn">&times;</a>
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
	<div class="navtext">
		<h2>未完了タスク</h2>
	</div>
	<div>
		<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png"
			alt="ログアウト"></a>
	</div>
</header>
<body>
	<form id="language">
		<div class="language2">
			<div>音声設定</div>

			<div>
				<input type="radio" class="voiceSwitch" name="VOICESWITCH" value="ON">
				ON <input type="radio" class="voiceSwitch" name="VOICESWITCH" value="OFF">
				OFF
			</div>
		</div>
		<div class="language2">
			<div>Voice</div>
			<div>
				<select name="VOICESELECT">
					<option value="男1">男1</option>
					<option value="男2">男2</option>
					<option value="男3">男3</option>
				</select>
			</div>
		</div>

		<div class="language2">
			<div>壁紙</div>
			<div>
				<select name="BGISELECT">
					<option value="男1">男1</option>
					<option value="男2">男2</option>
					<option value="男3">男3</option>
				</select>
			</div>
		</div>
	</form>


	<form action="test.html" method="post" class="bgiSend"
		enctype="multipart/form-data">
		<div class="bgiUpload">

			<div>
				画像アップロード <input type="file" name="BGIUPLOAD">
			</div>
		</div>

		<div>
			<input type="submit" id="bgiSubmit" value="送信">
		</div>



		<input type="submit" id="bgiSubmit" value="反映">

	</form>
</body>

</html>