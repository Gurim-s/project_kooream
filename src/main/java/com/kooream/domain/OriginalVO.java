package com.kooream.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OriginalVO {
	private int orino, m_no;
	private String brandname, oriname, orititle, oricon;
	private Date oridate;
	
	// 게시글 등록 시 한 번에 첨부파일을 처리하기 위해 list 추가
	private List<OriginalAttachVO> attachList;
}
