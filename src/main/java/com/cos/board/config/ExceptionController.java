package com.cos.board.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.cos.board.config.ex.MyArgsNotFound;

@ControllerAdvice //프로젝트 전체관리
@RestController
public class ExceptionController {
	
//	@ExceptionHandler(value=MyArgsNotFound.class)
//	public String 잘못된인수(Exception e) {
//		return e.getMessage();
//	}
	
	
	@ExceptionHandler(value=Exception.class)
	public String 모든오류(Exception e) {
		return e.getMessage();
	}
}
