package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int pno;	//상품번호
	private String pcate;	//상품 분류
	private String pname;	//상품 이름
	private int price;	//상품가격
	
	private int asdate;	//보증기간 상품별 보증기간 
	
	private String pcontext1;	//상세설명1
	private String pcontext2;	//상세설명2
	
	private Date resdate;	//등록날짜
	
	private String img1;	//썸네일 이미지
	private String img2;	//썸네일 이미지
	private String img3;	//상세페이지
	private String img4;	//상세페이지
}
