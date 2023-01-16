import {imgFileUploader} from '../common/img-file-uploader.js';

(function() {
	var uploader = imgFileUploader;
	document.querySelector('.uploader-container')
	.append(uploader.container);
	
	document.querySelectorAll('a.next-step')
	.forEach(x => x.addEventListener('click', (e) => {
		const target = e.target.closest('#register-list');
		const steps = ['first-step', 'second-step', 'third-step'];
		console.log(target.className);
		
		target.className = steps[steps.indexOf(target.className)+1];
	}));
	
//	document.querySelector('button[type="submit"]')
//	.addEventListener('click', async (e) => {
//		e.preventDefault();
//		var form = e.target.closest('form');
//		
//		// 이미지 파일 비동기 업로드하고, 업로드 정보를 받아온다.
//		var result = await imgFileUploader.uploadImageAjax('/uploadStyleImage');
//		form.innerHTML += result;
//		form.submit();
//	});
})();

function validation() {
	
	return true;
}


//	$('.editable').each(function(_, textDiv){
//		if ($(textDiv).prop('tagName') == 'div') return;
//		
//		var html = $('textarea[name="style_content"]');
//		var text = $('textarea[name="style_text_content"]');
//		$(textDiv).on('input', function({target, data}) {
//			console.log(data);
//			if (data == '#') alert('#을 누르셨습니다.');
//			$(html).val(target.innerHTML);
//			$(text).val(target.innerText);
//		});
//	    this.contentEditable = true;
//	});

