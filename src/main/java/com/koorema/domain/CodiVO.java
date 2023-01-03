package com.koorema.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
@Setter
public class CodiVO {
	private int codi_no, m_no;
	private String codimodel_name, codi_title, codi_content;
	private Date codi_date;
	
}
