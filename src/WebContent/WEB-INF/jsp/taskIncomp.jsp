<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html id="backImg">
<head>
<meta charset="UTF-8">
<title>未完了タスク | Sol-ty</title>
<link rel="stylesheet" href="/Sol_ty/css/style.css">
</head>

<body style="background: transparent;">
<!--ヘッダーここから-->
<header class="header">
	<a href="#sidemenu" class="hamburger-menu">
		<div class="ham-top"></div>
		<div></div>
		<div></div>
	</a>
	<div id="sidemenu" class="sidenavs">
		<label for="sidemenu" class="back"></label> <a href="#" class="close-btn">&times;</a>
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
				<input type="checkbox" name="taskflag" value="${e.taskid}" class="taskIncomp" id="taskIncompCheck">
				<input type="text" value="${e.taskcontent}" class="taskIncomp" id="task${e.taskid}">
				<span class="deadlineTime">${e.deadline}</span>
				<button type="button" id="taskEdit" onclick="textEdit(${e.taskid})">編集</button>
			</div>
		</c:forEach>


		<h2 id="pastDateIncomp">前日まで</h2>
		<c:forEach var="e" items="${taskList[1]}">
			<div class="incompYesterday">
				<input type="checkbox" name="taskflag" value="${e.taskid}" class="taskIncomp" id="taskIncompCheck">
				<input type="text" value="${e.taskcontent}" class="PreTaskIncomp" id="task${e.taskid}">
				<span class="deadlineTime">${e.deadline}</span>
				<button type="button" id="taskEdit" onclick="textEdit(${e.taskid})">編集</button>
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
			<div id="change">
			<input type="submit" value="完了" class="doneDelete" id="switchModeDone"> <!--  onClick="sound()" -->
			<input type="submit" value="削除" name="DELETE" class="doneDelete"  id="switchModeDelete">
			</div>
		</div>
	</form>
</div>
	<!--メインここまで-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/Sol_ty/js/popup.js"></script>
<script>

'use strict';
const background = '${user.bgicontent}';
document.getElementById("backImg").style = "background-image: url("+ background +")";
//完了ボタンを押した際に音声を流す
function sound() {
	let voicePath = [];
	if(flag.indexOf("失敗") == -1 && flag.indexOf("更新しました") != -1) {
		voicePath = ["VoiceCompTaskKotaro.wav","VoiceCompTaskRyusei.wav",
			  "VoiceCompTaskMetan.wav","VoiceCompTaskTsumugi.wav"];
	}
	else if(flag.indexOf("失敗") == -1 && flag.indexOf("削除しました") != -1) {
		voicePath = ["VoiceTaskFDeleteKotaro.wav","VoiceTaskDeleteRyusei.wav",
			  "VoiceTaskDeleteMetan.wav","VoiceTaskDeleteTsumugi.wav"];
	}
	else if(flag.indexOf("未完了") != -1) {
		voicePath = ["VoiceIncompTaskKotaro.wav","VoiceIncompTaskRyusei.wav",
			  "VoiceIncompTaskMetan.wav","VoiceIncompTaskTsumugi.wav"];
	}
    const music = new Audio("voice/" + voicePath[voiceSelect-1]);
    music.play();
    music.loop = false;
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
        	//疑似クラスchecked
        	// 興味・関心のある分野
        	const switchModeDone = document.getElementById("switchModeDone");
        	const switchModeDelete = document.getElementById("switchModeDelete");
        	var inputFlag = document.querySelectorAll("input[name=taskflag]");
        	var taskstatus = document.getElementById("taskflag");
        	let taskid = "";

        	async function textEdit(taskid) {
        		 const taskcontent = document.getElementById("task"+taskid).value;
        		    const params = { 'TASKID' : taskid, 'TASKCONTENT' : taskcontent, 'COMP': '編集' };// 渡したいパラメータをJSON形式で書く
        			const query_params = new URLSearchParams(params);
        			const option =  { method: 'POST', cache: 'no-cache', body: query_params }

        		  	const response = await fetch('/Sol_ty/UpdateDeleteServlet', option);
        			if(response.ok)
        				Swal.fire('成功しました。','タスクを編集しました','success');
        			else Swal.fire({icon: 'error',title: '失敗しました。',text: 'タスクを編集できませんでした'});
        			return;
        	 }

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
  </script>
<c:if test="${ !empty result}">
<script>
const flag ='${result}';
const voiceSelect = '${user.voiceselect}';
const voiceSwitch = '${user.voiceswitch}';
 	if(voiceSwitch === '0') {
 		sound();
 	}
 	else popup();
</script>
<c:remove var="result" scope="session"/>
</c:if>

<footer>
VOICEVOX:白上虎太郎
VOICEVOX:四国めたん
VOICEVOX:春日部つむぎ
VOICEVOX:青山龍星
</footer>
<style>
input.taskIncomp, input.PreTaskIncomp {
    height: 90px;
    font-size: 35px;
    max-width: 455px;
    border: none;
    background: transparent;
    outline: none;
    margin: 0;
    padding: 0 0 0 20px;
}
.incompTask {
    margin: 190px 105px 30px;
}
button#taskEdit {
    font-size: 30px;
    border: 1px solid;
    width: 80px;
    height: 50px;
    border-radius: 15px;
    margin: 0;
}

input#taskIncompCheck {
    height: 10px;
    margin: 0;
    transform: scale(3.5);
}
div#incompToday, .incompYesterday {
    text-align: center;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    padding: 10px 20px 0;
    border-bottom: solid 0.5px;
}
span.deadlineTime {
    z-index: 1;
    position: unset;
    margin: 0;
    width: 87px;
    padding-right: 10px;
}
div#switchMode {
    padding: 0 20px;
}
input#switchModeDone {
    margin: 30px 0;
}
div#change {
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
</body>
</html>
