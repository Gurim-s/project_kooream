import {styleService} from '../service/style-service.js';
import {imgSlider} from '../common/img-slider.js';

(async () => {
	var column = document.querySelector('.list-column');
	
	const searchParams = new URLSearchParams(location.search);
	const [category, style_no] = Array.from(searchParams)
									.reduce((obj, arr) => [...obj, arr[1]], []);
	
	let styleList = await styleService.get(category, style_no);
	
	Array.from(styleList)
		.forEach(x => column.append(itemTemplate(x)));
})();

var itemTemplate = function(style) {
	var str = (
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
				'</div>' +
				'<div class="like">' +
					'<img src="/resources/img/like.svg" alt="공감"/>' +
				'</div>' +
				'<div class="clearfix"></div>' +
				'<span>댓글 '+ style.count_comment+'개</span>' +
				'<span>공감 '+ style.count_like +'개</span>' +
			'</div>' + 
		'</div>' + 
		'<div class="content"></div>'
	).format();
	
	var item = document.createElement('div');
	item.className = 'item';
	item.innerHTML += str;
	
	var imgContainer = item.querySelector('.img-container');
	var slider = imgSlider(imgContainer);
	slider.addList(style.style_image); 
	return item;
}