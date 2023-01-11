
/**
 * 
 */

var styleService = (function() {
	
	function get(category, style_no) {
		return fetch('detail_list/'+category+'/'+style_no, {headers:{'Content-Type': 'application/json'}})
				.then(res => res.json());
	}
	
	return {
		get: get,
	}
})();

var styleImgService = (function() {
	
	return {
		
	}
})();

export {styleService}