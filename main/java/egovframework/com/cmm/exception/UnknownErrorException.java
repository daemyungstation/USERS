package egovframework.com.cmm.exception;

import javax.servlet.ServletException;

public class UnknownErrorException extends ServletException {

	/**
	 * Create a new HttpSessionRequiredException.
	 * @param msg the detail message
	 */
	public UnknownErrorException(String msg) {
		super(msg);
	}
	
	/**
	 * Create a new HttpSessionRequiredException.
	 * @param msg the detail message
	 */
	public UnknownErrorException() {
		super();
	}
}
