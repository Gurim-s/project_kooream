package com.kooream.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommunityTalkVO {
	private int talkno, m_no;
	private String talkname, talktitle, talkcon;
	private Date talkdate;
	
}
