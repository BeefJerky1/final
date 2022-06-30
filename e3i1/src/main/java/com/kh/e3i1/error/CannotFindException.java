package com.kh.e3i1.error;

//404번을 처리하기 위해 새로 만든 예외(신규 예외)
//- RuntimeException을 상속받으면 예외 전가 생략이 가능
public class CannotFindException extends RuntimeException{
	
	private static final long serialVersionUID = 1L;
	
	public CannotFindException() {
		super("존재하지 않는 대상입니다");
	}
	public CannotFindException(String text) {
		super(text);
	}
	
}