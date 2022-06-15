<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>未完了タスク | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">
<link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>
<script src='https://unpkg.com/v-calendar'></script>
</head>
<!--ヘッダーここから-->
<header class="header">
  <a href="#sidemenu" class="hamburger-menu">
    <div class = "ham-top"></div>
    <div></div>
    <div></div>
  </a>
    <div id="sidemenu" class="sidenavs">
  <label for = "sidemenu" class="back"></label>
  <a href="#" class="close-btn">&times;</a>
  <ul class="hamburgermenu">
    <li class="top">username</li>
        <li><a href="/Sol_ty/ListServlet">タスク表示</a></li>
        <li><a href="/Sol_ty/TaskRegistServlet">タスク登録</a></li>
        <li><a href="/Sol_ty/CalenderServlet">カレンダー</a></li>
        <li><a href="/Sol_ty/AchievementServlet">実績</a></li>
        <li><a href="/Sol_ty/CompTaskServlet">完了タスク</a></li>
        <li><a href="/Sol_ty/SettingServlet">設定</a></li>
  </ul>
    </div>
  <div class="navtext"><h2>未完了タスク</h2></div>
    <a href = "login.html"><img src="image/logout.png" alt="ログアウト"></a>
</div>
</header>
<body>
  <!--ヘッダーここまで-->
      <h2><div id="currentDateIncomp"></div></h2>
      <form>
       <c:forEach var="e" items="${}">
          <div id = "incompToday">
          <input type="checkbox" name="taskIncomp" class="taskIncomp">
          <input type ="textbox" value="task" ><button id="taskEdit">edit</button>
          <br>
          </div>
       </c:forEach>



          <h2>前日まで</h2>
          <c:forEach var="e" items="${}">
          <div class = "incompYesterday">
            <input type="checkbox" name="taskIncomp" class="taskIncomp">
            <input type ="textbox" value="task" ><button id="taskEdit">edit</button>
            <br>
          </div>
          </c:forEach>
      <div id =mode>
        <div id="switchMode">
          モード切替<br>
          <input type="radio"  name="radio" value="done" id = "radioDone" onclick="changeButton();" checked>完了<br>
          <input type="radio"  name="radio" value="delete" id="radioDelete"onclick="changeButton();">削除
        </div>
          <input type="submit" name="SwitchModeDone" value="完了" class="doneDelete" id="switchModeDone" >
          <input type="submit" name="SwitchModeDelete" value="削除" class="doneDelete" id="switchModeDelete" >
      </div>
        </form>
	</header>
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
  </script>
</body>
</html>
