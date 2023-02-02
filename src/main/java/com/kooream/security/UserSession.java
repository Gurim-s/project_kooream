package com.kooream.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import com.kooream.domain.MemberVO;

import lombok.Getter;

@Getter
public class UserSession {
	
	private CustomUser customUser;
	private Authentication authentication;
	
	public UserSession() {
		// 시큐리티에서 직접 값을 가져와서 저장
		this.authentication = SecurityContextHolder.getContext().getAuthentication();
		if(this.authentication instanceof AnonymousAuthenticationToken) {
			// 세션이 없을경우 customUser에 null값 입력
			this.customUser = null;
		}else {
			// 세션이 있을 경우 customUser에 session 저장
			this.customUser = (CustomUser) this.authentication.getPrincipal();
		}
	}
	
	public MemberVO getSession() {
		// 저장된 customUser에서 사용할 Member객체만 추출, customUser가 null일경우 null 리턴
		return customUser != null ? customUser.getMember() : null;
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		if(this.authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, this.authentication);
		}
	}
}
