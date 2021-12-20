package uuu.blackcake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.DataInvalidException;
import uuu.blackcake.exception.VGBException;
import uuu.blackcake.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<String> errors = new ArrayList<>();
		// 1.取得request中的FormData:email,password,passwordCheck,
		// name,gender,phone,id,birthday,address
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address ");
		if (email == null || email.length() == 0) {
			errors.add("必須輸入Email");
		}
		if (password == null || password.length() == 0 || !password.equals(passwordCheck)) {
			errors.add("必須輸入一致的密碼");
		}
		if (email == null || email.length() == 0) {
			errors.add("必須輸入Email");
		}
		// TODO:剩餘項目檢查

		// TODO:2.若無誤則呼叫商業邏輯
		if (errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setEmail(email);
				c.setName(name);
				c.setPassword(password);
				CustomerService cService = new CustomerService();
				cService.register(c);
				// TODO:3.1轉交給register.jsp
				
			} catch (DataInvalidException e) {
				errors.add(e.getMessage());
			}catch(VGBException e) {
				this.log("註冊失敗",e);//for admin Dev ,tester
				errors.add(e.getMessage());
			}catch(Exception e) {
				this.log("註冊失敗,發生非預期錯誤");
				errors.add(e.getMessage());
			}
		}
		// TODO:3.2轉交到register.jsp
	}

}
