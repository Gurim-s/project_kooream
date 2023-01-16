import {replyService} from '../service/reply-service.js';

/**
 * 
 */
const reply = (rno) => (function(rno) {
	var container = document.createElement('ul');

	init();
	function init() {
		const replyList = replyService.getList(rno);
		replyList.forEach(reply => templage(reply));
		
	}
	
	function template(reply) {
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
		.forEach(x => {
			x.addEventListener('click', (e) => {
				const rno = e.target.closest('li').dataset('rno');
			});
		});
	}
	
	function setCss() {
		
	}
	
	return {
		container: container,
	}
})(rno);

const replyInput = (memberNo) => (function() {
	function template() {
		const item = document.createElement('div');
		item.innerHTML = `
			<form action="" method="post">
				<input type="hidden" name="mno" value="${memberNo}">
				
			</form>
		`;
	}
	
	return {
		container: container,
		
	}
}());

export {reply}