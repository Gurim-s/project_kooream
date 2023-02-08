/**
 * 
 */

const memberService = (function() {
	async function getMemberInfo(m_no) {
		const member = await fetch('/member/'+m_no);
		
		return member.json();
	}
	
	return {
		getMemberInfo: getMemberInfo,
	}
})();

export {memberService}