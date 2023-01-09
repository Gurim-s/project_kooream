package com.kooream.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CodiReplyVO {
	
	private int codi_c_no;
	private int codi_no;
	
	private String reply;
	private String replyer;
	
	private Date replyDate;
	private Date updateDate;
	
	
}
