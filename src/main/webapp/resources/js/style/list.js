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
	const list = await styleService.getList(pageNum, amount);
	list.forEach((item, i) => {
		column[i%4].innerHTML += itemTemplate(item);
	});
}

function itemTemplate(json) {
	var str =(
			'<a href="/style/detail?category=hot&style_no='+json.style_no+'">' +
				'<div class="card">' +
					'<div class="img-container">' +
						'<img src="'+imgService.originPath(json.style_image[0])+'"/>' +
					'</div>' +
					'<div class="summary">' +
						'<div class="user_info">' +
							'<div class="profile"><img src="" /></div>' +
							'<div class="user_id">김씨</div>'+
						'</div>' +
					'</div>' +
					'<div class="content">안녕하세용 ㅎㅎ;</div>' +
				'<div>' +
			'</a>'
	);
	
	return str;
}