package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int mcode; //check (cate in ('member', 'admin'))
	private String id; 
	private String pw;
	private String name;
	private String email;	//결제 정보 때 필요함 not null 사용
	private String tel;
	private String postcode;
	private String addr; // addr 하나로 
	private Date birth; 
	private Date regdate; 
	private String level; //맴버십 레벨 
	private int report;
	private int caution;
	private String able;
}

//CREATE TABLE member (
//	    cate ENUM('member', 'admin') NOT NULL DEFAULT 'member',  -- cate 필드에 'member'와 'admin'만 허용
//	    id VARCHAR(20) PRIMARY KEY,
//	    pw VARCHAR(300) NOT NULL,
//	    name VARCHAR(100) NOT NULL,
//	    email VARCHAR(200) NOT NULL,  -- email 필드에 NOT NULL 제약 조건
//	    tel VARCHAR(100) NOT NULL,
//	    postcode VARCHAR(20),
//	    addr VARCHAR(200),  -- addr 필드를 하나로 통합
//	    birth DATE,
//	    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//	    level VARCHAR(50) 
//	    );
//ENUM은 MySQL에서 사용되는 데이터 타입 중 하나로, 특정한 값들만 허용하는 문자열 집합을 정의할 수 있습니다. 
//ENUM 타입을 사용하면 필드 값이 미리 정의된 선택지 중 하나로 제한되기 때문에, 데이터 무결성을 유지하는 데 유용합니다. 
//예를 들어, cate 필드를 'member'와 'admin' 중 하나로만 설정하려면 ENUM 타입을 사용할 수 있습니다.