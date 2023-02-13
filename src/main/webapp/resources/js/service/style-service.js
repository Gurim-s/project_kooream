
/**
 * 
 */

var styleService = (function() {
	async function getOne(style_no) {
		const res = await fetch('/style/' + style_no);
//		const res = await fetch('/style/detail_list/' + category + '/' + style_no, {
//            headers: { 'Content-Type': 'application/json' }
//        });
		return res.json();
	}
	
	async function get(category, style_no) {
		const res = await fetch('/style/detail_list/' + category + '/' + style_no, {
            headers: { 'Content-Type': 'application/json' }
        });
        return res.json();
	}
	
	async function getList(query) {
		const res = await fetch('/style/list', {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(query),
        });
        return res.json();
	}
	
	async function getImageList(styleNoList) {
		const res = await fetch('/style/list/imageList', {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(styleNoList),
        });

		return res.json();
	}
	
//	async function getReplyList(styleNoList) {
//		const res = await fetch('/style/list/replyList', {
//			method: 'post',
//            headers: {
//                'Content-Type': 'application/json;charset=utf-8',
//            },
//            body: JSON.stringify(styleNoList),
//		});
//		
//		return res.json();
//	}
	
	async function getProductTagList(styleNoList) {
		const res = await fetch('/style/list/productTagList', {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(styleNoList),
        });

		return res.json();		
	}
	
	async function like(style_no) {
		const res = await fetch('/style/like/'+style_no);
		
		return res.json();
	}
	
	return {
		getOne: getOne,
		get: get,
		getList: getList,
		getImageList: getImageList,
		getProductTagList: getProductTagList,
		like: like,
	}
})();

export {styleService}