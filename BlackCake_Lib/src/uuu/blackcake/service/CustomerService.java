package uuu.blackcake.service;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.BlackCakeException;

//CustomerService接收前端資料,進行邏輯判斷
public class CustomerService {
	private CustomersDAO dao = new CustomersDAO();

	public Customer login(String account, String password) throws BlackCakeException {
		if (account == null || account.length() == 0 || password == null || password.length() == 0) {
			throw new IllegalArgumentException("帳號或密碼必須要有值");
		}
		Customer c = dao.customerLogin(account);
		if (c != null && c.getPassword() != null && c.getPassword().equals(password)) {
			return c;
		}
		throw new BlackCakeException("登入失敗,帳號或密碼不正確");
	}

	public void register(Customer c) throws BlackCakeException {
		if (c == null) {
			throw new IllegalArgumentException("新增customer物件不得為null");
		}
		dao.insert(c);
	}

	public void update(Customer c) throws BlackCakeException {
		if (c == null) {
			throw new IllegalArgumentException("修改customer物件不得為null");
		}
		dao.update(c);
	}

//	public Customer sendPassword(String account) throws BlackCakeException{
//		if(account==null) {
//			throw new IllegalArgumentException("必須輸入帳號"); 
//		}
//		return dao.sendPassword(account);
//	}
}
