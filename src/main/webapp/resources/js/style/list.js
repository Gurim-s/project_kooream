/**
 * 
 */

var pageNum, amount;
var column = $('.list-column');

$(function() {
	pageNum = 1;
	amount = 20;
	getList(pageNum, amount);
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