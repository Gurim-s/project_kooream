package com.kooream.domain;


import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CodiVO {
	private int codi_no, m_no, codi_cm, codi_kg;
	private String codimodel_name, codi_title, codi_content;
	private Date codi_date;
	
	private List<CodiImageVO> attachList;
	private List<Codi_TagVO> codiTagList;
	
	
	
	
	
	@Override
	public String toString() {
		return "CodiVO [codi_no=" + codi_no + ", m_no=" + m_no + ", codimodel_name=" + codimodel_name + ", codi_title="
				+ codi_title + ", codi_content=" + codi_content + ", codi_date=" + codi_date + "]";
	}
	
	
}
