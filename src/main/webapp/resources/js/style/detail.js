import {styleService} from '../service/style-service.js';
import {imgSlider} from '../common/img-slider.js';

var column;
(async () => {
	column = document.querySelector('.list-column');
	
	const searchParams = new URLSearchParams(location.search);
	const {category, style_no} = Array.from(searchParams)
									.reduce((obj, arr) => {
										return {...obj, [arr[0]]: arr[1]};
									}, {});
	getList(category, style_no);
	styleService.get(category, style_no)
				.then(data => console.log(data));
	
	let styleList = await styleService.get(category, style_no);
	console.log(styleList[0]);
	
	Array.from(styleList)
		.forEach(x => {})
		
	let imgContainer = document.querySelector('.img-container');
	let images = imgSlider(imgContainer);
	
	images.addList(styleList[0].style_image);
})();

function getList(category, style_no) {
	$.ajax({
		url: "detail_list/{0}/{1}".format(category, style_no),
		type: 'get',
		dataType:"json",
		contentType:"application/json",
	})
	.done(function(json) {
		$.each(json, function(_, style) {
			$(column).append(itemTemplate(style));
		});
		$('button.update').on('click', function() {
			location.href = '/style/update';
		});
	});
}

var itemTemplate = function(style) {
	return (
		'<div class="item">' +
			'<div class="item-header clearfix">' +
				'<div class="item-header-left">' +
					'<div class="profile-image">'+
						'<img class="profile" src="/resources/img/codi_test.png" />' +
					'</div>' +
					'<div class="user-regdate">' +
						'<div class="user-name">김씨</div>' +
						'<div class="regdate">'+ style.style_regDate +'</div>' +
					'</div>' +
				'</div>' +
				'<div class="item-header-right">' +
					'<button class="follow-btn" data-user-no="'+style.m_no+'">팔로우</button>' +
					'<button class="update">수정</button>' +
				'</div>' +
			'</div>' +
			'<div class="img-container"></div>' +
			'<div class="summary">' +
				'<div class="comment-like">'+
					'<div class="comment">' +
						'<img src="/resources/img/comment.svg" alt="댓글"/>' +
						'<span>댓글 '+ style.count_comment+' 개</span>' +
					'</div>' +
					'<div class="like">' +
						'<img src="/resources/img/like.svg" alt="공감"/>' +
						'<span>공감 '+ style.count_like +' 개</span>' +
					'</div>' +
				'</div>' + 
			'</div>' + 
			'<div class="content"></div>' + 
		'</div>'
	).format();
}