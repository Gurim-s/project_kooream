import {imgFileUploader} from '../common/img-file-uploader.js';
import {imgSlider} from '../common/img-slider.js';

const uploader = imgFileUploader;
const slider = imgSlider();
(function() {
	uploader.setOption({
		uploadURL: '/uploadStyleImage',
		saveName: 'style_image',
		max: 5,
		slider: {
			ratio: 1,
			ratioFix: true,
			editMode: true,	
		}
	});
	uploader.init();
	uploader.publish({update:countImgFile});
	document.querySelector('.uploader-container')
	.append(uploader.container);
	
	slider.setOption({
		ratio: 1,
		ratioFix: true,
	});
	document.querySelector('.img-slider-container')
	.append(slider.container);
	
	//************************** */
	//addEventListener
	//************************** */
	document.querySelector('#selectRatio')
	.addEventListener('click', selectRatio);
	
	console.log(document.querySelectorAll('a.next-btn:not(:last-child)'));
	document.querySelectorAll('a.next-btn:not(#submit), a.prev-btn')
	.forEach(x => x.addEventListener('click', changeStep));
	
	document.querySelector('a#submit')
	.addEventListener('click', regist);
	
	document.querySelector('.editable')
	.addEventListener('input', function(e) {
		
	});
})();

function countImgFile(count) {
	const btn = document.querySelector('a.next-btn:nth-child(1)');
	count == 0 
		? btn.className = 'next-btn not-yet'
		: btn.className = 'next-btn';
}

function changeStep(e) {
	e.preventDefault();
	if (e.target.classList[1] == 'not-yet') return;
	
	const register = e.target.closest('#register-list');
	const steps = ['first', 'second', 'third']
	if (register.className == 'first') {
		const imgTagList = uploader.slider.getImgTagList();
		slider.empty();
		slider.addImgTagList(imgTagList);
	}
	
	const newStep = e.target.classList[0] == 'next-btn'
					? steps.indexOf(register.className)+1 
					: steps.indexOf(register.className)-1;
	register.className = steps[newStep];
}

function selectRatio(e) {
	e.preventDefault();
	const uploader = imgFileUploader;
	const selected = e.target.closest('ul#selectRatio').querySelector('li.selected');
	const newSelect = e.target.closest('#selectRatio li');
	if (!newSelect) return;
	
	selected.className = '';
	newSelect.className = 'selected';
	uploader.setRatio(Number(newSelect.dataset.ratio));
	document.querySelector('input[name="ratio"]').value = newSelect.dataset.ratio;
}

async function regist(e) {
	e.preventDefault();
	if (e.target.classList[1] == 'not-yet') return;
	
	const form = e.target.closest('form');
	if (!isValid(form)) return;
	
	const result = await imgFileUploader.uploadImageAjax();
	const div = document.createElement('div');
	div.innerHTML = result;
	
	form.append(div);
	form.submit();
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