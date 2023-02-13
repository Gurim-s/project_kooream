/**
 * 
 */

const replyService = (function() {
	async function getList(style_no) {
		const result = await fetch('/stylereplies/list/'+style_no);
		
		return result.json();
	}
	
	async function register(reply) {
		const result = await fetch('/stylereplies/new', {
			method: 'post',
			headers: {
				'Content-Type': 'application/json;charset=utf-8',
			},
			body: JSON.stringify(reply),
		});
		return result;
	}
	
	async function remove(rno) {
		const result = await fetch('/stylereplies/'+rno, {
			method: 'delete',
		});
		return result;
	}
	
	return {
		getList: getList,
		register: register,
		remove: remove,
	}
})();

export {replyService}