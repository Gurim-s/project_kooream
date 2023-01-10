/**
 * img-slider 모듈입니다.
 */

var imgSlider = (x) => (function(_container) {
	var container = _container;
	var ul = document.createElement('ul');
	var idx = 0; 
	
	(() => {
		init();
	})();
	
	function init() {
		container.append(ul);
		container.append(createBtns());	
		container.addEventListener('mouseover', () => hover('on'));
		container.addEventListener('mouseout', () => hover('out'));
	}
	
	function createBtns() {
		var btnContainer= document.createElement('div');
		btnContainer.className = 'btn-container';
		
		var str = '<button class="prev">&lt;</button>' + 
				  '<button class="next">&gt;</button>'; 
		
		btnContainer.innerHTML = str;
		btnContainer.querySelectorAll('button')
					.forEach(x => x.addEventListener('click', (e) => {
						slideImg(e.target.className);
					}));
		
		return btnContainer;
	}
	
	function createIdx() {
		var idxContainer = document.createElement('div');
		idxContainer.className = 'idx-container';
		
		var str = '';
		ul.childElementCount
		
		return createIdx();
	};
	
	function hover(v) {
		var buttons = container.querySelectorAll('.next, .prev');
		if (v == 'on') {
			buttons.forEach(btn => {btn.style.display = 'block'});
		} else {
			buttons.forEach(btn => {btn.style.display = 'none'});
		}
	}
	
	function originPath(imageVO) {
		if (!imageVO) return "/resources/img/codi_test.png";
		
		var {uploadPath, uuid, fileName} = imageVO;
		return "/displayStyleImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
	}
	
	function add(imageVO) {
		ul.append('<img src="'+originPath(imageVO)+'"/>');
	}
	
	function addList(imageVOList) { 
		var imgTagList = Array.from(imageVOList)
							.map(imageVO => originPath(imageVO))
							.reduce((str, imgSrc) => {return str + '<li><img src="' + imgSrc + '"/></li>'}, '');
		
		ul.innerHTML += imgTagList;
		setDefaultCss();
	}
	
	function slideImg(v) {
		ul.style.transition = '0.5s';
		if (v == 'next') {
			idx++;
		} else if (v == 'prev') {
			idx--;
		}
	
		ul.style.left = (-1 * idx * 100) + '%';
	}
	
	function setDefaultCss() {
		var liAll = ul.querySelectorAll('li');
		var prev = container.querySelector('.prev');
		var next = container.querySelector('.next');

		//conainer 스타일
		container.style.width = '100%';
		container.style.overflow = 'hidden';
		container.style.position = 'relative';
		
		//ul 스타일
		ul.style.width = liAll.length * 100 + '%';
		ul.style.position = 'relative';
		ul.style.display = 'flex';
		ul.style.alignItems = 'center';
		ul.style.left = '0%';
		ul.style.transition = '0.5s';
		
		//list 스타일
		var liWidth = (100 / liAll.length) + '%';
		ul.querySelectorAll('li')
			.forEach(li => {
				li.style.float = 'left';
				li.style.width = liWidth;
				//이미지 스타일
				li.querySelector('img').style.width = '100%';
			});
		
		//버튼 스타일
		[prev, next].forEach(x => {
			x.style.position = "absolute";
			x.style.top = "50%";
			x.style.width = "4%";
			x.style.height = "4%";
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
	
	return {
		add: add,
		addList: addList,
	}
}(x));

export {imgSlider};