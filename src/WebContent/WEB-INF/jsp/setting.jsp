<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${user.taskcount >= 10}">
	   <script>
	   window.onload = () => {document.getElementById("bgiUpload").style="height: auto; opacity: 1; pointer-events: unset;"}
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

<body>
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
<div id="wrapper">
   <div id="settingWrap">
   <!--span class="masking-tape"></span-->
	<form id="language" method="post" action="/Sol_ty/SettingServlet">
		<div class="language2">
			<div class="settingTitle">音声設定</div>

			<div id="vcRadio">
				<input type="hidden" id="switchVal" name="VOICESWITCH" value="${user.voiceswitch}">
				<input type="radio" class="voiceSwitch" name="vswitch" value="0" style="transform: scale(2.0);" />
				ON
				<input type="radio" class="voiceSwitch" name="vswitch" value="1" style="transform: scale(2.0);" />
				OFF
			</div>
		</div>
		<div class="language2">
			<div class="settingTitle">Voice</div>
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
			<div class="settingTitle">壁紙</div>
			<div>
				<select id="bgi" name="BGISELECT">
				<c:forEach var="e" items="${bgiList}">
					<option value="${e.bgiselect}">${e.bgititle}</option>
				</c:forEach>
				</select>
			</div>
		</div>
		<input type="submit" id="bgiSubmit" value="反映">
	</form>


	<div id="bgiUpload" style="height: 100px; opacity: 0; pointer-events: none;">
			<div id="upload">
				<div class="settingTitle settingUpload">画像アップロード</div>
				<label id="bgicontent" for="file_upload">
				ファイルを選択
				  <input type="file" id="file_upload" name="BGICONTENT" />
				</label>
			</div>
			<canvas id="preview" style="max-width:200px; position: unset;"></canvas>
		</div>


	</div>
	</div>
<footer>
VOICEVOX:白上虎太郎
VOICEVOX:四国めたん
VOICEVOX:春日部つむぎ
VOICEVOX:青山龍星
</footer>
</body>
<style>
form#language {
margin: 0;
    width: 100%;
    padding-top: 50px;
    text-align: center;
}
.language2 div {
    width: 45%;
}
#wrapper {
    display: flex;
    justify-content: center;
    padding-top: 150px;
}
#settingWrap {
width: 60%;
  padding: 10px;
  border: 1px solid #ddd;
  background-size: cover;
  background-clip: content-box;
  background-color: white;
  box-sizing: border-box;
  position: relative;
  /*margin: auto;
  top: 30px;
    padding: 50px 50px 40px;
    border-radius: 4px;*/
}
#settingWrap:after {
  content: "";
  display: block;
  position: absolute;
  border: 70px solid transparent;
  border-bottom: 70px solid #efefef;
  bottom: -80px;
  right: -85px;
  box-shadow: 0px 7px 6px -9px black;
  transform: rotate(135deg);
}

#settingWrap:before {
  content: "";
  display: block;
  position: absolute;
  border: 70px solid transparent;
  border-top: 70px solid #efefef;
  top: -80px;
  left: -85px;
  box-shadow: 0px -7px 6px -9px black;
  transform: rotate(135deg);
}
div#vcRadio {
    display: flex;
    align-items: center;
    justify-content: space-around;
    font-size: 30px;
}
label > input {
display:none;
}
#bgicontent {
color: #ffffff;
background-color: #006DD9;
margin-top: 40px;
padding: 10px;
border: double 4px #AAAAAA;
}
/*#settingWrap {
    width: 70%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-size: 30px;
    border: 2px solid;
    border-radius: 15px;
    margin-bottom: 50px;
}*/
input#bgiSubmit {
    width: 140px;
    height: 52px;
    padding: 0;
    font-size: 20px;
        color: #ffffff;
    background-color: #006DD9;
    margin: 40px 0 0;
        border: double 4px #AAAAAA;
}
#bgiupload {
	width: 100%;
	display: flex;
    flex-direction: column;
    align-items: center;
}
#upload {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px 0;
}
.settingTitle {
    font-size: 40px;
    padding-top: 20px;
}
.settingUpload {
    width: 100%;
    border-bottom: solid 0.5px;
    text-align: center;
}
.language2 {
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    padding-top: 30px;
    border-bottom: solid 0.5px;
}
select {
width: 95%;
    height: 60px;
    font-size: 30px;
}
select option {
    font-size: 15px;
}
footer {
    display: flex;
    justify-content: center;
    padding-top: 50px;
}
</style>
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