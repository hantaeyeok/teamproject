package com.project.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inventory {
	private int ino;
	private int pno;
	private String pname;
	private int iprice;
	private int oprice;
	private int amount;
	private String remark;
	private Date resdate;
}

//create table inventory(
//ino int auto_increment primary key, -- 재고 번호
//pno int, -- 상품 번호
//pname varchar(500),
//iprice int default 1000, 
//oprice int default 1000,
//amount int default 1, -- 재고 수량
//remark varchar(200),
//resdate timestamp default current_timestamp,
//foreign key(pno) references product(pno)
//);
// 출고가
// 재고가