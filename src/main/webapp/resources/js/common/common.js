// 스트링 포맷 함수
if (!String.format) {
	String.prototype.format = function() {
	    var formatted = this;
	    for( var arg in arguments ) {
	        formatted = formatted.replace("{" + arg + "}", arguments[arg]);
	    }
	
	    return formatted;
	};
}

function makeOriginPath(imageVO) {
	if (!imageVO) return "/resources/img/codi_test.png";
	
	var {uploadPath, uuid, fileName} = imageVO;
	return "/displayStyleImage?fileName=" + encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
}