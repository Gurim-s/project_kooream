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
		const replyList = await replyService.getList(style_no);
		if (replyList.length > 0) {
			listContainer.innerHTML = '';
			replyList.forEach(x => listContainer.append(listTemplate(x)));
			
			setListCss();
			setListEvent();
			
		} else {
			const noneReplyTemplate = document.createElement('div');
			noneReplyTemplate.className = 'reply-none';
			noneReplyTemplate.innerHTML += '<span>댓글이 없습니다.</span>';
			
			container.append(noneReplyTemplate);
		}
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
			alert(result);
			loadReplies();
		});
	};
	
	function setListEvent() {
		listContainer.querySelector('.reply-etc a.remove')
		.addEventListener('click', async (e) => {
			e.preventDefault();
			const rno = e.target.closest('li').dataset.rno;

			const result = await replyService.remove(rno);
			alert(result);
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
		inputContainer.style.height = '60px';
		inputContainer.style.width = '100%';
		inputContainer.style.padding = '5px 10px';
		inputContainer.style.backgroundColor = 'lightgray';
		
		const profile = inputContainer.querySelector('.profile-img');
		profile.style.width = '50px';
		profile.style.height = '50px';
		profile.style.overflow = 'hidden';
		profile.style.borderRadius = '50%';
		profile.style.float = 'left';
		
		const img = inputContainer.querySelector('img');
		img.style.width = '100%';
		img.style.height = '100%';
		img.style.objectFit = 'cover';
		
		const inputReply = inputContainer.querySelector('.input-reply');
		inputReply.style.width = '300px';
		inputReply.style.float = 'left';
	}
	
	function setListCss() {
		listContainer.style.width = '100%';
		listContainer.style.padding = '20px 10px';
//		listContainer.style.height
		
		const list = listContainer.querySelectorAll('li');
		list.forEach( x => {
			x.style.width = '100%';
			x.style.minHeight = '40px';
			
			const profileImg = x.querySelector('.profile-img');
			profileImg.style.width = '40px';
			profileImg.style.height = '40px';
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