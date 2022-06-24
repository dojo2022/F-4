<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${ !empty result}">
<script>
const flag ='${result}';
const voiceSelect = '${user.voiceselect}';
window.onload = () => {
 sound();
}
</script>
<c:remove var="result" scope="request"/>
</c:if>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>完了タスク | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">

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
			<li><a href="/Sol_ty/CalenderServlet">カレンダー</a></li>
			<li><a href="/Sol_ty/AchievementServlet">実績</a></li>
			<li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
			<li><a href="/Sol_ty/SettingServlet">設定</a></li>
		</ul>
	</div>
	<div class="navtext">
		<h2>完了タスク</h2>
	</div>
	<div id="logoutLogo">
	<a href="LogoutServlet"><img src="image/logout.png" alt="ログアウト"></a>
	</div>
</header>
<body>
	<form id="taskCompList" method="POST" name="f1">
		<div id="taskCompleted">
		<input type="hidden" name="TASKFLAG" value="完了">
		<input type="hidden" id="taskid" name="TASKID">
			<c:forEach var="e" items="${compList}">
				<div class="taskComp">
					<input type="checkbox" name="taskflag" value="${e.taskid}" class="taskcompCheck">
					<div id="cmpTaskContent">${e.taskcontent}</div>

					<div>${e.deadline}</div>
					<div>締切：${ fn:substring(e.registday,0,4)}/${fn:substring(e.registday,4,6)}/${fn:substring(e.registday,6,8)}</div>
					<div>達成：${ fn:substring(e.compday,0,4)}/${fn:substring(e.compday,4,6)}/${fn:substring(e.compday,6,8)}</div>
				</div>
			</c:forEach>

		</div>
		<div id=backIncompBtn>
		<button type="submit" name="COMP" value="未完了" id="backIncomp" onclick="getTaskid()">未完了に戻す</button>
		</div>
	</form>
	<script>
const inputFlag = document.querySelectorAll("input[name=taskflag]");
function getTaskid() {
	let taskid = "";
	if( 0 < inputFlag.length ) {
		let com = "";
		for(const checked_data of inputFlag) {
			if(checked_data.checked){
		//処理
		taskid += com + checked_data.value;
		com = ",";
			}
		}
		document.getElementById("taskid").value = taskid;
		document.forms.f1.action = "/Sol_ty/UpdateDeleteServlet";
	 	document.forms.f1.submit();
	}
}
</script>
</body>
</html>
