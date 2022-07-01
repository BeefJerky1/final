package com.kh.e3i1.error;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@ControllerAdvice(annotations = Controller.class) // 잠시 막아뒀습니다
public class ExceptionController {
	
	@ExceptionHandler(CannotFindException.class)
	public String handler() {
		return "error/404";
	}
	
	@ExceptionHandler(UnauthorizeException.class)
	public void error401(HttpServletResponse response) throws IOException {
		response.sendError(401);
	}

	@ExceptionHandler(Exception.class)
	public String handler(Exception ex) {
		log.error("예외 발생", ex);
		return "error/500";
	}
	
}