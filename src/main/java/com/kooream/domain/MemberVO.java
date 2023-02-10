package com.kooream.domain;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements Serializable{
	private int m_no, m_style_count, m_follower_count, m_following_count;
	private String m_id, m_pw, m_nickname, m_name, m_bday, m_addr, m_email, m_phone;
	private String m_Detail_addr;
	private String uuid, uploadPath, fileName;
	private List<MemberAuthVO> authList;
}
