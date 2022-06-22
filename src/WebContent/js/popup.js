 //<script src="sweetalert2.all.min.js"></script>
 //let result = session.getAttribute("result");
 //let achieve = session.getAttribute("taskcount")
 //JSPに記述

 'use strict';

 //popup用JavaScript


 function submitButton() {
	 if (result.indexOf('失敗しました') == -1) {
	 	//成功時のメッセージ
	 	Swal.fire(
		  '成功しました。',
		  result,
		  'success'
		);
	 } else {
	 	//失敗時のメッセージ
	 	Swal.fire({
		  	icon: 'error',
		  	title: '失敗しました。',
		  	text: result,
	 	});
 	 };
 };

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