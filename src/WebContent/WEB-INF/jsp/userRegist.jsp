<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録画面</title>
</head>
<body>
    <div class="titleLogo">
    <h1>Sol_ty</h1>
    </div>
    <div id="signupTitle">
    <h2>新規登録</h2>
    </div>
    <form method="post" id="signUp" action="/Sol_ty/LoginServlet">
    <div class="newRegistForm">
    <input type="text" value="" placeholder="ユーザーネーム入力" ></p>
    </div>
    <div class="newRegistForm">
    <input type="text" value="" placeholder="パスワード入力" ></p>
    </div>

        <div class="question">
            <label for="prefecture">*秘密の質問</label>
            <select name="prefecture">
            <option value="">選択してください</option>
            <option value="出身小学校の名前は？">出身小学校の名前は？</option>
            <option value="最初に飼ったペットの名前は？">最初に飼ったペットの名前は？</option>
            <option value="生まれた町の名前は？">生まれた町の名前は？</option>

            </select>
        </div>

    <input type="text" value="" placeholder="秘密の質問入力" ></p>


        <input type="submit" value="登録" id="regist" class="submitButton">
    </form>


</body>