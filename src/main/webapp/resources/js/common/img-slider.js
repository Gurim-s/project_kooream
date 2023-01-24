/**
 * img-slider 모듈입니다.
 * 
 */

var imgSlider = (customOption) => (function(customOption) {
	var option = {
		ratio: 1,
		ratioFix: false,
		editMode: false,
	};
	var container = document.createElement('div');
	var imgContainer = document.createElement('div');
	var ul = document.createElement('ul');
	var idx = 0;
	var idxContainer;
	var idxIndicator;
	
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
		container.addEventListener('mouseover', () => hover('on'));
		container.addEventListener('mouseout', () => hover('out'));
		setDefaultCss();
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
	
	/*************************************
	 * --Method--
	 ************************************/
	function setRatio(ratio) {
		option.ratio = ratio;
		setDefaultCss();
	}
	
	function setOption(customOption) {
		option = Object.assign(option, customOption);
	}
	
	function add(imgSrc) {
		ul.innerHTML += '<li><img src="' + imgSrc + '"/></li>';
		addIdx();
		setDefaultCss();
		slideImg(idxContainer.childElementCount-1);
	}
	
	function addList(imgSrcList) { 
		if(imgSrcList.length == 0) return;
		
		var imgTagList = Array.from(imgSrcList)
			.reduce((str, imgSrc) => {
				addIdx();
				return str + '<li><img src="' + imgSrc + '"/></li>'
		}, '');
		
		ul.innerHTML += imgTagList;
		setDefaultCss();
		slideImg(0);
	}
	
	function remove(idx) {
		ul.children[idx].remove();
		slideImg(idx == 0 ? 0 : idx - 1);
		removeIdx(idx);
	}
	
	function addIdx() {
		var li = document.createElement('li');
		container.querySelector('.idx-container').append(li);
	}
	
	function removeIdx(idx) {
		idxContainer.children[idx].remove();
	}
	
	function slideImg(v) {
		var idxLiAll = Array.from(idxContainer.children);
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
		idxIndicator.innerHTML = (idx+1) + '/' + idxLiAll.length;
	}
	
	
	//********************* */
	//--CSS--
	//********************* */
	function setDefaultCss() {
		var liAll = ul.querySelectorAll('li');
		var prev = container.querySelector('.prev');
		var next = container.querySelector('.next');

		//img-container 스타일
		container.style.width = '100%';
		container.style.position = 'relative';
		container.style.backgroundColor = '#eee';
		container.style.marginBottom = '20px';
		if (option.ratioFix == true) {
			container.style.paddingTop = (100 * option.ratio) + '%';
		}
		
		//img-container 스타일
		imgContainer.style.overflow = 'hidden';
		imgContainer.style.position = 'absolute';
		imgContainer.style.width = '100%';
		imgContainer.style.top = '0';
		imgContainer.style.left = '0';
		
		//ul 스타일
		ul.style.minHeight = '400px';
		ul.style.width = liAll.length * 100 + '%';
		ul.style.position = 'relative';
		ul.style.display = 'flex';
		ul.style.alignItems = 'center';
		ul.style.left = '0%';
		ul.style.transition = '0.5s';
		
		//list 스타일
		var liWidth = (100 / liAll.length) + '%';
		var liPaddingTop = (100 / liAll.length * option.ratio) + '%';
		liAll.forEach(li => {
			li.style.float = 'left';
			li.style.width = liWidth;
			//이미지 스타일
			var liImg = li.querySelector('img');
			
			// 비율 고정
			if (option.ratioFix == false) return;
			li.style.position = 'relative';
			li.style.top = '0';
			li.style.paddingTop = liPaddingTop;
			li.style.overflow = 'hidden';
			
			liImg.style.position = 'absolute';
			liImg.style.top = '0';
			liImg.style.left = '0';
			liImg.style.width = 'auto';
			liImg.style.height = '100%';
		});
		
		//버튼 스타일
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
		
		//인덱스 컨테이너
		var idxContainer = container.querySelector('.idx-container');
		idxContainer.style.position = 'absolute';
		idxContainer.style.bottom = '-3%';
		idxContainer.style.left = '50%';
		idxContainer.style.transform = 'tanslate3d(-50%, 0, 0)';
		
		//인덱스
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
		remove: remove,
		slideImg: slideImg,
	}
}(customOption));

export {imgSlider};