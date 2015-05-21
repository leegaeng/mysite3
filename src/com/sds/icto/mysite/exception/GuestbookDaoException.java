package com.sds.icto.mysite.exception;

public class GuestbookDaoException extends RuntimeException {

	public GuestbookDaoException(){
		super("GuestbookDao Exception");
	}
	
	public GuestbookDaoException(String msg){
		super(msg);
	}
	
	
}
