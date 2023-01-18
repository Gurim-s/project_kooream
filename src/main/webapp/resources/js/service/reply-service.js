/**
 * 
 */

const replyService = (function() {
	async function getList(style_no) {
		const result = await fetch('/stylereplies/list/'+style_no);
		
		return result.json();
	}
	
	function get(rno) {
		return {};
	}
	
	function update(reply) {
		return ;
	}
	
	async function register(reply) {
		const result = await fetch('/stylereplies/new', {
			method: 'post',
			headers: {
				'Content-Type': 'application/json;charset=utf-8',
			},
			body: JSON.stringify(reply),
		});
		return result.then();
	}
	
	async function remove(rno) {
		const result = await fetch('/stylereplies/'+rno, {
			method: 'delete',
		});
		return result.then();
	}
	
	return {
		getList: getList,
		get: get,
		update: update,
		register: register,
		remove: remove,
	}
})();

export {replyService}