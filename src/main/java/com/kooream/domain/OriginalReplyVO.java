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
public class OriginalReplyVO {
	private int orireplyno, orino, m_no;
	private String orireplyname, orireplycon, oridecision;
	private Date orireplydate;
}
