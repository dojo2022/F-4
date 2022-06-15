<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | Sol-ty</title>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
</head>
<!--ヘッダーここから-->
<body>
    <div class = "titleLogo">
    <h1>Sol-ty</h1>
    </div>
<!--ヘッダーここまで-->
    <!--メインここから-->
    <form  id="loginForm" method="POST" action="/Sol_ty/LoginServlet">
      <div class="loginForm">
      <input type="text" name="username" placeholder="UserName" class="textInput">
      </div>
      <div class="loginForm">
        <span>
      <input type="text" name="password" placeholder="Password" class="textInput" id="textPassword">
      <span id="buttonEye" class="fa fa-eye" onclick="pushHideButton()"></span>
    </div>
      <input type="submit" name="login" class="submitButton" id="loginButton"value="ログイン">
      <p id ="output"></p>
      <span id="errorMessage"></span>
    </form>
    <p>または</p>
    <a href="signup.html" id = "signUp">新規登録</a>
    <!--メインここまで-->

    <script>
        'use strict';
        function pushHideButton() {
          var txtPass = document.getElementById("textPassword");
          var btnEye = document.getElementById("buttonEye");
          if (txtPass.type === "text") {
            txtPass.type = "password";
            btnEye.className = "fa fa-eye";
          } else {
            txtPass.type = "text";
            btnEye.className = "fa fa-eye-slash";
          }
        }
      document.getElementById('loginForm').onsubmit = function(event){
        const user = document.getElementById('loginForm').username.value;
        const pass = document.getElementById('loginForm').password.value;

    if (user === '' && pass === '') {
      document.getElementById('output').textContent = `※IDとパスワードが入力されていません`;
      return false;
    }else if (user === ''){
      document.getElementById('output').textContent = `※IDが入力されていません`;
      return false;
    }else if (pass === ''){
      document.getElementById('output').textContent = `※パスワードが入力されていません`;
      return false;
    }
  }
      </script>
</body>
</html>