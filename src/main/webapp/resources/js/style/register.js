import {imgFileUploader} from '../common/img-file-uploader.js';

(function() {
	var uploaderContainer = document.querySelector('.uploader-container');
	
	//파일 업로더 모듈 	
	var uploader = imgFileUploader;
	uploaderContainer.append(uploader.container);
	
	document.querySelector('button[type="submit"]')
	.addEventListener('click', async (e) => {
		e.preventDefault();
		var form = e.target.closest('form');
		
		var result = await imgFileUploader.uploadImageAjax('/uploadStyleImage');
		form.innerHTML += result;
		form.submit();
	});
	
})();

function validation() {
	
	return ;
}


	//div 입력창 만드는 함수
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

