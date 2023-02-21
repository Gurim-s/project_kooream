import {productTagSelector} from '../common/product-tag-selector.js';
import {imgFileUploader} from '../common/img-file-uploader.js';


const uploader = imgFileUploader;
const tagSelector = productTagSelector();
(function() {
	const css = document.createElement('link');
	css.type = 'text/css';
	css.rel = 'stylesheet';
	css.href = '/resources/css/common/search-box.css';
	document.head.append(css);
	
	uploader.setOption({
		uploadURL: '/uploadImageAWS/style',
		saveName: 'style_image',
		max: 5,
		editMode: true,
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
	
	tagSelector.slider.setOption({
		ratio:1,
		ratioFix: true,
		tagEditMode: true,
	});
	document.querySelector('.product-tag-selector-container')
	.append(tagSelector.container);
	
	//************************** */
	//addEventListener
	//************************** */
	document.querySelector('#selectRatio')
	.addEventListener('click', selectRatio);
	
	document.querySelectorAll('a.next-btn:not(#submit), a.prev-btn')
	.forEach(x => x.addEventListener('click', changeStep));
	
	document.querySelector('a#submit')
	.addEventListener('click', regist);
	
	document.querySelector('[name="style_content"]')
	.addEventListener('input', countText);
	
//	document.querySelector('.editable')
//	.addEventListener('input', function(e) {
//		console.log(e.target.innerText);
//	});
})();

function countImgFile(count) {
	const btn = document.querySelector('a.next-btn:nth-child(1)');
	count == 0 	? btn.className = 'next-btn not-yet'
				: btn.className = 'next-btn';
}

function countText(e) {
	const btn = document.querySelector('a.next-btn#submit');
	const text = e.target.value;
	
	text.length == 0? btn.className = 'next-btn not-yet'
				  	: btn.className = 'next-btn';
			
	if(text.length >= 100) {
		alert('글내용은 100자까지만 입력가능합니다.');
		const cutText = text.substring(0, 100);
		e.target.value = cutText;
	}
}

async function changeStep(e) {
	e.preventDefault();
	if (e.target.classList[1] == 'not-yet') return;
	
	const register = e.target.closest('#register-list');
	const steps = ['first', 'second', 'third'];
	if (register.className == 'first') {
		const ratio = document.querySelector('input[name="ratio"]').value;
		tagSelector.slider.empty();
		tagSelector.slider.setRatio(ratio);
		
		const cropedImgList = await uploader.getEditedFiles();
		const imgTagList = cropedImgList.map(x => {
			const src = URL.createObjectURL(x);
			const imgTag = document.createElement('img');
			imgTag.src = src;
			
			return imgTag;
		});
		
		tagSelector.slider.addImgTagList(imgTagList);
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
	const text = document.querySelector('[name="style_content"]').value;
	if (uploader.countFiles == 0 
		&& alert('이미지는 한장 이상 첨부해야합니다.')) return; 
	if (text.length == 0
		&& alert('글 내용을 입력해주세요.')) return;
	if (text.length >= 100
		&& alert('글 내용은 100자 까지 입니다..')) return;
	
	const form = e.target.closest('form');
	const imgUploadResult = await imgFileUploader.uploadImageAjax();
	const productTagList = tagSelector.getProductTagsInput();
	const hashTagList = extractHashTag(text);
	const div = document.createElement('div');
	div.innerHTML += imgUploadResult;
	div.innerHTML += productTagList;
	div.innerHTML += hashTagList;
	
	form.append(div);
	form.submit();
}

function extractHashTag(text) {
	const type = /#[^\s^#]+/g;
	const strToInput = (str, i) => '<input type="hidden" name="hashtags['+i+']" value="'+str+'">';
	const list = text.match(type);
	if (list == null) return text;
	
	const result = list.map(x => x.substring(1))
	.map(strToInput)
	.reduce((str, x) => str + x, '');
	return result; 
}
