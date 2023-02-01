package com.kooream.security;
// 로그인 성공시 타는 핸들러
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
			
		resultRedirectStrategy(request, response, authentication); //redirect url 작업을 위한 메서드를 호출
		clearAuthenticationAttributes(request); // 로그인 실페 에러 세션 지우는 함수 실행
	
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        
		// RequestCache 객체를 통해 SavedRequest 객체를 가져옴
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
        
        
        if(savedRequest!=null) { //세션에 이동할 url의 정보가 담겨져 있을때 즉, 인증 권한이 필요한 페이지에 접근했을 경우를 뜻함
            
        	// savedRequest 객체를 통해 getRedirectUrl (로그인화면을 보기 전에 갔던 url)을 가져옴
        	String targetUrl = savedRequest.getRedirectUrl(); 
            
        	redirectStratgy.sendRedirect(request, response, targetUrl);
        
        }else { // 직접 로그인 화면으로 이동했을 경우를 뜻함
             String defaultUrl = "/";
        	redirectStratgy.sendRedirect(request, response, defaultUrl);
        	
        }
        
    }
	
	// 로그인 실페 에러 세션 지우는 함수
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session==null) return; //세션이 null 즉, 세션에 에러가 없다면 그냥 return
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); // WebAttributes.AUTHENTICATION_EXCEPTION 이름 값으로 정의된 세션을 지움
    }
	
}
