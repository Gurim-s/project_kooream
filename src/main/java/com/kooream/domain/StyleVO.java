package com.kooream.domain;

import java.sql.Date;
import java.util.List;

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
	private Date style_regdate;
	private String style_content, uuid, uploadpath, filename;
	private int m_no, count_like, count_reply, count_image;
	
	//--------------------
	private String m_nickname, m_uuid, m_uploadpath, m_filename; 
	
	private MemberVO writer;
	private ImageFileVO profile_image, main_image;
	private List<ImageFileVO> style_image;
	private List<List<StyleProductTagVO>> productTagList;
	private List<String> hashtags;
	private List<ProductVO> productList;
} 