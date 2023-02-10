import {imgService} from '../service/image-service.js';
import {styleService} from '../service/style-service.js';
import {memberService} from '../service/member-service.js';

const member_no = document.querySelector('input[name="pri_m_no"]').value;
const view = {
	memberDetailInfo: document.querySelector('#memberDetailInfo'),
	categories: document.querySelector('#categories'),
	listKeyword: document.querySelector('#listKeyword'),
	column: document.querySelectorAll('.list-column'),
	altEmpty: document.querySelector('#empty-list'),
}
const btn = {
	register: document.querySelector('#register'),
}
const events = {
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
		case 'recent':
		case 'following':
		case 'tag':
			loadCategoriesHeader();
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

function loadCategoriesHeader() {
	view.categories.className = 'show';
	view.categories.querySelector('#register')
	.className = isNaN(member_no)? 'hide': 'show';
	
	if (['hot', 'recent', 'following'].includes(query.category)) {
		view.categories.querySelector('#' + query.category)
		.className = 'on';
	}
	
	if (query.query === '') return;
	loadListTitle();
}

function loadListTitle() {
	const listTitle = view.categories.querySelector('#listKeyword h1'),
		  queryType = query.category == 'tag'? '#': '';
	
	listTitle.innerHTML = '<strong>'+ queryType +query.query+'</strong>';
}

async function loadMemberDetailInfo() {
	const header = view.memberDetailInfo;
	header.className = 'show';
	if (query.query == member_no) {
		header.querySelector('.follow-btn').classList.add('hide');
	} else {
		header.querySelector('.info-update-btn').classList.add('hide');
	}
	
	const member = await memberService.getMemberInfo(query.query);
	header.querySelector('.nickname').innerHTML = member.m_nickname;
	
	const profileImg = imgService.originPath(member.profileImage);
	header.querySelector('.profile-img').src = profileImg;
}

async function getList(query) {
	const styleList = await styleService.getList(query);
	console.log(styleList);
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
				'<img src="'+imgService.thumbnailPath(style.main_image)+'" />'+
			'</div>' +
			'<div class="info">' +
				'<div class="user_info">' +
					'<div class="profile">'+
						'<img src="'+imgService.thumbnailPath(style.profile_image)+'" />'+
					'</div>' +
					'<div class="user_id">'+style.m_nickname+'</div>'+
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
	
	const imgContainer = template.querySelector('.img-container');
//	imgContainer.style.paddingTop = (100 * style.ratio) + '%' ;
	
	const countImg = document.createElement('div');
	countImg.className = 'count-img';
	if (style.count_image != 1) {
		countImg.innerHTML = style.count_image + '+';
		imgContainer.append(countImg);
	}
	
	return template;
}