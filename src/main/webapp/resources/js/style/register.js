import {imgFileUploader} from '../common/img-file-uploader.js';
import {imgSlider} from '../common/img-slider.js';

(function() {
	const uploader = imgFileUploader;
	uploader.setURL('/uploadStyleImage');
	document.querySelector('.uploader-container')
	.append(uploader.container);
	
	const slider = imgSlider();
	document.querySelector('.img-slider-container')
	.append(slider.container);
	
	document.querySelector('#selectRatio')
	.addEventListener('click', (e) => {
		const selected = e.target.closest('ul#selectRatio').querySelector('li.selected');
		const newSelect = e.target.closest('#selectRatio li');
		if (!newSelect) return;
		
		selected.className = '';
		newSelect.className = 'selected';
	});
	
	document.querySelectorAll('a.next-step, a.prev-step')
	.forEach(x => x.addEventListener('click', (e) => {
		e.preventDefault();
		const register = e.target.closest('#register-list');	
		const steps = ['first-step', 'second-step', 'third-step'];
		const newStep = e.target.classList[0] == 'next-step'
					? steps.indexOf(register.className)+1 
					: steps.indexOf(register.className)-1;
		
		register.className = steps[newStep];
	}));
	
	document.querySelector('a#submit')
	.addEventListener('click', async (e) => {
		e.preventDefault();
		var form = e.target.closest('form');
		
		// 이미지 파일 비동기 업로드하고, 업로드 정보를 받아온다.
		var result = await imgFileUploader.uploadImageAjax();
		var div = document.createElement('div');
		div.innerHTML = result;
		
		form.append(div);
		form.submit();
	});
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

