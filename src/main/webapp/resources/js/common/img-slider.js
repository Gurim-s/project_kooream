/**
 * img-slider 모듈입니다.
 * 
 */
import {imgService} from '../service/image-service.js';

const imgSlider = (customOption) => (function(customOption) {
	let option = {
		ratio: 1,
		ratioFix: false,
		editMode: false,
		tagEditMode: false,
		offset: false,
	};
	const container = document.createElement('div');
	const imgContainer = document.createElement('div');
	const ul = document.createElement('ul');
	let imgList = [];
	let idx = 0;
	let idxContainer;
	let idxIndicator;
	let dataTransfer;
	
	init();
	function init() {
		option = Object.assign(option, customOption);
		container.append(imgContainer);
		imgContainer.append(ul);
		imgContainer.append(createBtnContainer());
		idxContainer = createIdxContainer();
		idxIndicator = createIdxIndicator();
		container.append(idxIndicator);
		container.append(idxContainer);
		setEvent();
		setDefaultCss();
		
		if(option.editMode) dataTransfer = new DataTransfer();
	}
	
	function createBtnContainer() {
		var btnContainer= document.createElement('div');
		btnContainer.className = 'btn-container';
		
		var str = '<button class="prev">&lt;</button>' + 
				  '<button class="next">&gt;</button>'; 

		btnContainer.innerHTML = str;
		btnContainer.querySelectorAll('button')
		.forEach(x => x.addEventListener('click', (e) => {
			e.preventDefault();
			slideImg(e.target.className);
			hover('on');
		}));
		
		return btnContainer;
	}
	
	function createIdxContainer() {
		var idxContainer = document.createElement('ul');
		idxContainer.className = 'idx-container';
		
		idxContainer.addEventListener('click', function(e) {
			if (e.target.tagName != 'LI') return;
			var idx = Array.from(e.target.parentNode.children).indexOf(e.target);
			slideImg(idx);
		});
		
		return idxContainer;
	}
	
	function createIdxIndicator() {
		var idxIndicator = document.createElement('div');
		return idxIndicator;
	}
	
	function hover(v) {
		var length = idxContainer.childElementCount;
		var isEnd = (idx == length - 1) || (length == 0);
		var isStart = idx == 0;
		var prev = container.querySelector('button.prev');
		var next = container.querySelector('button.next');
		
		if (v == 'on') {
			next.style.display = isEnd ? 'none' : 'block';
			prev.style.display = isStart ? 'none' : 'block';
		} else {
			[prev, next].forEach(btn => {btn.style.display = 'none'});
		}
	}
	
	function setEvent() {
		container.addEventListener('mouseover', () => hover('on'));
		container.addEventListener('mouseout', () => hover('out'));
		if (option.editMode) {
			container.addEventListener('mousewheel', _canvasScrollEvent, {passive: false});
			_dragImageEvent();
		}
		if (option.tagEditMode) _dragTagEvent();
	}
	
	function _dragTagEvent() {
		ul.ondragstart = function() {return false;}
		let isPressed = false;
		let oldX = 0;
		let oldY = 0;
		
		ul.onmousedown = start;
		ul.onmouseup = end;
		ul.onmouseout = end;
		onmousemove = move;
		
		function start(e) {
			e.preventDefault();
			if (!e.target.closest('.product-tag')) return;
			oldX = e.clientX;
			oldY = e.clientY;
			isPressed = true;
		} 
		
		function end(e) {
			e.preventDefault();
			if (!e.target.closest('.product-tag')) return;
			isPressed = false;
		}
		
		function move(e) {
			e.preventDefault();
			if (!e.target.closest('.product-tag')) return;
			if (isPressed === false) return;
			const tag = e.target.closest('.product-tag');
			const productInfo = tag.querySelector('.product-info');
			const offsetX = e.clientX - oldX;
			const offsetY = e.clientY - oldY;
			
			oldX = e.clientX;
			tag.style.left = (tag.offsetLeft + offsetX) + 'px';
			oldY = e.clientY;
			tag.style.top = (tag.offsetTop + offsetY) + 'px';
			if (tag.offsetLeft < 240) {
				productInfo.style.left = '30px';
			}
			if (tag.offsetLeft > 350) {
				productInfo.style.left = '-200px';
			}
		}
	}
	
	/*************************************
	 * --Method--
	 ************************************/
	function setRatio(ratio) {
		option.ratio = ratio;
		setDefaultCss();
	}
	
	function setOption(customOption) {
		option = Object.assign(option, customOption);
		setEvent();
		setDefaultCss();
	}
	
	function add(imgSrc) {
		if (option.editMode == true) {
			_addCanvas(imgSrc);
			return;
		}

		ul.innerHTML += '<li><img src="' + imgSrc + '"/></li>';
		addIdx();
		setLiCss();
		setUlCss();
		slideImg(idxContainer.childElementCount-1);
	}
	
	async function getCropedImgList() {
		const canvasList = Array.from(ul.querySelectorAll('canvas'));
		const files = await _cropImage(canvasList);
		
		return files;
	}
	
	//******************************************* */
	//editMode canvas Method
	//******************************************* */
	function _addCanvas(imgSrc) {
		const canvasWidth = container.clientWidth;
		const canvasHeight = container.clientHeight;
		ul.innerHTML += '<li><canvas></canvas></li>';
		const newCanvas = ul.querySelector('li:last-child canvas');
		newCanvas.width = canvasWidth;
		newCanvas.height = canvasHeight;
		newCanvas.dataset.scaleX = 1;
		newCanvas.dataset.scaleY = 1;
		newCanvas.dataset.offsetX = 0;
		newCanvas.dataset.offsetY = 0;
		newCanvas.addEventListener('mousewheel', _canvasScrollEvent, {passive: false});
		
		const canvasList = ul.querySelectorAll('canvas');
		const img = new Image();
		img.src = imgSrc;
		imgList.push(img);
		
		img.onload = (_) => {
			canvasList.forEach((canvas, i) => {
				let imgWidth = imgList[i].width;
				let imgHeight = imgList[i].height;
				const context = canvas.getContext('2d');
				const scaleX = canvas.dataset.scaleX;
				const scaleY = canvas.dataset.scaleY;
				const offsetX = canvas.dataset.offsetX;
				const offsetY = canvas.dataset.offsetY;
				
		        context.drawImage(imgList[i], offsetX, offsetY, imgWidth, imgHeight, 0, 0, imgWidth*scaleX, imgHeight*scaleY);
			});
		};
		
		addIdx();
		setUlCss();
		setLiCss();
		slideImg(idxContainer.childElementCount-1);
	}
	
	//**************** */
	//scroll시 확대 이벤트
	//**************** */
	function _canvasScrollEvent(e) {
		if (e.target.tagName !== 'CANVAS') return;
        e.preventDefault();
		const imgWidth = imgList[idx].width;
		const imgHeight = imgList[idx].height;
		const canvas = e.target;
		const context = e.target.getContext('2d');
		const offsetX = canvas.dataset.offsetX;
		const offsetY = canvas.dataset.offsetY;
		let scaleX = e.target.dataset.scaleX;
		let scaleY = e.target.dataset.scaleY;
		
		const isScrollDown = e.deltaY > 0;
        scaleX *= isScrollDown? 0.98 : (1 / 0.98);
        scaleY *= isScrollDown? 0.98 : (1 / 0.98);

        let newWidth = imgWidth * scaleX;
        let newHeight = imgHeight * scaleY;
		const isMinWidth = canvas.width >= newWidth;
		const isMinHeight = canvas.height >= newHeight; 
        if (isMinWidth) {
            scaleX = scaleX * (1 / 0.98);
            scaleY = scaleY * (1 / 0.98);
            newWidth = canvas.width;
            newHeight = imgHeight * scaleY;
        }
        if (isMinHeight) {
            scaleX = scaleX * (1 / 0.98);
            scaleY = scaleY * (1 / 0.98);
            newWidth = imgWidth * scaleX;
            newHeight = canvas.height;
        }
        
        context.clearRect(0, 0, canvas.width, canvas.height);
        context.beginPath();
        context.drawImage(imgList[idx], -1*offsetX, -1*offsetY, imgWidth, imgHeight, 0, 0, newWidth, newHeight);
		e.target.dataset.scaleX = scaleX;
		e.target.dataset.scaleY = scaleY;
    }

	//이미지 드래그 이벤트
	function _dragImageEvent() {
		container.ondragstart = function() {return false;}
		let isPressed = false;
		let oldX = 0;
		let oldY = 0;
		
		container.onmousedown = start;
		container.onmouseup = end;
		container.onmouseout = end;
		container.onmousemove = move;
		
		function start(e) {
			if (e.target.tagName !== 'CANVAS') return;
			oldX = e.clientX;
			oldY = e.clientY;
			isPressed = true;
		} 
		
		function end(e) {
			if (e.target.tagName !== 'CANVAS') return;
			isPressed = false;
		}

		function move(e) {
			if (isPressed == false) return;
			const diffX = e.clientX - oldX;
			const diffY = e.clientY - oldY;
			oldX = e.clientX;
			oldY = e.clientY;

			const canvas = e.target;
			const context = canvas.getContext('2d');
			const img = imgList[idx];
			const imgWidth = img.width; 
			const imgHeight = img.height;
			const offsetX = canvas.dataset.offsetX;
			const offsetY = canvas.dataset.offsetY;
			const scaleX = canvas.dataset.scaleX;
			const scaleY = canvas.dataset.scaleY;

			const newX = diffX + parseInt(offsetX);
			const newY = diffY + parseInt(offsetY);
			
			const isXRightBoundary = diffX > 0 && newX >= 0;
			const isXLeftBoundary = diffX < 0 && ((-1 * newX * scaleX) + canvas.width) > imgWidth * scaleX;
			const isYTopBoundary = diffY > 0 && newY >= 0;
			const isYBottomBoundary = diffY < 0 && ((-1 * newY * scaleY) + canvas.height) > imgHeight * scaleY;
			if (isXRightBoundary || isXLeftBoundary) return;
			if (isYTopBoundary || isYBottomBoundary) return;

	        context.clearRect(0, 0, canvas.width, canvas.height);
	        context.beginPath();
    	    context.drawImage(img, -1*newX, -1*newY, imgWidth, imgHeight, 0, 0, imgWidth*scaleX, imgHeight*scaleY);
			
			canvas.dataset.offsetX = newX;
			canvas.dataset.offsetY = newY;
		}
	}
	
    async function _cropImage(canvasList) {
        // 이미지를 base64 기반 data uri로 변경
        const urlList = await new Promise((resolve) => {
            resolve(canvasList.map(x => x.toDataURL('image/jpeg')))
        });
        // data uri를 blob화
        const fileList = urlList.map(_dataURItoBlob);
		
        return fileList;
    }
    // data uri를 blob화
    function _dataURItoBlob(dataURI) {
        const binary = atob(dataURI.split(',')[1]);
        const array = [];
        for (let i = 0; i < binary.length; i++) {
            array.push(binary.charCodeAt(i));
        }
        return new Blob([new Uint8Array(array)], { type: 'image/jpeg' });
    }
	
	function addList(imgSrcList) { 
		if(imgSrcList.length == 0) return;
		
		const imgTagList = Array.from(imgSrcList)
		.reduce((str, imgSrc) => {
			addIdx();
			return str + '<li><img src="' + imgSrc + '"/></li>'
		}, '');
		
		ul.innerHTML += imgTagList;
		setLiCss();
		setUlCss();
		slideImg(0);
	}
	
	function addImgTag(imgTag) {
		const li = document.createElement('li');
		li.append(imgTag);
		ul.append(li);
		addIdx();
		slideImg(0);
	}
	
	function addImgTagList(imgTagList) {
		if (imgTagList.length == 0) return;
		
		imgTagList.forEach(addImgTag);
		setLiCss();
		setUlCss();
		slideImg(0);
	}
	
	function getImgTagList() {
		const imgTagList = Array.from(ul.querySelectorAll('li img'))
		.map(x => x.cloneNode());
		
		setDefaultCss();
		return imgTagList;
	}
	
	function addProductTag(product) {
		if (product.idx === undefined) product.idx = idx;
		if (product.offsetX === undefined) product.offsetX = 0;
		if (product.offsetY === undefined) product.offsetY = 0;
		
		const currentImg = Array.from(ul.children)[product.idx];
		currentImg.append(productTemplate(product));
	}
	
	function getProductTagList() {
		const list = Array.from(ul.children)
		.map(x => x.querySelectorAll('.product-tag'));
		
		return list;
	}
	
	function productTemplate(product) {
		const container = document.createElement('div');
		container.className = 'product-tag';
		container.dataset.p_no = product.p_no;
		
		const pointer = document.createElement('div');
		pointer.className = 'tag-pointer'; 
		
		const template = document.createElement('div');
		template.className = 'product-info';
		
		container.append(pointer);
		container.append(template);
		
		const str = (
			(option.tagEditMode? '<a href="#" class="remove-tag">X<a/>': '')+
			'<div class="product-img">' +
				'<img src="' + imgService.thumbnailPath(product, 'xs') +'" />' +
			'</div>' +
			'<div class="name-price">' +
				'<p class="name">'+product.p_name_ko+'</p>'+
				'<p class="price">'+product.p_release_price+'원</p>'+
			'</div>'
		);
		template.innerHTML = str;
		if (option.tagEditMode) template.querySelector('.remove-tag')
		.addEventListener('click', _removeTag);
		
		container.style.position = 'absolute';
		container.style.top = product.offsetY == '0'? '80%': product.offsetY;
		container.style.left = product.offsetX == '0'? '10px': product.offsetX;
//		container.style.zIndex = '1';
		
		if (option.tagEditMode) {
			const removeTag = template.querySelector('.remove-tag');
			removeTag.style.position = 'absolute';
			removeTag.style.top = '0px';
			removeTag.style.right = '0px';
//			removeTag.style.borderRadius = '50%';
			removeTag.style.width = '15px';
			removeTag.style.height = '15px';
			removeTag.style.fontSize = '15px';
			removeTag.style.fontWeight = 'bold';
			removeTag.style.color = 'white';
			removeTag.style.backgroundColor = 'black';
		}
		
		pointer.style.height = '12px';
		pointer.style.width = '12px';
		pointer.style.display = 'inline-block';
		pointer.style.backgroundColor = 'black';
		pointer.style.border = '2px solid white';
		pointer.style.borderRadius = '50%';
		pointer.style.margin = '10px';
		
		template.style.width = '200px';
		template.style.overflow = 'hidden';
		template.style.position = 'relative';
		template.style.top = '-34px';
		template.style.left = '34px';
		template.style.backgroundColor = 'rgba(100, 100, 100, 0.5)';
		template.style.borderRadius = '10px';
		template.style.padding = '3px 0';
		
		const imgContainer = template.querySelector('.product-img');
		imgContainer.style.height = '40px';
		imgContainer.style.float = 'left';
		imgContainer.style.marginRight = '5px';
		imgContainer.style.marginLeft = '7px';
		
		const img = template.querySelector('img');
		img.style.height = '90%';
		img.style.borderRadius = '10px';
		
		const name = template.querySelector('p.name');
		name.style.fontSize = '14px';
		name.style.height = '20px';
		name.style.overflow = 'hidden';
		name.style.color = '#ccc';
		
		const price = template.querySelector('p.price');
		price.style.height = '20px';
		price.style.fontSize = '14px';
		price.style.color = '#fff';
		
		return container;
	}
	
	function _removeTag(e) {
		e.preventDefault();
		e.target.closest('.product-tag').remove();
	}
	
	function remove(idx) {
		ul.children[idx].remove();
		imgList = imgList.filter((_, i) => i !== idx);
		slideImg(idx == 0 ? 0 : idx - 1);
		removeIdx(idx);
		refreshIndicator();
	}
	
	function empty() {
		ul.innerHTML = '';
		imgList = [];
		idxContainer.innerHTML = '';
		idx = 0;
	}
	
	function addIdx() {
		var li = document.createElement('li');
		container.querySelector('.idx-container').append(li);
		setIdxCss();
	}
	
	function removeIdx(idx) {
		idxContainer.children[idx].remove();
	}
	
	function slideImg(v) {
		const idxLiAll = Array.from(idxContainer.children);
		idxLiAll[idx].style.backgroundColor = 'lightgray';
			
		if (v == 'next') {
			idx++;
		} else if (v == 'prev') {
			idx--;
		} else {
			idx = v;
		}
		
		ul.style.left = (-1 * idx * 100) + '%';
		idxLiAll[idx].style.backgroundColor = 'black';
		refreshIndicator();
	}
	
	function refreshIndicator() {
		const idxLiAll = Array.from(idxContainer.children);
		idxIndicator.innerHTML = idxLiAll.length == 0
			? ''
			: (idx+1) + '/' + idxLiAll.length;
	}
	
//	function offsetX(idx) {
//		return ul.querySelectorAll('li img')[idx].dataset.offsetX;
//	}
//	
//	function offsetY(idx) {
//		return ul.querySelectorAll('li img')[idx].dataset.offsetY;
//	}
	
	//********************* */
	//--CSS--
	//********************* */
	function setDefaultCss() {
		setContainerCss();
		setUlCss();
		setIdxCss();
	}
	
	function setContainerCss() {
		container.style.width = '100%';
		container.style.position = 'relative';
		container.style.backgroundColor = '#eee';
		container.style.marginBottom = '20px';
		if (option.ratioFix == true) {
			container.style.paddingTop = (100 * option.ratio) + '%';
		}
		
		imgContainer.style.overflow = 'hidden';
		if (option.ratioFix == true) {
			imgContainer.style.width = '100%';
			imgContainer.style.top = '0';
			imgContainer.style.left = '0';
			imgContainer.style.position = 'absolute';
		}
		
		var prev = container.querySelector('.prev');
		var next = container.querySelector('.next');
		[prev, next].forEach(x => {
			x.style.position = "absolute";
			x.style.top = "50%";
			x.style.width = "20px";
			x.style.height = "20px";
			x.style.backgoundColor = 'rgba(255, 255, 255, 1)';
			x.style.opacity = '0.7';
			x.style.border = 'none';
			x.style.borderRadius = '50%';
 			x.style.fontSize = '5%';
			x.style.display = 'none';
		});
		prev.style.left = "5%";
		prev.style.transform = 'tanslate3d(-50%, -50%, 0)';
		next.style.right = "5%";
		next.style.transform = 'tanslate3d(50%, -50%, 0)';
	}
	
	function setUlCss() {
		const liCount = ul.childElementCount;
		ul.style.minHeight = '400px';
		ul.style.width = liCount * 100 + '%';
		ul.style.position = 'relative';
		ul.style.display = 'flex';
		ul.style.alignItems = 'center';
		ul.style.left = '0%';
		ul.style.transition = 'left 0.5s';
	}
	
	function setLiCss() {
		var liAll = ul.querySelectorAll('li');
		
		var liWidth = (100 / liAll.length) + '%';
		var liPaddingTop = (100 / liAll.length * option.ratio) + '%';
		liAll.forEach(li => {
			li.style.float = 'left';
			li.style.width = liWidth;

			var liImg = !(option.editMode)  ? li.querySelector('img')
											: li.querySelector('canvas');
			if (!option.editMode) {
				liImg.style.width = '100%';
			}
			
			if (option.ratioFix) {
				li.style.position = 'relative';
				li.style.top = '0';
				li.style.paddingTop = liPaddingTop;
				li.style.overflow = 'hidden';
				
				liImg.style.position = 'absolute';
				liImg.style.top = '0';
			}
		});
	}
	
	function setIdxCss() {
		var idxContainer = container.querySelector('.idx-container');
		idxContainer.style.position = 'absolute';
		idxContainer.style.bottom = '-3%';
		idxContainer.style.left = '50%';
		idxContainer.style.transform = 'tanslate3d(-50%, 0, 0)';
		
		idxContainer.querySelectorAll('li')
		.forEach(x => {
			x.style.width ="8px";
			x.style.height ="8px";
			x.style.float = "left";
			x.style.marginRight = "3px";
			x.style.borderRadius = "50%";
			x.style.backgroundColor = "lightgray";
		});
		
		idxIndicator.style.position = 'absolute';
		idxIndicator.style.top = '3%';
		idxIndicator.style.right = '2%';
		idxIndicator.style.width = '8%';
		idxIndicator.style.height = '20px';
		idxIndicator.style.maxWidth = '50px';
		idxIndicator.style.textAlign = 'center';
		idxIndicator.style.fontSize = '15px';
		idxIndicator.style.fontWeight = '600';
		idxIndicator.style.color = 'white';
		idxIndicator.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
		idxIndicator.style.borderRadius = '15px';
	}
	
	return {
		container: container,
		setRatio: setRatio,
		setOption: setOption,
		add: add,
		addList: addList,
		addImgTag: addImgTag,
		addImgTagList: addImgTagList,
		remove: remove,
		empty: empty,
		slideImg: slideImg,
		getImgTagList: getImgTagList,
		addProductTag: addProductTag,
		getProductTagList: getProductTagList,
		getCropedImgList: getCropedImgList,
	}
}(customOption));

export {imgSlider};