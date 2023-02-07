import {imgService} from '../service/image-service.js';
import {styleService} from '../service/style-service.js';
import {memberService} from '../service/member-service.js';

const view = {
	memberDetailInfo: document.querySelector('#memberDetailInfo'),
	categories: document.querySelector('#categories'),
	column: document.querySelectorAll('.list-column'),
	altEmpty: document.querySelector('#empty-list'),
}
const btn = {
	register: document.querySelector('#register'),
}
const events = {
	moveRegister: () => {
		location.href = 'register';
	},
	onScrollLoadData: () => {
		if (query.isEnd) return;
		if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 100) {
			query.pageNum++;
			getList(query);
		}
	},
}
let query;

(function() {
	query = setQuery();
	setContentHeader();
	getList(query);
	setEvent();
})();

function setQuery() {
	const searchParams = Array.from(new URLSearchParams(location.search));
	const category = searchParams.length == 0 ? 'hot' : searchParams[0][1];
	const param = searchParams.length <= 1 ? '' : searchParams[1][1];
	
	const query = {
		pageNum: 1,
		amount: 20,
		category: category,
		query: param,
		isEnd: false,
	}
	return query; 
}

function setContentHeader() {
	switch (query.category) {
		case '':
		case 'hot':
		case 'tag':
		case 'following':
		case 'recent':
			
			break;
		case 'member':
			loadMemberDetailInfo();
			break;
	}
}

function setEvent() {
	btn.register.addEventListener('click', events.moveRegister);
	document.addEventListener('scroll', events.onScrollLoadData, {passive: true});
}

async function loadMemberDetailInfo() {
	const mno = document.querySelector('input[name="pri_m_no"]').value;
	view.categories.className = 'hide';
	view.memberDetailInfo.className = 'show';	
	if (query.query == mno) {
		view.memberDetailInfo.querySelector('.follow-btn').classList.add('hide');
	} else {
		view.memberDetailInfo.querySelector('.info-update-btn').classList.add('hide');
	}
	
	const member = await memberService.getMemberInfo(query.query);
	view.memberDetailInfo.querySelector('.nickname').innerHTML = member.m_nickname;
	
	console.log(member);
}

async function getList(query) {
	const styleList = await styleService.getList(query);
	styleList.forEach((style, i) => {
		view.column[i%4].append(item(style));
	});
	
	if (styleList.length < query.amount) query.isEnd = true;
	if (view.column[0].children.length == 0) {view.altEmpty.className = '';} 
}

function item(style) {
	const template = document.createElement('a');
	template.className = 'card-link';
	template.href = '/style/detail?category=hot&style_no='+style.style_no;  
	template.innerHTML =(
		'<div class="card">' +
			'<div class="img-container">' +
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
						'<img src="/resources/img/reply.svg" alt="댓글"/>' +
						'<span>'+ style.count_reply +'</span>'+
					'</div>' + 
				'</div>' +
				'<div class="clearfix"></div>' +
			'</div>' +
			'<div class="content">'+ style.style_content +'</div>' +
		'</div>'
	);
	
	const imgEl = imgService.getImageEl(style.style_image[0]);
	const imgContainer = template.querySelector('.img-container');
	imgContainer.append(imgEl);
	
	imgContainer.style.width = '100%';
	imgContainer.style.position = 'relative';
	imgContainer.style.paddingTop = (100 * style.ratio) + '%' ;
	imgContainer.style.overflow = 'hidden';
	imgContainer.style.borderRadius = '10px';
	imgContainer.style.marginBottom = '10px';
	
	imgEl.style.position = 'absolute';
	imgEl.style.top = imgEl.dataset.offsetY;
	imgEl.style.left = imgEl.dataset.offsetX;

	const countImg = document.createElement('div');
	if (style.style_image.length != 1) {
		countImg.innerHTML = style.style_image.length + '+';
		imgContainer.append(countImg);
		countImg.style.position = 'absolute';
		countImg.style.width = '28px';
		countImg.style.height = '16px';
		countImg.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
		countImg.style.borderRadius = '8px';
		countImg.style.fontSize = '13px';
		countImg.style.fontWeight = 'bold';
		countImg.style.color = 'white';
		countImg.style.top = '6px';
		countImg.style.right = '6px';
		countImg.style.textAlign = 'center';
		countImg.style.lineHeight = '16px';
	}
	 
	return template;
}