package com.kooream.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AttachFileVO {
	private String uuid, FileName, FileType, uploadPath;
	private int p_no, b_no;
	private String img_url;
}
