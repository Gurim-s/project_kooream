/**
 * 이미지 파일 업로더 입니다.
 * 슬라이더 모듈 포함
 * 드래그앤 드롭 기능 추가 예정
 */
import {imgSlider} from '../common/img-slider.js';
import {imgService} from '../service/image-service.js';

var imgFileUploader = (function() {
	const publisherList = [];
	const container = document.createElement('div');
	const tempInput = createTempInput();
	const previewList = createImgPreview();
	let slider = imgSlider();
	let dataTransfer = new DataTransfer(); /*파일 파일 삭제 기능시 재할당 필요해서 let으로 설정함*/
	let editedDataTransfer; 
	let option = {
		uploadURL: '',
		saveName: '',
		max: 1000,
		slider: {},
		editMode: false,
	};
	
	function init() {
		container.prepend(previewList);
		container.prepend(tempInput);
		slider.setOption(option.slider);
		container.append(slider.container);
		setEvent();
		defaultCss();
		
		if (option.editMode) editedDataTransfer = new DataTransfer();
	}
	
	function createTempInput() {
		const input = document.createElement('input');
		input.type = 'file';
		input.accept='image/jpeg, image/png, image/jpg';
		input.multiple='multiple';
		input.id = 'tempInput';
		
		return input;
	}
	
	function createImgPreview() {
		const div = document.createElement('div');
		const ul = document.createElement('ul');
		ul.className = 'preview-list';
		
		const str = (
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
	function setEvent() {
		tempInput.addEventListener('change', ({target}) => addTempFile(target));
		previewList.addEventListener('click', (e) => previewEventHandler(e));
	}
	
	function addInputEventListener(callback) {
		tempInput.addEventListener('change', callback);
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
	function publish(target) {
		publisherList.push(target);
	}
	
	function setURL(url) {
		option.uploadURL = url;
	}
	
	function setSaveName(name) {
		option.saveName = name;
	}
	
	function setOption(customOption) {
		option = Object.assign(option, customOption);
	}
	
	function setRatio(ratio) {
		slider.setRatio(ratio);
		slider.empty();
		emptyPreview();
		Array.from(dataTransfer.files)
		.forEach(pushPreview);
	}
	
	function addTempFile(target) {
		const files = target.files;
		
		Array.from(files)
		.forEach(file => {
			if (!checkFileType(file)) return;
			if (!checkFileCountMax()) return;
			pushPreview(file);
			dataTransfer.items.add(file);
		});
		
		target.value = '';
		update();
	}
	
	function removeTempFile(target) {
		const li = target.closest('li');
		const idx = Array.from(li.parentNode.children).indexOf(li) - 1;
		li.remove();
		slider.remove(idx);
		
		const newFiles = new DataTransfer();
		Array.from(dataTransfer.files)
		.filter((_, i) => i !== idx)
		.forEach(file => newFiles.items.add(file));
		dataTransfer = newFiles;
		
		update();
	}
	
	function pushPreview(file) {
		const src = URL.createObjectURL(file);
		const li = document.createElement('li');
		li.innerHTML = '<img src="'+src+'"/>' +
					   '<button class="remove-img-btn"></button>';
		
		liCss(li);
		imgCss(li.querySelector('img'));
		removeBtnCss(li.querySelector('.remove-img-btn'));
		previewList.querySelector('ul').append(li);
		
		slider.add(src);
	}
	
	function emptyPreview() {
		slider.empty();
		previewList.querySelectorAll('li:not(:first-child)')
		.forEach(x => x.remove());
	}
	
	async function getEditedFiles() {
		const editedBlobs = await slider.getCropedImgList();
		const editedFiles = editedBlobs.map(_blobToFile);
		editedFiles.forEach(x => editedDataTransfer.items.add(x));
		
		return editedFiles;
	}
	
	function _blobToFile(blob) {
		return new File([blob], 'image.jpeg', {type: blob.type});
	}
	
	
	function selectPreview() {
//		slider.slideImg;
	}
	
	function countFiles() {
		return dataTransfer.items.length;
	}
	
	function checkFileType(file) {
		const fileType = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
		if (!file.name.match(fileType)) {
			alert('이미지 파일만 업로드 가능합니다.');
			return false;
		};
		
		return true;
	}
	
	function checkFileCountMax() {
		if (!option.max) return true;
		if (countFiles()+1 > option.max) {
			alert('이미지는 최대 5개까지 첨부할 수 있습니다.');
			return false;
		} 
		
		return true;
	}
	
	async function uploadImageAjax() {
		if (option.editMode) dataTransfer = editedDataTransfer;
		let formData = new FormData();
		Array.from(dataTransfer.files)
		.forEach((file) => {
			formData.append("uploadFile", file);
		});
		
		const uploadResult = await imgService.uploadImageAjax(option.uploadURL, formData);
		let str ='';
		Array.from(uploadResult)
		.forEach((image, i) => {
			str += '<input type="hidden" name="'+option.saveName+'['+i+'].fileName" value="'+image.fileName+'">' + 
				   '<input type="hidden" name="'+option.saveName+'['+i+'].uuid" value="'+image.uuid+'">' +
				   '<input type="hidden" name="'+option.saveName+'['+i+'].uploadPath" value="'+image.uploadPath+'">';
		});
		return str;
	}
	
	function update() {
		previewList.querySelector('li.input-img').style
		.display = countFiles() == option.max ? 'none': 'list-item';
		
		const count = countFiles();
		publisherList.forEach(x => x.update(count));
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
		init: init,
		publish: publish,
		slider: slider,
		container: container,
		getEditedFiles: getEditedFiles,
		uploadImageAjax: uploadImageAjax,
		uploadCropedImageAjax: uploadCropedImageAjax,
		countFiles: countFiles,
		setURL: setURL,
		setRatio: setRatio,
		setSaveName: setSaveName,
		setOption: setOption,
		addInputEventListener: addInputEventListener,
	};
})();

export {imgFileUploader}