/**
 * 
 */

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
			$(column[idx % 4]).append(JSON.stringify(style));
		});
	});	
}