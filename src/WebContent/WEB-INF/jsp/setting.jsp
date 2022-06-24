<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${user.taskcount >= 10}">
	   <script>
	   window.onload = () => {document.getElementById("bgiUpload").style="opacity: 1; pointer-events: unset;"}
	   </script>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--script src="sweetalert2.all.min.js"></script>
<script src="/Sol_ty/js/popup.js"> -->
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
		<a href="/Sol_ty/LogoutServlet"><img src="image/logout.png"alt="ログアウト"></a>
	</div>
</header>
<body>
	<form id="language">
		<div class="language2">
			<div>音声設定</div>

			<div>
				<input type="hidden" id="switchVal" name="VOICESWITCH" value="${user.voiceswitch}">
				<input type="radio" class="voiceSwitch" name="vswitch" value="0"/>
				ON
				<input type="radio" class="voiceSwitch" name="vswitch" value="1"/>
				OFF
			</div>
		</div>
		<div class="language2">
			<div>Voice</div>
			<div>
				<select id="voice" name="VOICESELECT">
					<option value="1">男1</option>
					<option value="2">男2</option>
					<option value="3">女1</option>
					<option value="4">女2</option>
				</select>
			</div>
		</div>

		<div class="language2">
			<div>壁紙</div>
			<div>
				<select name="BGISELECT">
				<c:forEach var="e" items="${bgiList}">
					<option value="${e.bgiselect}">${e.bgititle}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<input type="submit" id="bgiSubmit" value="反映">
	</form>


	<div id="bgiUpload" style="opacity: 0; pointer-events: none;">

			<div>
				画像アップロード <input type="file" id="bgicontent" name="BGICONTENT">
			</div>
		</div>
		<canvas id="preview" style="max-width:200px;"></canvas>
</body>

<script>

<script>
window.addEventListener('DOMContentLoaded', function(){
	const voiceSelect = '${user.voiceselect}';
	const voice = document.getElementById("voice");
	voice.options[voiceSelect-1].selected = true;

	const bgi = document.getElementById("bgi");
	const bgilist = bgi.options;
	const bgiSelect = '${user.bgiselect}';

	let index = 0;
	Array.from(bgilist).forEach(function(option) {
		if(option.value == bgiSelect) {
			bgi.selectedIndex = index;
		}
		index++;
	});

	const voiceSwitch = '${user.voiceswitch}';

	document.getElementsByName("vswitch").forEach(
            r => {
            	r.addEventListener("change" ,
                        e => {document.getElementById("switchVal").value = r.value;}
                );
            	if(r.value == voiceSwitch) {
            		r.checked = true;
            	}
            }

        );


	  document.getElementById("bgicontent").addEventListener('change', function(e){


				var fileReader = new FileReader();

				// 読み込み後に実行する処理
				fileReader.onload = (function() {

					// canvas にプレビュー画像を表示
					var canvas = document.getElementById('preview');
					var ctx = canvas.getContext('2d');
					var image = new Image();
					image.src = fileReader.result;
					//console.log(fileReader.result) // ← (確認用)

					image.onload = (function () {
						canvas.width = image.width;
						canvas.height = image.height;
						ctx.drawImage(image, 0, 0);
					});
				});
				// 画像読み込み
				fileReader.readAsDataURL(e.target.files[0]);

	    // (1)選択したファイルを読み込み
	    let file_reader = new FileReader();
	    file_reader.readAsDataURL(e.target.files[0]);

	    //console.log(e.target.files[0]);


	    // (2)ファイルの読み込みが完了したら実行
	    /*file_reader.addEventListener('load', function(e) {
	    	console.log(e.target.result);

	      // (3)JSONにするデータを作成（この時点ではObject形式） 変更
	      let data = {
	        "BGICONTENT": e.target.result
	      };
	      */
	    	const formData = new FormData();
	    	formData.append("BGICONTENT", e.target.files[0]);


	      // (4)Fetch APIによるデータ送信
	      fetch('/Sol_ty/BgiUploadServlet', {
	        method: 'post', // メソッド
	        header: { // ヘッダー指定
	          'Content-Type': 'multipart/form-data'
	        },
	        body: formData // 送信データをセット（ここでJSON形式に変換）
	      })
	      .then(response => response.json())
	      .then(json => {
	        // (5)レスポンスデータ（JSON形式）からページに挿入
	    	  let option = document.createElement("option");
	    	  option.text = json.option.filename;
	    	  option.value = json.option.bgiselect;
	    	  bgi.appendChild(option);
	      });

	    //});


	  });
	});
</script>
</html>