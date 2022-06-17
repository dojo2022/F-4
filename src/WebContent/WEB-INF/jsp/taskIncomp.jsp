<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>未完了タスク | Sol-ty</title>
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
		<h2>未完了タスク</h2>
	</div>
	<div>
	<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>
	</div>
</header>
<body>
	<h2>
		<div id="currentDateIncomp"></div>
	</h2>
	<form method="POST" action="/Sol_ty/UpdateDeleteServlet">
		<c:forEach var="e" items="${taskList[0]}">
			<div id="incompToday">
				<input type="checkbox" name="taskflag" value="$e.taskid" class="taskIncomp">
				<input type="text" value="$e.taskcontent" class="taskIncomp">
				<button id="taskEdit">edit</button>
				<br>
			</div>
		</c:forEach>



		<h2>前日まで</h2>
		<c:forEach var="e" items="${taskList[1]}">
			<div class="incompYesterday">
				<input type="checkbox" name="taskflag" class="PreTaskIncomp">
				<input type="text" value="task" class="PreTaskIncomp">
				<button id="taskEdit">edit</button>
				<br>
			</div>
		</c:forEach>
		<div id=mode>
			<div id="switchMode">
				モード切替<br> <input type="radio" name="radio" value="done"
					id="radioDone" onclick="changeButton();" checked>完了<br>
				<input type="radio" name="radio" value="delete" id="radioDelete"
					onclick="changeButton();">削除
			</div>
			<input type="submit" name="SwitchModeDone" value="完了"
				class="doneDelete" id="switchModeDone" onClick="sound()">
			<audio id="sound" preload="auto">
				<source src="/.wav" type="audio/wav">
			</audio>
			<input type="submit" name="SwitchModeDelete" value="削除"
				class="doneDelete" id="switchModeDelete">
		</div>
	</form>
	<!--メインここまで-->


	<script>
  'use strict';
  document.getElementById('switchModeDone').style.display ='inline';
  document.getElementById('switchModeDelete').style.display ='  none';
  function changeButton() {

  if (document.getElementById('radioDone').checked){
    // 完了を表示
    document.getElementById('switchModeDone').style.display = 'inline'
    document.getElementById('switchModeDelete').style.display = 'none'
  }else{
    // 削除を表示
    document.getElementById('switchModeDone').style.display = 'none'
    document.getElementById('switchModeDelete').style.display = 'inline'
  }
}
document.getElementById("currentDateIncomp").innerHTML = getNow();
          function getNow(){
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var day = now.getDate();

            var s =year + "年" + month + "月" + day + "日";
            return s;
          }
          /*function deleteRow() {
        	  const checkedList = document.querySelectorAll(".table [name='DeleteName[]']:checked");
        	  if (checkedList.length === 0) {
        	    alert("選択してください");
        	    return;
        	  }
        	  if(!confirm("削除しますか？")) {
        	    return;
        	  }
        	  checkedList.forEach(check => check.closest("tr").remove());
        	}
        	*/
        	//疑似クラスchecked
        	// 興味・関心のある分野

        	const switchModeDone = document.getElementById("switchModeDone");
        	const switchModeDelete = document.getElementById("switchModeDelete");
        	var inputFlag = document.querySelectorAll("input[name=taskflag]:checked");
        	var taskstatus = document.getElementById("taskflag");

        	switchModeDone.addEventListener('submit', event => {
        		event.preventDefault();
	        	if( 0 < inputFlag.length ) {

	        		for(var checked_data of inputFlag) {
	        		//処理

	        		taskstatus.setAttribute("未完了", "完了");


	        		}
	        	}
	        	switchModeDone.submit();
        		});
        	}
        	switchModeDelete.addEventListener('submit', event => {
        		event.preventDefault();

        	})


        	(function (window, $) {
  'use strict';

  $.fn.useSound = function (_event, _id) {
    var se = $(_id);
    this.on(_event, function(){
      se[0].currentTime = 0;
      se[0].play();
    });
    return this;
  };

})(this, this.jQuery);

$('.btn a').useSound('mousedown touchstart', '#sound');
  </script>
</body>
</html>
