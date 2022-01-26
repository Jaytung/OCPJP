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
@WebServlet("/member/update.do")
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
		List<String> errors = new ArrayList<>();
		HttpSession session = request.getSession();
		Customer member =(Customer)session.getAttribute("member");
		//1.取的Form Data檢查
		if(member==null) {
			//redirect回login.jsp
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		String id =request.getParameter("id");
		String password = request.getParameter("password");
		String changePassword = request.getParameter("changePassword");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
//		 1.取得request中的FormData:email,password,passwordCheck,
//		 name,gender,phone,id,birthday,address
//		其他欄位的檢查
		if (id != null && !id.equals(member.getId())) {
			errors.add("不得竄改ID");
			this.log(changePassword);
		}
		if (password == null || !password.equals(member.getPassword())) {
			errors.add("原密碼不正確");
		}else {
			password = member.getPassword();
		}
//		if(changePassword!=null) {
			String password1 = request.getParameter("password1");	
			String password2 = request.getParameter("password2");	
			if(password1==null || !password1.equals(password2)) {
				errors.add("新密碼不正確");
			}else{
				password=password1;
			}
//		}
		if (name == null || name.length() == 0) {
			errors.add("必須輸入姓名");
		}else {
	
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
			try {
				Customer c = new Customer();
				c.setEmail(email);
				c.setName(name);
				c.setPassword(password);
				c.setBirthday(birthday);
				c.setGender(gender.charAt(0));
				c.setPhone(phone);
				c.setId(member.getId());
				c.setAddress(address);
				c.setSubscribed(subscribed!=null);
				CustomerService cService = new CustomerService();
				cService.update(c);
				
				
				// TODO:3.1轉交給update_ok.jsp
				session.setAttribute("member", c);
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
