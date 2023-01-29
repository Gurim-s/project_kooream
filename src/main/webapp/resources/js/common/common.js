function displayTime(timeValue){
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	
	if(gap < (1000 * 60 * 60)){
		return Math.ceil(gap / (1000 * 60)) + '분 전';
		
	}else if(gap < (1000 * 60 * 60 * 24)) {
		return Math.ceil(gap / (1000 * 60 * 60) + '시간 전');
		
	}else if(gap < (1000 * 60 * 60 * 24 * 2)) {
		return '어제';
		
	}else if(gap < (1000 * 60 * 60 * 24 * 3)) {
		return '2일 전';
		
	}else if(gap < (1000 * 60 * 60 * 24 * 2)) {
		return '3일 전';
		
	}else{
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();
		return [yy, '/', (mm > 9 ? '' : '0')+mm, '/', (dd > 9 ? '' : '0') + dd].join('');
	}
}

export {displayTime};