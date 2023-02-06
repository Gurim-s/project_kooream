/**
 * 
 */

const productSearchService = (function() {
	async function searchProduct(searchKeyword) {
		const result = await fetch('/search/product', {
			method: 'POST',
			headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(searchKeyword),
		});
		
		return result.json();
	}
	
	async function getProduct(p_no) {
		const result = await fetch('/search/product/'+p_no);
		return result.json();
	}
	
	return {
		searchProduct: searchProduct,
		getProduct: getProduct,
	}
})();

export {productSearchService};