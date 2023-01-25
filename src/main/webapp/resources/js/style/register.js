import {imgFileUploader} from '../common/img-file-uploader.js';
import {imgSlider} from '../common/img-slider.js';

(function() {
	const uploader = imgFileUploader;
	uploader.setOption({
		uploadURL: '/uploadStyleImage',
		saveName: 'style_image',
		slider: {
			ratio: 1,
			ratioFix: true,
			editMode: true,	
		}
	});
	uploader.init();
	document.querySelector('.uploader-container')
	.append(uploader.container);
	
	//이미지 비율 선택
	document.querySelector('#selectRatio')
	.addEventListener('click', (e) => {
		const selected = e.target.closest('ul#selectRatio').querySelector('li.selected');
		const newSelect = e.target.closest('#selectRatio li');
		if (!newSelect) return;
		
		selected.className = '';
		newSelect.className = 'selected';
		uploader.setRatio(Number(newSelect.dataset.ratio));
		document.querySelector('input[name="ratio"]').value = newSelect.dataset.ratio;
	});
	
	//다음 입력폼
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