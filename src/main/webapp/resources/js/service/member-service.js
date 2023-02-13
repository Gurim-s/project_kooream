/**
 * 
 */

const memberService = (function() {
	async function getMemberInfo(m_no) {
		const member = await fetch('/member/'+m_no);
		
		return member.json();
	}
	
	async function followMember(m_no) {
		const result = await fetch('/member/follow/'+m_no);
		
		return result.json();
	}
	
	return {
		getMemberInfo: getMemberInfo,
		followMember: followMember,
	}
})();

export {memberService}