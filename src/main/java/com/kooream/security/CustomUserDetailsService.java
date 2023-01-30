package com.kooream.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kooream.domain.MemberVO;
import com.kooream.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
   @Setter(onMethod_= @Autowired)
   private MemberMapper memberMapper;

   
   @Override
   public UserDetails loadUserByUsername(String m_id) throws UsernameNotFoundException {
      log.warn("load user by userName : " + m_id);
      MemberVO vo = memberMapper.read(m_id);
      
      // 전달된 id로 사용자 정보를 검색.

      return vo == null ? null : new CustomUser(vo);
      
   }

}