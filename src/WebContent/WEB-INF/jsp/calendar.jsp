<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>カレンダー画面 | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">
<link rel='stylesheet' href='css/main.min.css' />
<script src='js/main.min.js'></script>
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
			<li><a href="/Sol_ty/CalenderServlet">カレンダー</a></li>
			<li><a href="/Sol_ty/AchievementServlet">実績</a></li>
			<li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
			<li><a href="/Sol_ty/SettingServlet">設定</a></li>
		</ul>
	</div>
	<div class="navtext">
		<h2>カレンダー</h2>
	</div>
	<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png"
		alt="ログアウト"></a>
</header>
<!-- ヘッダーここまで -->

<body>
	<div id="wrapper">
		<div id='calendar'></div>
		<label id="popLabel" for="">
			<form id="popup" style="display: none;" method="post"
				action="/Sol_ty/CalendarServlet">
				<div id="popupDay">
					<input type="hidden" id="registday" name="REGISTDAY" /> <span
						id="popupText"></span>
				</div>
				<div id="popupButton">
					<div>
						<input type="submit" name="SUBMIT" value="タスク確認" />
					</div>
					<div>
						<input type="submit" name="SUBMIT" value="タスク登録" />
					</div>
				</div>
			</form>
			<div id="blackBg"></div>
		</label>
	</div>
</body>
<script>
    function pop() {
      document.getElementById("popup").style = "display: none;";
      document.getElementById("blackBg").style = "display: none";
    }

    async function eventsGet(callback) {
    	const params = { 'YEAR' : year, 'MONTH' : month, 'SUBMIT': 'イベント取得' };// 渡したいパラメータをJSON形式で書く
		const query_params = new URLSearchParams(params);
	    const option =  { method: 'POST', cache: 'no-cache', body: query_params }

  	    const response = await fetch('/Sol_ty/CalendarServlet', option);
  	    const json = await response.json();
  	    await callback(json.data);

	    return;
    }
    async function moveSchedule(id, start){

    	const params = { 'TASKID' : id, 'REGISTDAY' : start, 'SUBMIT': '日付変更' };// 渡したいパラメータをJSON形式で書く
		const query_params = new URLSearchParams(params);
	    const option =  { method: 'POST', cache: 'no-cache', body: query_params }

  	    const response = await fetch('/Sol_ty/CalendarServlet', option);
	    return;
    }

    const day = new Date();
    let year = day.getFullYear();
    let month = day.getMonth()+1;

    document.addEventListener('DOMContentLoaded', function () {
      const poplabel = document.getElementById('popLabel');
      poplabel.addEventListener('click', function () {
          pop();
      });


      const calendarEl = document.getElementById('calendar');

      const calendar = new FullCalendar.Calendar(calendarEl, {
        locale: 'ja',
        headerToolbar: {
          left: 'prev today',//next
          center: 'title',
          right: 'next' //'dayGridMonth,timeGridWeek,timeGridDay'
        },
        customButtons: {
            prev: {
              text: 'Prev',
              click: function() {
            	  month--;
            	  if(month < 1) {
            		  month = 12;
            		  year--;
            	  }
                  calendar.prev();
              }
            },
            next: {
              text: 'Next',
              click: function() {
            	  month++;
            	  if(month > 12) {
            		  month = 1;
            		  year++;
            	  }
                  calendar.next();
              }
            },
        },
        initialDate: new Date(),
        navLinks: true, // can click day/week names to navigate views
        //selectable: true,
        aspectRatio: 0.835,
        selectMirror: true,
        selectLongPressDelay: 0,
        eventLongPressDelay: 0,
        eventDurationEditable: false,
        //fixedWeekCount: false,
        dateClick: function (arg) {
            document.getElementById("registday").value = arg.dateStr.replaceAll("-", "");
            //console.log(document.getElementById("registday").value);
            document.getElementById("popupText").textContent = arg.dateStr;
            document.getElementById("popup").style = "display: flex;";
            document.getElementById("blackBg").style = "display: block";
        },
        eventDrop: function(info) {
            let eventDay = info.event.startStr.replaceAll('-', '');
            // ドラッグ後の日付にデータ更新する
            moveSchedule(info.event.id, parseInt(eventDay));
        },
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events: function(info, successCallback, failureCallback) {
        	eventsGet(successCallback)
        }
      });
      calendar.render();
    });

  </script>
<style>
html {
	-ms-touch-action: manipulation;
	touch-action: manipulation;
}

body { //
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#wrapper {
	padding: 100px 10px 0;
	background: white;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	border-collapse: collapse;
}

.fc-daygrid-day-frame {
	margin: 0;
}

.fc-daygrid-day-number {
	pointer-events: none;
}

.fc-col-header, .fc-scrollgrid-sync-table, .fc-daygrid-body.fc-daygrid-body-balanced
	{
	width: 100%;
}

#popup {
	width: 80%;
	z-index: 9999;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	position: absolute;
	top: 330px;
	left: 10%;
	height: 150px;
	text-align: center;
	font-size: 25px;
	background-color: #eee;
	border: 1px solid rgba(0, 0, 0, 0.33);
}

#popupButton {
	display: flex;
	justify-content: center;
}

#popupButton div {
	width: 35%;
	margin: 4px 0;
}

#popupButton div input {
	border: none;
	background-color: rgb(86, 86, 212);
	height: 40px;
	width: 120px;
	border-radius: 10px;
	color: white;
	font-weight: bold;
	border-bottom: 2px solid rgba(0, 0, 0, 0.33);
}

#popupButton div input:active {
	position: relative;
	top: 2px;
	border: 0;
}

#popLabel {
	z-index: 999;
}

#blackBg {
	display: none;
	z-index: 99;
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background-color: #000;
	opacity: .7;
}
</style>
</body>
</html>