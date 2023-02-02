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
public class HashtagVO {
	private long tag_no;
	private String hashtag;
	private Date regdate;
	private int insert_count;
	private int search_count;
}
