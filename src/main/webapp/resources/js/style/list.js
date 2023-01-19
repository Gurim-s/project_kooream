import {imgService} from '../service/image-service.js';
import {styleService} from '../service/style-service.js';

var pageNum, amount;
var column = document.querySelectorAll('.list-column');
var more = document.querySelector('#more');
var register = document.querySelector('#register');

// 페이지 초기화
(function() {
	pageNum = 1;
	amount = 20;
	getList(pageNum, amount);
	
	register.addEventListener('click', function() {
		location.href = 'register';
	});
	
	more.addEventListener('click', function() {
		pageNum++;
		getList(pageNum, amount);
	});
})();

async function getList(pageNum, amount) {
	const styleList = await styleService.getList(pageNum, amount);
	styleList.forEach((style, i) => {
		column[i%4].innerHTML += item(style);
	});
}

function item(style) {
	var str =(
		'<a class="card-link" href="/style/detail?category=hot&style_no='+style.style_no+'">' +
			'<div class="card">' +
				'<div class="img-container">' +
					'<img src="'+imgService.originPath(style.style_image[0])+'"/>' +
				'</div>' +
				'<div class="info">' +
					'<div class="user_info">' +
						'<div class="profile"><img src="/resources/img/codi_test.png" /></div>' +
						'<div class="user_id">김씨</div>'+
					'</div>' +
					'<div class="social_info">' +
						'<div class="like">' +
							'<img src="/resources/img/like.svg" alt="공감"/>' +
							'<span>'+ style.count_like +'</span>'+
						'</div>' + 
						'<div class="comment">' +
							'<img src="/resources/img/comment.svg" alt="댓글"/>' +
							'<span>'+ style.count_comment +'</span>'+
						'</div>' + 
					'</div>' +
					'<div class="clearfix"></div>' +
				'</div>' +
				'<div class="content">'+ style.style_content +'</div>' +
			'</div>' +
		'</a>'
	);
	
	return str;
}