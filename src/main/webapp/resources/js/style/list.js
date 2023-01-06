/**
 * 
 */
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

var pageNum, amount;
var column = $('.list-column');
var more = $('#more');
var register = $('#register');

// 페이지 초기화
$(function() {
	pageNum = 1;
	amount = 20;
	getList(pageNum, amount);
	
	$(more).on('click', function() {
		pageNum++;
		getList(pageNum, amount);
	});
	
	$(register).on('click', function() {
		location.href = 'register';
	});
})

function getList(pageNum, amount) {
	$.ajax({
		url: "list/hot",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount,
		}),
		type: 'post',
		dataType:"json",
		contentType:"application/json",
	})
	.done(function(json) {
		$.each(json, function(idx, style) {
			$(column[idx % 4]).append(makeCard(style));
		});
	});	
}

function makeCard(json) {
	var str =(
			'<div class="card">' +
				'<div class="img-container">' +
					'<img src="/displayStyleImage?fileName={0}"/>' +
				'</div>' +
				'<div class="summary">' +
				'</div>' +
				'<div class="content"></div>' +
			'<div>'
			).format(makeOriginPath(json.style_image[0]));
	
	return str;
}

function makeOriginPath(imageVO) {
	if (!imageVO) return;
	
	var {uploadPath, uuid, fileName} = imageVO;
	return encodeURI(uploadPath + "\\" + uuid + "_" + fileName);
}