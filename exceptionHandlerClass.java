package com.bookstore.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class exceptionHandlerClass extends ResponseEntityExceptionHandler {
	
	@ExceptionHandler(Exception.class)
	public ResponseEntity<String> handlerException (Exception e)
	{
		return new ResponseEntity<>("An unexpected error ocurred : "+e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
	}	
}
