<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>カレンダー画面 | Sol-ty</title>
<link rel="stylesheet" href="css/style.css">
<link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>
<script src='https://unpkg.com/v-calendar'></script>
</head>
<!--ヘッダーここから-->
<header class="header">
  <a href="#sidemenu" class="hamburger-menu">
    <div></div>
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
  <div class="navtext"><h2>カレンダー</h2></div>
    <a href = "login.html"><img src="image/logout.png" alt="ログアウト"></a>
</div>
</header>
    <body>
            <div id='yearDate'>
              <v-calendar :attributes='attrs' is-expanded>
                <template #day-popover>
                  <div class="mouseover__conts">
                    <p class="btn-mouseover btn-pink">
                      <a href="/Sol_ty/TaskRegistServlet">マウスオーバー</a>
                      </p>
                      <div class="mouseover__box">
                       <p>マウスオーバーで表示されるポップアップウィンドウです。</p>
                       </div>
                      </div>
                </template>
              </v-calendar>
            </div>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>
          <link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>

          <script src='https://unpkg.com/v-calendar'></script>
    <script>
    new Vue({
        el: '#yearDate',
        data: {
          attrs: [
              {
               key: 'today',
                highlight: {
                  backgroundColor: '#ff8080',
                },
                dates: new Date(),
                popover: {
                  label: 'メッセージを表示できます',
                },
              }
          ],
        }
      })
      </script>
      </div>
    </body>
</html>