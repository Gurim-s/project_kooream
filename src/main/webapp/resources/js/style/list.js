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
});

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
			'<a href="/style/detail?category=hot&style_no={0}">' +
				'<div class="card">' +
					'<div class="img-container">' +
						'<img src="{1}"/>' +
					'</div>' +
					'<div class="summary">' +
						'<div class="user_info">' +
							'<div class="profile"><img src="{2}" /></div>' +
							'<div class="user_id">{3}</div>'+
						'</div>' +
					'</div>' +
					'<div class="content">{4}</div>' +
				'<div>' +
			'</a>'
			).format(json.style_no, makeOriginPath(json.style_image[0]), "", "김씨", "안녕하세용 ㅎㅎ;");
	
	return str;
}

