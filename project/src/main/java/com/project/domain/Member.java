package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int mcode; //mcode : 0(메인관리자), 1(서브관리자), 2(일반회원) 
	private String id; 
	private String pw;
	private String name;
	private String email; //결제 정보 때 필요, not null 사용
	private String tel;
	private String postcode;
	private String addr1; //기본주소
	private String addr2; //상세주소
	private Date birth; 
	private Date regdate; 
	private String level; //멤버십 등급(SILVER, GOLD, PLATINUM : 일반회원 / SPECIAL : 관리자) 
	//report(신고) 10인 경우, caution(경고) 1 증가 + report는 0으로 초기화
	private int report;	//신고당한 횟수, default=0
	//caution(경고) 1회 : 7일 이용정지, 2회 : 15일 이용정지, 3회 : 30일 이용정지, 4회 : 60일 이용정지, 5회 : 강제탙퇴
	private int caution; //경고 횟수, default=0 
	//able : true(로그인 후 서비스 이용가능), false(로그인 불가 / 이용정지)
	private String able; //로그인 가능여부, default='TRUE'
	// TRUE -> FALSE : caution 값이 증가할 때
    // FALSE -> TRUE : "정지끝나는 날(stopend) - 현재 날짜 <= 0"인 경우
	private int payment; //한 달 누적 결제 금액 / 달(EX. 4월 -> 5월)이 바뀌면 0으로 초기화
	private int stopperiod; //정지기간(7일/15일/30일/60일), default=0 -> caution에 따라 적용
	private String stopstart; //정지 시작 날, default=null
    // caution 값이 증가할 때, stopstart -> current_date(현재시간으로 update)
	private String stopend; //정지 끝나는 날 = 시작 날 + 정지기간, default=null
	private int sumcaution;  //경고 횟수 저장
}