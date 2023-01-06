package com.kooream.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class CommunityTalkReplyVO {
	private int talkreplyno, talkno, m_no;
	private String talkreplyname, talkreplycon;
	private Date talkreplydate;
}
