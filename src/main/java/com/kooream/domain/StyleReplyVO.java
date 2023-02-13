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
public class StyleReplyVO {
	private long r_no, style_no;
	private int m_no, nested_from, count_nested;
	private String m_nickname, content, uuid, uploadPath, fileName;
	private Date regdate;
	
	//-----------
	private ImageFileVO profile;
}
