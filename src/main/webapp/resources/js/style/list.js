/**
 * 
 */

var pageNum, amount;
var column = $('.list-column');
var more = $('#more');

$(function() {
	pageNum = 1;
	amount = 20;
	getList(pageNum, amount);
	
	$(more).on('click', function() {
		pageNum++;
		getList(pageNum, amount);
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
		console.log(JSON.stringify(json));
		$.each(json, function(idx, style) {
			$(column[idx % 4]).append(JSON.stringify(style));
		});
	});	
}