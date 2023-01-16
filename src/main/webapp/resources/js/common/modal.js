/**
 * modal 모듈입니다.
 * 
 */

var modal = () => (function() {
	var defaultOption = {
		title: '제목없음',
		type: 'center',
		width: '440px',
		height: '500px',
		backgroundColor: 'white',
		borderRadius: '20px',
	}
	var body = document.getElementsByTagName('body')[0];
	var container = document.createElement('div');
	container.className = 'modal-container';
	var modal;
	
	function open(customOption) {
		var option = (customOption != undefined)? Object.assign(defaultOption, customOption) : defaultOption;
		
		body.append(container);
		modal = createModal();
		container.append(modal);
		modal.querySelector('.modal-title').innerHTML = option.title;
		setCss(option);
		setEventListener();
	}
	
	function close() {
		container.remove();
		body.style.removeProperty('overflow');
	}
	
	function append(element) {
		container.append(element)
	}
	
	function setEventListener() {
		var closeBtn = modal.querySelector('.modal-header .close-modal-btn');
		closeBtn.addEventListener('click', () => close());
		
		//모달창 밖의 영역을 클릭하면 모달 종료
		body.addEventListener('click', (e) => {
			if (e.target.className == 'modal-container') close();
		});
	}
	
	function createModal() {
		var modal = document.createElement('div');
		var modalHeader = document.createElement('div');
		modalHeader.className = 'modal-header';
		var modalBody = document.createElement('div');
		modal.append(modalHeader);
		modal.append(modalBody);
		modalHeader.innerHTML = ('<div class="modal-title">title</div>' +
								 '<a class="close-modal-btn">X</a>');
		
		return modal;
	}
	
	/*
	 *	CSS
	 **/
	function setCss(option) {
		body.style.overflow = 'hidden';
		
		container.style.width = '100%';
		container.style.height = '100%';
		container.style.backgroundColor = 'rgba(0, 0, 0, 0.3)';
		container.style.position = 'fixed';
		container.style.top = '0';
		container.style.left = '0';
		
		if (option.type == 'center') {
			modal.style.width = option.width;
			modal.style.height = option.height;
			modal.style.backgroundColor = option.backgroundColor;
			modal.style.borderRadius = option.borderRadius;
			modal.style.position = 'fixed';
			modal.style.top = '50%';
			modal.style.left = '50%';
			modal.style.transform = 'translate(-50%, -50%)';
		} else if (option.type == 'right') {
			modal.style.width = option.width;
			modal.style.height = '100%';
			modal.style.backgroundColor = option.backgroundColor;
			modal.style.position = 'fixed';
			modal.style.top = '0';
			modal.style.right = '0';
		}
		
		var modalHeader = modal.querySelector('.modal-header');
		modalHeader.style.width = '100%';
		modalHeader.style.height = '40px';
		modalHeader.style.position = 'relative';
		
		var title = modalHeader.querySelector('.modal-title');
		title.style.marginTop = '5px';
		title.style.width = '100%';
		title.style.fontSize = '25px';
		title.style.fontWeight = '500';
		title.style.textAlign = 'center';
		
		var closeBtn = modalHeader.querySelector('.close-modal-btn');
		closeBtn.style.position = 'absolute';
		closeBtn.style.width = '25px';
		closeBtn.style.height = '25px';
		closeBtn.style.fontSize = '20px';
		closeBtn.style.backgroundColor = 'inherit';
		closeBtn.style.border = 'none';
		closeBtn.style.top = '50%';
		if (option.type == 'center') {
			closeBtn.style.right = '5%';
			closeBtn.style.transform = 'translate3d(50%, -50%, 0)';
		} else if (option.type == 'right') {
			closeBtn.style.left = '5%';
			closeBtn.style.transform = 'translate3d(50%, -50%, 0)';
		}
	}
	
	return {
		open: open,
		close: close,
		append: append,
	}
}());

export {modal}