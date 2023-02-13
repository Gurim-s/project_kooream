import {replyService} from '../service/reply-service.js';
import {imgService} from '../service/image-service.js';
import {showTime} from '../common/common.js';

const replyViewer = (x) => (function(x) {
	//header.jsp에 있는 로그인 유저 정보
	const pri_m_no = document.querySelector('header input[name="pri_m_no"]').value;
	const profile_img_src = document.querySelector('input[name="pri_m_profile_img_src"]').value;
	//----
	
	const style_no = x;
	let option = {
		input: false,
		nestedReply: false,
	}
	const container = document.createElement('div');
	const publisherList = [];
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
	
	async function loadReplies() {
		listContainer.innerHTML = '';
		const replyList = await replyService.getList(style_no);
		
		if (replyList.length > 0 && option.nestedReply == false) {
			replyList.forEach(x => listContainer.append(replyTemplate(x)));
			
		} else if (replyList.length > 0 && option.nestedReply == true) {
			const nestedReply = replyList.sort((x, y) => x.nested_from < y.nested_from)
			.filter(x => x.nested_from != 0);
					
			replyList.filter(x => x.nested_from == 0)
			.map(x => [x, ...nestedReply.filter(y => y.nested_from == x.r_no)])
			.flat()
			.forEach(x => listContainer.append(replyTemplate(x)));
			
		} else {
			const noneReplyTemplate = document.createElement('li');
			noneReplyTemplate.className = 'reply-none';
			noneReplyTemplate.innerHTML += '<span>댓글이 없습니다.</span>';
			
			listContainer.append(noneReplyTemplate);
		}
		
		update();
		setReplyCss();
		setReplyEvent();
	}
	
	function publish(target) {
		publisherList.push(target);
	}
	
	function update() {
		const count = listContainer.childElementCount;
		publisherList.forEach(x => x.update(count));
	}
	
	function inputTemplate() {
		const item = document.createElement('div');
		item.className = 'input-container';
//		/*로그인 기능 추가 후에 수정*/
		item.innerHTML = (
			'<div class="profile-img">'+
				'<img src="'+profile_img_src+'" />' +
			'</div>' +
			'<div class="input-reply">' +
				'<input type="text" name="content" autocomplete="off" value="">' +
				'<input type="hidden" name="nested_from" value="0">' +
				'<a href="#" class="add-reply" style="display:none;">등록</a>' +
			'</div>'
		);
		
		return item;
	}
	
	function replyTemplate(reply) {
		const template = document.createElement('li');
		if (option.nestedReply) template.dataset.nestedFrom = reply.nested_from;
		template.dataset.r_no = reply.r_no;
		template.innerHTML = (
			'<div class="profile-img" data-m_no="'+reply.m_no+'">' +
				'<img src="'+ imgService.thumbnailPath(reply.profile) +'"/>' +
			'</div>' + 
			'<div class="reply-detail">' +
				'<div class="reply-content">' +
					'<span class="user-name">'+reply.m_nickname+'</span>' +
					reply.content +
				'</div>' +
				'<div class="reply-etc">' +
					'<span class="regdate">'+showTime(reply.regdate)+'</span>' +
					(option.nestedReply? '<a class="write-nested-reply" href="#">답글쓰기</a>': '') +
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
		container.querySelector('.input-container input[name="content"]')
		.addEventListener('keydown', (e) => {
			const addReply = container.querySelector('.input-container .add-reply');
			addReply.style.display = e.target.value == '' ? 'none' : 'inline-block';
		});
		container.querySelector('.input-container .add-reply')
		.addEventListener('click', async (e) => {
			e.preventDefault();
			const content = container.querySelector('.input-reply input[name="content"]');
			const nested_from = container.querySelector('.input-reply input[name="nested_from"]');
			const reply = {
				style_no: style_no,
				m_no: pri_m_no,
				content: content.value,
				nested_from: nested_from.value,
			};
			
			await replyService.register(reply);
			
			loadReplies();
			content.value = '';
			nested_from.value = 0;
		});
	};
	
	function setReplyEvent() {
		listContainer.querySelectorAll('.reply-etc a.remove')
		.forEach(x => x.addEventListener('click', async (e) => {
			e.preventDefault();
			const r_no = e.target.closest('li').dataset.r_no;

			await replyService.remove(r_no);
			loadReplies();
		}));
		
		if (option.nestedReply == false) return;
		container.querySelectorAll('.write-nested-reply')
		.forEach(x => x.addEventListener('click', (e) => {
			e.preventDefault();
			const r_no = e.target.closest('li').dataset.nestedFrom == 0
						? e.target.closest('li').dataset.r_no
						: e.target.closest('li').dataset.nestedFrom;
			const subjectName = e.target.closest('li').querySelector('.user-name').innerText;
			const inputContent = container.querySelector('.input-reply input[name="content"]');
			const inputNestedFrom = container.querySelector('.input-reply input[name="nested_from"]'); 
			
			inputContent.value = '@' + subjectName+ ' ';
			inputNestedFrom.value = r_no;
			
			inputContent.focus();
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
	
	function setReplyCss() {
		listContainer.style.width = '100%';
		listContainer.style.padding = '10px 0px 20px 24px';
//		listContainer.style.height
		
		const list = listContainer.querySelectorAll('li');
		list.forEach( x => {
			x.style.width = '100%';
			x.style.minHeight = '34px';
			x.style.padding = '7px 0';
			
			if (x.className == 'reply-none') return;
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

			const user_name = x.querySelector('.user-name');
			user_name.style.fontWeight = 'bold';
			user_name.style.fontSize = '15px';
			user_name.style.marginRight = '3px';

			const regdate = x.querySelector('.regdate');
			regdate.style.fontSize = '12px';
			regdate.style.color = '#777';
			regdate.style.marginRight = '3px';
			
//			const content = x.querySelector('.content');
			
			const writeNestedReply = x.querySelector('.write-nested-reply');
			writeNestedReply.style.fontSize = '12px';
			writeNestedReply.style.fontWeight = 'bold';
			writeNestedReply.style.color = '#777';
			writeNestedReply.style.marginRight = '3px';
			
			const removeReply = x.querySelector('.remove');
			removeReply.style.fontSize = '12px';
			removeReply.style.fontWeight = 'bold';
			removeReply.style.color = '#777';
			removeReply.style.marginRight = '3px';
			
			if (!option.nestedReply) return;
			if (x.dataset.nestedFrom != 0) {
				x.style.paddingLeft =  '30px';
			}
		});
	}
	
	return {
		get: get,
		setOption: setOption,
		publish: publish,
	}
})(x);

export {replyViewer}