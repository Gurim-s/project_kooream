/**
 * imgService
 */


var imgService = (function() {
	function originPath(imageVO) {
		if (!imageVO) return '/resources/img/codi_test.png';
		
		var {uploadPath, uuid, fileName} = imageVO;
		return "/displayImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
	}
	
	function thumbnailPath(imageVO, size) {
		if (size == null) size = 's';
		if (!imageVO) return '/resources/img/codi_test.png';
		var originalUuid = imageVO.uuid;
		imageVO.uuid = size + '_' + originalUuid;
		
		return originPath(imageVO);
	}
	
	function getImageEl(imageVO) {
		const img = document.createElement('img');
		img.src = originPath(imageVO);

		return img;
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
		thumbnailPath: thumbnailPath,
		uploadImageAjax: uploadImageAjax,
		getImageEl: getImageEl,
	}
})();

export {imgService};