 //<script src="sweetalert2.all.min.js"></script>
 //let result = session.getAttribute("result");
 //var achieve = '<%= session["taskcount"] %>'
 //<script src="//cdn.jsdelivr.net/npm/sweetalert2@11">
 //JSPに記述

 'use strict';

 //popup用JavaScript



	window.onload = function popup() {
		 if (flag.indexOf('失敗しました') == -1) {
			 	//成功時のメッセージ
			 	Swal.fire(
				  '成功しました。',
				  flag,
				  'success'
				);
			 } else {
			 	//失敗時のメッセージ
			 		Swal.fire({
				  	icon: 'error',
				  	title: '失敗しました。',
				  	text: flag,
			 	});
		 }
	}


 function achievePop() {
 if(achieve == 1 || achieve == 5 || achive == 10)
 	Swal.fire({
  title: '実績を解除しました',
  showClass: {
    popup: 'animate__animated animate__fadeInDown'
  },
  hideClass: {
    popup: 'animate__animated animate__fadeOutUp'
  }
  })
 };