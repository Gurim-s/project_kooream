/**
 * 
 */


var imgService = (function() {
	
	function originPath(imageVO) {
		if (!imageVO) return "/resources/img/codi_test.png";
		
		var {uploadPath, uuid, fileName} = imageVO;
		return "/displayStyleImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
	}
	
	async function uploadImageAjax(url, formData) {
		var imageVOList = await fetch(url, {
			method: 'POST',
			body: formData,
		}).then((response) => response.json());
		
		return imageVOList;
	}
	
	return {
		originPath: originPath,
		uploadImageAjax: uploadImageAjax,
	}
})();

export {imgService};