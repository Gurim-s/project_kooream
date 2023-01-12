
/**
 * 
 */

var styleService = (function() {
	
	async function get(category, style_no) {
		const res = await fetch('detail_list/' + category + '/' + style_no, {
            headers: { 'Content-Type': 'application/json' }
        });
        return await res.json();
	}
	
	async function getList(pageNum, amount) {
		const res = await fetch('list/hot', {
            method: 'post',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify({ pageNum: pageNum, amount: amount })
        });
        return await res.json();
	}
	
	return {
		get: get,
		getList: getList,
	}
})();

export {styleService}