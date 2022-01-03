package uuu.blackcake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.exception.DataInvalidException;
import uuu.blackcake.service.CustomerService;

/**
 * Servlet implementation class UpdateServlet1
 */
@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
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
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
		if (email == null || email.length() == 0) {
			errors.add("必須輸入Email");
		}
		if (password == null || password.length() == 0 || !password.equals(passwordCheck)) {
			errors.add("必須輸入一致的密碼");
		}
		if (name == null || name.length() == 0) {
			errors.add("必須輸入姓名");
		}
		if (gender == null || gender.length() == 0) {
			errors.add("必須選擇性別");
		}
		if (phone == null || phone.length() == 0) {
			errors.add("必須輸入電話");
		}
		
		
		// TODO:剩餘項目檢查

		// TODO:2.若無誤則呼叫商業邏輯
		if (errors.isEmpty()) {
			Customer c = new Customer();
			try {
				c.setEmail(email);
				c.setName(name);
				c.setPassword(password);
				c.setBirthday(birthday);
				c.setGender(gender.charAt(0));
				c.setPhone(phone);
				c.setId(id);
				c.setAddress(address);
				c.setSubscribed(subscribed!=null);
				CustomerService cService = new CustomerService();
				cService.update(c);
				
				
				// TODO:3.1轉交給update_ok.jsp
				request.setAttribute("member", c);
				RequestDispatcher dispatcher=
						request.getRequestDispatcher("update_ok.jsp");
				dispatcher.forward(request, response);
				return;
			} catch (DataInvalidException e) {
				errors.add(e.getMessage());
			}catch(BlackCakeException e) {
				this.log("修改失敗",e);//for admin Dev ,tester
				errors.add(e.getMessage());
			}catch(Exception e) {
				this.log("修改失敗,發生非預期錯誤");
				errors.add(e.getMessage());
			}
		}
		// TODO:3.2轉交到update.jsp
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("update.jsp");
		dispatcher.forward(request, response);
	}

}
