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
public class RntRsvtVO {
	private String r_no, buyno;
	private int m_no, p_no;
	private String strt_r_date, rtrn_r_date;
	private int total_price;
}
