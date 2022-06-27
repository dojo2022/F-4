<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:out value="${result}"/>
<c:if test="${ !empty result}">

<script>
const flag ='${result}';
const voiceSelect = '${user.voiceselect}';
const voiceSwitch = '${user.voiceswitch}';
//if (voiceSwitch == 0) {
	window.onload = () => {
 	sound();
 	popup();
	}
//} else if (voiceSwitch == 1)

//}
</script>

<c:remove var="result" scope="session"/>
</c:if>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>未完了タスク | Sol-ty</title>
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
		<h2>未完了タスク</h2>
	</div>
	<div id="logoutLogo">
	<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>
	</div>
</header>
<body>
<div class="incompClip">
<span class="masking-tape"></span>
<div class="incompTask">
	<h2>
		<div id="currentDateIncomp">${today}</div>
	</h2>
	<form method="POST" id="taskForm" name="f1">
	<input type="hidden" id="taskid" name="TASKID">
	<input type="hidden" name="TASKFLAG" value="未完了">
		<c:forEach var="e" items="${taskList[0]}">
			<div id="incompToday">
				<input type="checkbox" name="taskflag" value="${e.taskid}" class="taskIncomp">
				<input type="text" value="${e.taskcontent}" class="taskIncomp">
				<span>${e.deadline}</span>
				<button id="taskEdit" onclick="">edit</button>
				<br>
			</div>
		</c:forEach>


		<h2 id="pastDateIncomp">前日まで</h2>
		<c:forEach var="e" items="${taskList[1]}">
			<div class="incompYesterday">
				<input type="checkbox" name="taskflag" value="${e.taskid}" class="taskIncomp">
				<input type="text" value="${e.taskcontent}" class="PreTaskIncomp">
				<span>${e.deadline}</span>
				<button id="taskEdit">edit</button>
				<br>
			</div>
		</c:forEach>
		<div id=mode>
			<div id="switchMode">
				モード切替<br>
				<div id="doneOrDelete">
				<input type="radio" name="radio" value="done"
					id="radioDone" onclick="changeButton();" checked>完了
				<input type="radio" name="radio" value="delete" id="radioDelete"
					onclick="changeButton();">削除
				</div>
			</div>
			<input type="hidden" value="完了" name="COMP" id="send">
			<input type="submit" value="完了" class="doneDelete" id="switchModeDone"> <!--  onClick="sound()" -->
			<input type="submit" value="削除" name="DELETE" class="doneDelete"  id="switchModeDelete">
		</div>
	</form>
</div>

	<!--メインここまで-->


<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/Sol_ty/js/popup.js"></script>
<script>
'use strict';
//完了ボタンを押した際に音声を流す
function sound() {
	if(flag.indexOf("失敗") == -1 && flag.indexOf("更新しました") != -1) {
		const voiceSelect = '${user.voiceselect}'
		const voicePath = ["VoiceCompTaskKotaro.wav","VoiceCompTaskRyusei.wav",
			  "VoiceCompTaskMetan.wav","VoiceCompTaskTsumugi.wav"];
	    const music = new Audio("voice/" + voicePath[voiceSelect-1]);
	    //const music = new Audio("voice/" + voicePath[1]);"VoiceCompTaskKotaro.wav"
	    music.play();
	    music.loop = false;
	}
	else if(flag.indexOf("失敗") == -1 && flag.indexOf("削除しました") != -1) {
		const voiceSelect = '${user.voiceselect}'
		const voicePath = ["VoiceTaskFDeleteKotaro.wav","VoiceTaskDeleteRyusei.wav",
			  "VoiceTaskDeleteMetan.wav","VoiceTaskDeleteTsumugi.wav"];
	    const music = new Audio("voice/" + voicePath[voiceSelect-1]);
	    //const music = new Audio("voice/" + voicePath[1]);"VoiceCompTaskKotaro.wav"
	    music.play();
	    music.loop = false;
	}
	else if(flag.indexOf("未完了") != -1) {
		const voiceSelect = '${user.voiceselect}'
		const voicePath = ["VoiceIncompTaskKotaro.wav","VoiceIncompTaskRyusei.wav",
			  "VoiceIncompTaskMetan.wav","VoiceIncompTaskTsumugi.wav"];
	    const music = new Audio("voice/" + voicePath[voiceSelect-1]);
	    //const music = new Audio("voice/" + voicePath[1]);
	    music.play();
	    music.loop = false;
	}
  }

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
        	var inputFlag = document.querySelectorAll("input[name=taskflag]");
        	var taskstatus = document.getElementById("taskflag");
        	let taskid = "";

function getTaskid() {
	if( 0 < inputFlag.length ) {
		let com = "";
		for(var checked_data of inputFlag) {
			if(checked_data.checked){
		//処理
		taskid += com + checked_data.value;
		com = ",";
			}
		}
		document.getElementById("taskid").value = taskid;
	}
}

	 switchModeDone.addEventListener('click', function(event){
        		getTaskid();
	        	document.getElementById("send").value = switchModeDone.value;
	        	document.forms.f1.action = "/Sol_ty/UpdateDeleteServlet";
	        	document.forms.f1.submit();
        		});
 switchModeDelete.addEventListener('click', function(event){
		getTaskid();
 	document.getElementById("send").value = switchModeDelete.value;
 	document.forms.f1.action = "/Sol_ty/UpdateDeleteServlet";
 	document.forms.f1.submit();
		});

        	/*switchModeDelete.addEventListener('submit', event => {
        		event.preventDefault();

        	})
        	/*

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
*/
  </script>
</body>
<footer>
VOICEVOX:白上虎太郎
VOICEVOX:四国めたん
VOICEVOX:春日部つむぎ
VOICEVOX:青山龍星
</footer>
</html>
