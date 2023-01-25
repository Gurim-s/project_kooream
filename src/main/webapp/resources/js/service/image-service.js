/**
 * imgService
 */


var imgService = (function() {
	function originPath(imageVO) {
		if (!imageVO) return "/resources/img/codi_test.png";
		
		var {uploadPath, uuid, fileName} = imageVO;
		return "/displayStyleImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
	}
	
	function getImageEl(imageVO) {
		const img = document.createElement('img');
		img.src = originPath(imageVO);
		img.dataset.offsetX = imageVO.offsetX;
		img.dataset.offsetY = imageVO.offsetY; 
		console.log(img);
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
		uploadImageAjax: uploadImageAjax,
		getImageEl: getImageEl,
	}
})();

export {imgService};