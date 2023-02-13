import {productTagSelector} from '../common/product-tag-selector.js';
import {styleService} from '../service/style-service.js';
import {imgService} from '../service/image-service.js';

const style = await getStyle();
console.log(style);
const tagSelector = productTagSelector();

(function() {
	const css = document.createElement('link');
	css.type = 'text/css';
	css.rel = 'stylesheet';
	css.href = '/resources/css/common/search-box.css';
	document.head.append(css);
	
	tagSelector.slider.setOption({
		tagMode: true,
	});
	document.querySelector('.product-tag-selector-container')
	.append(tagSelector.container);
	tagSelector.slider.addImgTagList(getUploadedImgElList());
	setProductTags(style.productTagList, tagSelector.slider);
	
	document.querySelector('[name="style_content"]')
	.value = style.style_content;
	
	//************************** */
	//addEventListener
	//************************** */
	document.querySelectorAll('a.next-btn:not(#submit), a.prev-btn')
	.forEach(x => x.addEventListener('click', changeStep));
	
	document.querySelector('a#submit')
	.addEventListener('click', regist);
	
	document.querySelector('[name="style_content"]')
	.addEventListener('input', countText);
})();

async function getStyle() {
	const searchParams = new URLSearchParams(location.search);
	const style_no = Array.from(searchParams)[0][1];
	 
	return styleService.getOne(style_no); 
}

function getUploadedImgElList() {
	const imgList = style.style_image;
	const imgEl = imgList.map(imgService.getImageEl);
	
	return imgEl;
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

function changeStep(e) {
	e.preventDefault();
	if (e.target.classList[1] == 'not-yet') return;
	
	const register = e.target.closest('#register-list');
	const steps = ['first', 'second'];
	const newStep = e.target.classList[0] == 'next-btn'
					? steps.indexOf(register.className)+1 
					: steps.indexOf(register.className)-1;
					
	register.className = steps[newStep];
}

async function regist(e) {
	e.preventDefault();
	const text = document.querySelector('[name="style_content"]').value;
	if (text.length == 0
		&& alert('글 내용을 입력해주세요.')) return;
	if (text.length >= 100
		&& alert('글 내용은 100자 까지 입니다..')) return;
	
	const form = e.target.closest('form');
	const productTagList = tagSelector.getProductTagsInput();
	const hashTagList = extractHashTag(text);
	const div = document.createElement('div');
	div.innerHTML += productTagList;
	div.innerHTML += hashTagList;
	div.innerHTML += '<input type="hidden" name="style_no" value="'+style.style_no+'">';
	form.append(div);
	form.submit();
}

function setProductTags(list, slider) {
	if (list == null || list.length == 0) return;
	list.flat().forEach(x => {
		slider.addProductTag(x);
	});
}

function extractHashTag(text) {
	const type = /#[^\s^#]+/g;
	const strToInput = (str, i) =>
		'<input type="hidden" name="hashtags['+i+']" value="'+str+'">';
	
	const list = text.match(type)
	.map(x => x.substring(1))
	.map(strToInput)
	.reduce((str, x) => str + x, '');
	return list; 
}