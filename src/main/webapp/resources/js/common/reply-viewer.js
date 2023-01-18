import {replyService} from '../service/reply-service.js';

const replyViewer = (x) => (function(x) {
	const style_no = x;
	let option = {
		input: false,			/*댓글 입력창 여부*/
	}
	const container = document.createElement('div');
	container.className = 'reply-viewer';
	const listContainer = document.createElement('ul');
	listContainer.clasaName = 'reply-list-container';
	
	async function get() {
		if (option.input == true) {
			container.append(inputTemplate());
			setInputCss();
			setInputEvent();
		}
		container.append(listContainer);
		
		loadReplies();
		return container;
	}
	
//	replyList.forEach(reply => listTemplage(reply));
	async function loadReplies() {
		listContainer.innerHTML = '';
		const replyList = await replyService.getList(style_no);
		if (replyList.length > 0) {
			replyList.forEach(x => listContainer.append(listTemplate(x)));
			
		} else {
			const noneReplyTemplate = document.createElement('li');
			noneReplyTemplate.className = 'reply-none';
			noneReplyTemplate.innerHTML += '<span>댓글이 없습니다.</span>';
			
			listContainer.append(noneReplyTemplate);
		}
		setListCss();
		setListEvent();
		
	}
	
	function inputTemplate() {
		const item = document.createElement('div');
		item.className = 'input-container';
//		/*로그인 기능 추가 후에 수정*/
		item.innerHTML = (
			'<div class="profile-img">'+
				'<img src="/resources/img/codi_test.png" />' +
			'</div>' +
			'<div class="input-reply">' +
				'<input type="text" name="content" value="11">' +
				'<a href="#" class="add-reply">등록</a>' +
			'</div>'
		);
		
		return item;
	}
	
	function listTemplate(reply) {
		const template = document.createElement('li');
		template.dataset.rno = reply.rno;
		template.innerHTML = (
			'<div class="profile-img" data-mno="'+reply.mno+'">' +
				'<img src="/resources/img/codi_test.png" />' +
			'</div>' + 
			'<div class="reply-detail">' +
				'<div class="reply-content">' +
					'<span class="user-name">김겨울</span>' +
					reply.content +
				'</div>' +
				'<div class="reply-etc">' +
					'<span class="regdate">'+reply.regdate+'</span>' +
					'<a class="write-nested-reply" href="#">답글쓰기</a>' +
					'<a class="remove" href="#">삭제</a>' +
				'</div>' +
			'</div>'
		);
		
		return template;
	}
	
	function setOption(customOption) {
		option = Object.assign(option, customOption);
	}
	
	function setInputEvent() {
		container.querySelector('.input-container .add-reply')
		.addEventListener('click', async (e) => {
			e.preventDefault();
			const content = container.querySelector('.input-reply input').value;
			const reply = {
				style_no: style_no,
				mno: 11,
				content: content,
			};
			
			const result = await replyService.register(reply);
			loadReplies();
		});
	};
	
	function setListEvent() {
		listContainer.querySelector('.reply-etc a.remove')
		.addEventListener('click', async (e) => {
			e.preventDefault();
			const rno = e.target.closest('li').dataset.rno;

			const result = await replyService.remove(rno);
			loadReplies();
		});
	}
	
	function setNestedReplyEvent() {
		container.querySelectorAll('.write-nested-reply')
		.forEach(x => x.addEventListener('click', (e) => {
			const rno = e.target.closest('li').dataset('rno');
		}));
	}
	
	function setCss() {
		
	}
	
	function setInputCss() {
		const inputContainer = container.querySelector('.input-container');
		inputContainer.style.width = '100%';
		inputContainer.style.height = '55px';
		inputContainer.style.padding = '10px 24px';
		inputContainer.style.backgroundColor = 'lightgray';
		
		const profile = inputContainer.querySelector('.profile-img');
		profile.style.width = '34px';
		profile.style.height = '34px';
		profile.style.overflow = 'hidden';
		profile.style.borderRadius = '50%';
		profile.style.float = 'left';
		
		const img = inputContainer.querySelector('img');
		img.style.width = '100%';
		img.style.height = '100%';
		img.style.objectFit = 'cover';
		
		const inputReply = inputContainer.querySelector('.input-reply');
		inputReply.style.width = 'calc(100% - 40px)';
		inputReply.style.height = '100%';
		inputReply.style.float = 'right';
		inputReply.style.position = 'relative';
		
		const input = inputContainer.querySelector('.input-reply input');
		input.style.width = '100%';
		input.style.height = '100%';
		input.style.paddingLeft = '10px'; 
		input.style.borderRadius = '25px';
		input.style.border = '1px solid #999';
		input.style.backgroundColor = '#ccc';
		
		const registerBtn = inputContainer.querySelector('.input-reply .add-reply');
		registerBtn.style.color = 'black';
		registerBtn.style.fontSize = '15px';
		registerBtn.style.fontWeight = 'bold';
		registerBtn.style.position = 'absolute';
		registerBtn.style.top = '50%';
		registerBtn.style.right = '10px';
		registerBtn.style.transform = 'translate3d(0, -50%, 0)';
//		registerBtn.style.display = 'none';
	}
	
	function setListCss() {
		listContainer.style.width = '100%';
		listContainer.style.padding = '20px 0px 20px 40px';
//		listContainer.style.height
		
		const list = listContainer.querySelectorAll('li');
		list.forEach( x => {
			x.style.width = '100%';
			x.style.minHeight = '34px';
			
			const profileImg = x.querySelector('.profile-img');
			profileImg.style.width = '34px';
			profileImg.style.height = '34px';
			profileImg.style.overflow = 'hidden';
			profileImg.style.borderRadius = '50%';
			profileImg.style.float = 'left';
			
			const img = profileImg.querySelector('img');
			img.style.width = '100%';
			img.style.height = '100%';
			img.style.objectFit = 'cover';
		});
	}
	
	return {
		get: get,
		setOption: setOption
	}
})(x);

export {replyViewer}