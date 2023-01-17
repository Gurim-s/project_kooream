import {replyService} from '../service/reply-service.js';

/**
 * 
 */
const reply = (rno) => (function(rno) {
	const container = document.createElement('ul');
	
	container.append(inputTemplate());
	
	const replyList = replyService.getList(rno);
	replyList.forEach(reply => templage(reply));


	function inputTemplate() {
		const item = document.createElement('div');
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
		console.log(item);
		return item;
	}
	
	function listTemplate(reply) {
		const template = document.createElement('li');
		template.dataset.rno = reply.rno;
		template.innerHTML = `
			<div class="profile-img" data-mno="${reply.uno}">
				<img src="/resources/img/codi_test.png" />
			</div>
			<div class="reply-detail">
				<div class="reply-content">
					<span class="user-name"></span>
				</div>
				<div class="reply-etc">
					<span class="regdate"></span>
					<a class="write-nested-reply" href="#">답글쓰기</a>
				</div>
			</div>
		`;
		
		return template;
	}
	
	function setEvent() {
		container.querySelectorAll('.write-nested-reply')
		.forEach(x => x.addEventListener('click', (e) => {
				const rno = e.target.closest('li').dataset('rno');
		}));
	}
	
	function setCss() {
		
	}
	
	return {
		container: container,
	}
})(rno);

export {reply}