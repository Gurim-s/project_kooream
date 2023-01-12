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