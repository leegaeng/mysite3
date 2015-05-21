package com.sds.icto.mysite.exception;

public class BoardDaoException extends RuntimeException {

	public BoardDaoException() {
		super("BoardDao Exception");
	}

	public BoardDaoException(String msg) {
		super(msg);
	}
}
