<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="sweetalert2.all.min.js"></script>
<script src="/Sol_ty/js/popup.js">
<title>設定画面</title>
<link rel="stylesheet" type="text/css" href="/Sol_ty/css/style.css">
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
		<ul class="hamburgerMenu">
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
		<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png"
			alt="ログアウト"></a>
	</div>
</header>
<body>
	<form id="language">
		<div class="language2">
			<div>音声設定</div>

			<div>
				<input type="radio" class="voiceSwitch" name="VOICESWITCH" value="ON">
				ON <input type="radio" class="voiceSwitch" name="VOICESWITCH" value="OFF">
				OFF
			</div>
		</div>
		<div class="language2">
			<div>Voice</div>
			<div>
				<select name="VOICESELECT">
					<option value="男1">男1</option>
					<option value="男2">男2</option>
					<option value="男3">男3</option>
				</select>
			</div>
		</div>

		<div class="language2">
			<div>壁紙</div>
			<div>
				<select name="BGISELECT">
					<option value="男1">男1</option>
					<option value="男2">男2</option>
					<option value="男3">男3</option>
				</select>
			</div>
		</div>
	</form>


	<form action="" method="post" class="bgiSend"
		enctype="multipart/form-data">
		<div class="bgiUpload">

			<div>
				画像アップロード <input type="file" id="BGICONTENT" name="BGICONTENT">
			</div>
		</div>
		<div id="file_area"></div>

		<!-- <div>
			<input type="submit" id="bgiSubmit" value="送信">
		</div>-->
		<input type="submit" id="bgiSubmit" value="反映">

	</form>
</body>
<script>
	function pop() {
	    document.getElementById("popup").style = "display: none;";
	    document.getElementById("blackBg").style = "display: none";
	  }
let result = request.getAttribute("result");
window.addEventListener('load', function() {
	if(result != null ) {
		submitButton();
	}
})
window.addEventListener('DOMContentLoaded', function(){

	  document.getElementById("BGICONTENT").addEventListener('change', function(e){

	    // (1)選択したファイルを読み込み
	    let file_reader = new FileReader();
	    file_reader.readAsDataURL(e.target.files[0]);


	    // (2)ファイルの読み込みが完了したら実行
	    file_reader.addEventListener('load', function(e) {

	      // (3)JSONにするデータを作成（この時点ではObject形式） 変更
	      let data = {
	        "BGICONTENT": e.target.result,
	      };

	      // (4)Fetch APIによるデータ送信
	      fetch('/Sol_ty/BgiUploadServlet', { // 送信先　変更
	        method: 'post', // メソッド
	        header: { // ヘッダー指定
	          'Content-Type': 'application/json'
	        },
	        body: JSON.stringify(data) // 送信データをセット（ここでJSON形式に変換）
	      })
	      .then(response => response.json())
	      .then(data => {


	        // (5)レスポンスデータ（JSON形式）からページに挿入
	        const file_area = document.getElementById('file_area');
	        const img_element = document.createElement('img');
	        img_element.src = data.image;
	        file_area.append(img_element);
	      });

	    });

	  });
	});
</script>
</html>