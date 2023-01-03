/**
 * 
 */

$(function() {
	$.ajax({
		url: "list/hot",
		type: 'get',
		dataType:"json"
	})
	.done(function(json) {
		$('#content').text(JSON.stringify(json));
	});
})