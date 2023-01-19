/**
 * 이미지 파일 업로더 입니다.
 * 슬라이더 모듈 포함
 * 드래그앤 드롭 기능 추가 예정
 */
import {imgSlider} from '../common/img-slider.js';
import {imgService} from '../service/image-service.js';

var imgFileUploader = (function() {
	const container = document.createElement('div');
	const tempInput = createTempInput();
	const previewList = createImgPreview();
	const slider = imgSlider();
	const option = {};
	let dataTransfer = new DataTransfer(); /*파일 파일 삭제 기능시 재할당 필요해서 let으로 설정함*/
	
	init();
	function init() {
		container.prepend(previewList);
		container.prepend(tempInput);
		container.append(slider.container);
		addEvent();
		defaultCss();
	}
	
	function createTempInput() {
		var input = document.createElement('input');
		input.type = 'file';
		input.multiple='multiple';
		input.id = 'tempInput';
		
		return input;
	}
	
	function createImgPreview() {
		var div = document.createElement('div');
		var ul = document.createElement('ul');
		ul.className = 'preview-list';
		
		var str = (
				'<li class="input-img">' +
						'<span>+</span>'+ 
				'</li>');
		ul.innerHTML = str;
		div.append(ul);
		return div;
	}

	/* ========================
	 * addEventListener
	 * ========================*/
	function addEvent() {
		tempInput.addEventListener('change', ({target}) => addTempFile(target));
		previewList.addEventListener('click', (e) => previewEventHandler(e));
	}
	
	function previewEventHandler(event) {
		event.preventDefault();
		
		if (event.target.tagName == 'BUTTON'
			&& event.target.className == 'remove-img-btn') {
			removeTempFile(event.target);
			
		} else if (event.target.closest('li')) {
			var className = event.target.closest('li').className; 
			if (className == 'preview') {
				selectPreview(event);
				
			} else if (className == 'input-img') {
				tempInput.click();
			}
		} 
	}
	
	/* ========================
	 * Method
	 * ========================*/
	function setURL(url) {
		option.uploadURL = url;
	}
	function setSaveName(name) {
		option.saveName = name;
	}
	function addTempFile(target) {
		var files = target.files;
		
		Array.from(files)
		.forEach(file => {
			pushPreview(file);
			dataTransfer.items.add(file);
		});
	}
	
	function removeTempFile(target) {
		var li = target.closest('li');
		var idx = Array.from(li.parentNode.children).indexOf(li) - 1;
		li.remove();
		slider.remove(idx);
		
		var newFiles = new DataTransfer();
		Array.from(dataTransfer.files)
		.filter((_, i) => i !== idx)
		.forEach(file => newFiles.items.add(file));
		dataTransfer = newFiles;
	}
	
	function pushPreview(file) {
		var src = URL.createObjectURL(file);

		var li = document.createElement('li');
		li.innerHTML = '<img src="'+src+'"/>' +
					   '<button class="remove-img-btn"></button>';
		
		liCss(li);
		imgCss(li.querySelector('img'));
		removeBtnCss(li.querySelector('.remove-img-btn'));
		previewList.querySelector('ul').append(li);
		
		slider.add(src);
	}
	
	function selectPreview() {
//		slider.slideImg;
	}
	
	function countFiles() {
		return dataTransfer.items.length;
	}
	
	async function uploadImageAjax() {
		var formData = new FormData();
		Array.from(dataTransfer.files)
		.forEach((file) => {
			formData.append("uploadFile", file);
		});
		
		var uploadResult = await imgService.uploadImageAjax(option.uploadURL, formData);
		var str ='';
		Array.from(uploadResult)
		.forEach((image, i) => {
			str += '<input type="hidden" name="'+option.saveName+'['+i+'].fileName" value="'+image.fileName+'">' + 
				   '<input type="hidden" name="'+option.saveName+'['+i+'].uuid" value="'+image.uuid+'">' +
				   '<input type="hidden" name="'+option.saveName+'['+i+'].uploadPath" value="'+image.uploadPath+'">';
		});
		console.log(str);
		return str;
	}
	
	/* =======================
	 * CSS
	 * =======================*/
	function defaultCss() {
		previewList.style.listStyle = 'none';
		tempInput.style.display = 'none';
		
		var inputImg = previewList.querySelector('.input-img');
		inputImg.style.float = 'left';
		inputImg.style.position = 'relative';
		inputImg.style.backgroundColor = '#eee';
		inputImg.style.width = '100px';
		inputImg.style.height = '100px';
		inputImg.style.margin = '0 10px 10px 0';
		inputImg.style.backgroundColor = '#eee';
		inputImg.style.marginTop = '10px';
		inputImg.style.overflow = 'hidden';
		
		var inputImgBtn = previewList.querySelector('.input-img span');
		inputImgBtn.style.float = 'left';
		inputImgBtn.style.fontSize = '30px';
		inputImgBtn.style.fontWeight = 'bold';
		inputImgBtn.style.position = 'relative';
		inputImgBtn.style.top = '50%';
		inputImgBtn.style.left = '50%';
		inputImgBtn.style.left = '50%';
		inputImgBtn.style.width = '50px';
		inputImgBtn.style.height = '50px';
		inputImgBtn.style.display = 'block';
		inputImgBtn.style.textAlign = 'center';
		inputImgBtn.style.transform = 'translate3d(-50%, -50%, 0)';
		
		var clearfix = document.createElement('div');
		clearfix.style.clear = 'both';
		clearfix.style.lineHeight = '0';
		previewList.append(clearfix);
	}
	
	function liCss(li) {
		li.style.float = 'left';
		li.style.position = 'relative';
		li.style.width = '100px';
		li.style.height = '100px';
		li.style.margin = '0 10px 10px 0';
		li.style.borderRadius = '10px';
		li.style.backgroundColor = '#eee';
		li.style.marginTop = '10px';
		li.style.overflow = 'hidden';
	}
	
	function imgCss(img) {
		img.style.position = 'relative';
		img.style.top = '50%';
		img.style.left = '50%';
		img.style.maxWidth = '100%';
		img.style.maxHeight = '100%';
		img.style.objectFit = 'contain';
		img.style.transform = 'translate3d(-50%, -50%, 0)';
	}
	
	function removeBtnCss(btn) {
		btn.style.position = 'absolute';
		btn.style.top = '5%';
		btn.style.right = '5%';
		btn.style.width = '15px';
		btn.style.height = '15px';
	}
	
	return {
		container: container,
		uploadImageAjax: uploadImageAjax,
		countFiles: countFiles,
		setURL: setURL,
		setSaveName: setSaveName,
		option: option,
	};
})();

export {imgFileUploader}