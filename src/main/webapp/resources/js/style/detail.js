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
		$.each(json, function(idx, style) {
			$(column).append(makeItem(style));
		});
	});
}

function makeItem(style) {
	var {style_no, m_no, style_regdate, style_content, count_like, count_comment, style_image} = style;
	var str =(
		'<div class="card" data-style-no="{0}">' +
			'<div class="img-container">' +
				makeSlider(style_image) +
			'</div>' +
			'<div class="summary">' +
				'<div class="user_info">' +
					'<div class="profile"><img src="{1}" /></div>' +
					'<div class="user_id">{2}</div>'+
				'</div>' +
				'<div class="comment-like">'+
					'<div class="comment">' +
						'<img src="{3}" />' +
						'<span>{4}</span>' +
					'</div>' +
					'<div class="like">' +
						'<img src="{5}" />' +
						'<span>{6}</span>' +
					'</div>' +
				'</div>' + 
			'</div>' +
			'<div class="content">{7}</div>' +
		'<div>'
		).format(style_no, "", m_no, "", count_comment, "", count_like, style_content);
	
	return str;
}

function makeSlider(imageVOList) {
	var imgTagList = Array.from(imageVOList)
						.map(imageVO => makeOriginPath(imageVO))
						.reduce((str, imagePath) => {return str + '<li><img src="' + imagePath + '"/></li>'}, '');
	
	return '<ul>' + imgTagList + '</ul>';
}
