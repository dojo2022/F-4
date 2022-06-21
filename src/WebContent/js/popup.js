 //<script src="sweetalert2.all.min.js"></script>
 //let result = request.getAttribute("result");
 //JSPに記述

 'use strict';

 //popup用JavaScript


 function submitButton() {
	 if (result == true) {
	 	//成功時のメッセージ
	 	Swal.fire(
		  '成功しました。',
		  '変更が反映されました。',
		  'success'
		);
	 } else if (result == false) {
	 	//失敗時のメッセージ
	 	Swal.fire({
		  	icon: 'error',
		  	title: '失敗しました。',
		  	text: 'もう一度お試しください。',
	 	});
 	 };
 };