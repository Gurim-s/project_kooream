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
public class RntReviewVO {
	private String rp_idx, rp_content;
	private int p_no, m_no;
	private Date rp_date;
	private String rating;
}
