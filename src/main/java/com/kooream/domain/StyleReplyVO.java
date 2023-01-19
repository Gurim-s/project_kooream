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
	private long rno;
	private long mno;
	private long style_no;
	private String content;
	private Date regdate;
	private long nested_from;
}
