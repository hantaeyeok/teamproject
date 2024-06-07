package com.project.domain;

import java.util.Date;

import org.apache.commons.lang3.RandomStringUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class IamPortClient {
	public final static String CODE = "imp21342423";
	public final static String KEY = "6425018702165233";
	public final static String SECRET = "1STDv2UmqBHXuEFeCJO6XBzBPlurSIJ1KQS18vmLLlhaaSegAO2YVo20QO5qBMuzgiAkDCBUqNRKCTEU";

	private String randChar;

	public IamPortClient() {
		Date date = new Date();
		this.randChar =  date + RandomStringUtils.randomAlphanumeric(12);
	}
	
}
