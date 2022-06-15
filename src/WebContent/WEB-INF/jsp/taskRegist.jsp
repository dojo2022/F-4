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
<!-- IMPORTANT: No CSS link needed as of v1 - It's all inlined -->
<!-- Pre v1.0.0 versions need the minified css -->
<!-- <link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'> -->
</head>
<!--ヘッダーここから-->
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
		<h2>タスク登録</h2>
	</div>
	<a href="/Sol_ty/LogoutServlet"><img src="/image/logout.png"
		alt="ログアウト"></a>
	</div>
</header>

<body>
	<form id="registForm">

		<div id='app'>
			<!--<v-calendar></v-calendar>-->
			<v-date-picker v-model='selectedDate' :popover="popover"
				v-model="date" @dayclick="onDayClick">
			<template v-slot="{ inputValue, inputEvents }">
				<div id="weekDay" style="display: flex;">
					<div id="currentDate"></div>
					<div>{{inputValue}}</div>
					<div v-on="inputEvents" style="cursor: pointer;">▼</div>
				</div>
			</template>
			</v-date-picker>
		</div>
		?
		<div>
			時間指定 <input type="checkbox" id="timeCheckOnOff" class="timeCheck"
				onclick="timeOnOff();">
		</div>
		<input type="time" name="example" id="timeInput">
		</p>
		<input type="text" value="" placeholder="タスク入力">
		</p>
		<input type="submit" value="登録">
	</form>

	<!-- 1. Link Vue Javascript -->
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	?
	<!-- 2. Link VCalendar Javascript (Plugin automatically installed) -->
	<script src='https://unpkg.com/v-calendar'></script>
	?
	<!--3. Create the Vue instance-->
	<script>
        new Vue({
            el: '#app',
            inputValue: new Date(),
            data: {
                selectedDate: null,
                date: new Date(),
                inputValue: new Date(),
                popover: { visibility: 'click' }
            },
            methods: {
                onDayClick(day) {
                    alert(day.ariaLabel.substring(0, day.ariaLabel.indexOf("日")+1));
                    console.log(`${day.year}/${day.month}/${day.day}`);
                    document.getElementById('currentDate').style.display ='none';
                }
            }
            })

            date = new Date();
            year = date.getFullYear();
            month = date.getMonth() + 1;
            day = date.getDate();
            document.getElementById("currentDate").innerHTML = year + "年" + month + "月" + day + "日";


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
</html>
