<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport'
	content='width=device-width, initial-scale=1, shrink-to-fit=no'>
<meta http-equiv='x-ua-compatible' content='ie=edge'>
<title>タスク登録 | Sol-ty</title>
<link rel="stylesheet" href="/Sol_ty/css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<script src='https://unpkg.com/v-calendar'></script>
</head>
<!--ヘッダーここから-->


<body id="backImg">
<header class="header">
	<a href="#sidemenu" class="hamburger-menu">
		<div></div>
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
		<h2>タスク登録</h2>
	</div>
	<div id="logoutLogo">
	<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>
	</div>
</header>
<span class="masking-tapeRegist"></span>
	<form id="registForm" method="post" action="/Sol_ty/TaskRegistServlet">
	<p id="taskRegistForm">～タスク登録フォーム～</p>
	<p id="changeDateClick">※日付クリックで日付の変更ができます。</p>

<input type="hidden" id="regist" name="REGISTDAY">
		<div id='app'>
			<!--<v-calendar></v-calendar>-->
			<v-date-picker v-model='selectedDate' :popover="popover"
				v-model="date" @dayclick="onDayClick">
			<template v-slot="{ inputValue, inputEvents }">
				<div id="weekDay" style="display: flex;">
					<div v-on="inputEvents" id="currentDate" style="display: flex; cursor: pointer;">${registday}</div>
					<!--div style="cursor: pointer;">▼</div-->
				</div>
			</template>
			</v-date-picker>
		</div>
		<div id="timeSelect">
			時間指定 <input type="checkbox" id="timeCheckOnOff" class="timeCheck" onclick="timeOnOff();">
		<input type="time" name="DEADLINE" id="timeInput"><br>
		</div>
		<div class="cp_iptxt">
		<input type="text" name="TASKCONTENT" id="taskInputContent" placeholder="タスク内容入力">
		<span class ="focus_line"></span>
		</div><br>
		<input type="submit" id="taskRegistBtn" value="登録">
	</form>
	<script>
	const background = '${user.bgicontent}';
	document.getElementById("backImg").style = "background-image: url("+ background +")";
        new Vue({
            el: '#app',
            inputValue: new Date(),
            data: {
                selectedDate: null,
                date: new Date(),
                popover: { visibility: 'click' }
            },
            methods: {
                onDayClick(day) {

                	document.getElementById('currentDate').innerHTML = day.year+"/"+day.month.toString().padStart(2, "0")+"/"+day.day.toString().padStart(2, "0");
                	document.getElementById('regist').value = day.year+day.month.toString().padStart(2, "0")+day.day.toString().padStart(2, "0");
                }
            }
            })

            /*date = new Date();
            year = date.getFullYear();
            month = date.getMonth() + 1;
            day = date.getDate();*/
            document.getElementById('regist').value = '${registday}'.replaceAll("/", "");
            console.log(document.getElementById('regist').value);
            //document.getElementById("currentDate").innerHTML = year + "年" + month + "月" + day + "日";


   document.getElementById('timeInput').style.display = 'none'
  function timeOnOff() {

  if (document.getElementById('timeCheckOnOff').checked){
    // 完了を表示
    document.getElementById('timeInput').style.display = 'inline'

  }else{
    // 削除を表示
    document.getElementById('timeInput').style.display = 'none'
  }
}

  </script>
</body>
	<footer>
VOICEVOX:白上虎太郎
VOICEVOX:四国めたん
VOICEVOX:春日部つむぎ
VOICEVOX:青山龍星
</footer>
</html>

