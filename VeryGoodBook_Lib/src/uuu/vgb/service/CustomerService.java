package uuu.vgb.service;

import uuu.vgb.entity.Customer;

//CustomerService接收前端資料,進行邏輯判斷
public class CustomerService {
	private CustomersDAO dao = new CustomersDAO();

	public Customer login(String id, String password) {
		//TODO:java.lang.IllegalArgumentException
		
		Customer c = dao.selectCustomerById(id);
		if (c != null && c.getPassword() != null && c.getPassword().equals(password)) {
			return c;
		}
		throw new RuntimeException("登入失敗,帳號或密碼不正確");
	}

	public void register(Customer c) {
		// TOD:加上C物件新增到資料庫的方法

	}
}
