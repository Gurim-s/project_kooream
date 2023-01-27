package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private int m_no;
	private String m_id, m_pw, m_nickname, m_name, m_bday, m_addr, m_email, m_phone;
	private String m_Detail_addr;
}
