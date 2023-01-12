/**
 * 
 */


var imgService = (function() {
	
	
	function originPath(imageVO) {
		if (!imageVO) return "/resources/img/codi_test.png";
		
		var {uploadPath, uuid, fileName} = imageVO;
		return "/displayStyleImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
	}
	
	return {
		originPath: originPath,
	}
})();

export {imgService};