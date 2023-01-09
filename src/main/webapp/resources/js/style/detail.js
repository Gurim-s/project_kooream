var column;

$(function() {
	column = $('.list-column');
	
	const searchParams = new URLSearchParams(location.search);
	const {category, style_no} = Array.from(searchParams)
									.reduce((obj, arr) => {
										return {...obj, [arr[0]]: arr[1]};
									}, {});
	getList(category, style_no);
});


function getList(category, style_no) {
	$.ajax({
		url: "detail_list/{0}/{1}".format(category, style_no),
		type: 'get',
		dataType:"json",
		contentType:"application/json",
	})
	.done(function(json) {
		$.each(json, function(_, style) {
			$(column).append(makeItem(style));
		});
		$('button.update').on('click', function() {
			location.href = '/style/update';
		});
	});
}


function makeItem(style) {
	var {style_no, m_no, style_regdate, style_content, count_like, count_comment, style_image} = style;
	var el = document.createElement('div');

	var str =(
			'<div class="summary">' +
				'<div class="comment-like">'+
					'<div class="comment">' +
						'<img src="" />' +
						'<span>댓글 {0} 개</span>' +
					'</div>' +
					'<div class="like">' +
						'<img src="" />' +
						'<span>공감 {1} 개</span>' +
					'</div>' +
				'</div>' + 
			'</div>'
		).format(count_comment, count_like);
	
	el.className = 'card';
	el.dataset.styleNo = style_no;
	el.append(detailHeader(style))
	el.append(imgSlider(style_image))
	el.append(detailContent(style));
	el.innerHTML += str;
	return el;
}

function detailHeader(style) {
	var {style_no, m_no, style_regdate} = style;
	var el = document.createElement('div');
	var str = (
			'<div class="item-header-left">' +
				'<div class="profile-image">'+
					'<img src="{0}" />' +
				'</div>' +
				'<div class="user-regdate">' +
					'<div class="user-name">{1}</div>' +
					'<div class="regdate">{2}</div>' +
				'</div>' +
			'</div>' +
			'<div class="item-header-right">' +
				'<button class="follow-btn">팔로우</button>' +
				'<button class="update">수정</button>' +
			'</div>' 
			).format("/resources/img/codi_test.png", 'Nobody', '0시간 전');
	
	el.innerHTML = str;
	el.className = 'item-header clearfix';
	return el;
}

function imgSlider(imageList) {
	var el = document.createElement('ul');
	var imgTagList = Array.from(imageList)
						.map(image => makeOriginPath(image))
						.reduce((str, imagePath) => {return str + '<li><img src="' + imagePath + '"/></li>'}, '');
	
	el.innerHTML = imgTagList;
	el.className = 'img-container';
	return el;
}

function detailContent(style) {
	var {style_content} = style;
	var el = document.createElement('div');	
	
	el.innerHTML = style_content;
	el.className = 'content';
	return el;
}