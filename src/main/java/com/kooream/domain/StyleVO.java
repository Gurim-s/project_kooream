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
public class StyleVO {
	private long style_no;
	private long m_no;
	private Date style_regdate;
	private String style_content;
	private long count_like;
}