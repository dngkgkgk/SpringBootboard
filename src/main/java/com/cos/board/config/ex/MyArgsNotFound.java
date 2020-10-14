package com.cos.board.config.ex;

public class MyArgsNotFound extends Exception{
	
	private String message;

	public MyArgsNotFound(String message) {
		
		this.message = message;
	}
	
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return message;
	}
}
