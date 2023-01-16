/**
 * 
 */

const replyService = (function() {
	function getList(rno) {
		
		return [];
	}
	
	function get(rno) {
		return {};
	}
	
	function update(reply) {
		return ;
	}
	
	function register(reply) {
		return;
	}
	
	function remove(rno) {
		return;
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