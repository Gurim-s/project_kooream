/**
 * 
 */

var styleService = (function() {
	
	function get(category, style_no) {
		return fetch('detail_list/'+category+'/'+style_no);
	}
	
	return {
		get: get,
	}
})();

var styleImgService = (function() {
	
	return {
		
	}
})();