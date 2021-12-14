package uuu.blackcake.exception;

public class LoginFailException extends VGBException {

	public LoginFailException() {
		super("登入失敗，帳號或密碼不正確");		
	}

	public LoginFailException(String message, Throwable cause) {
		super(message, cause);
	}

	public LoginFailException(String message) {
		super(message);
	}
}
