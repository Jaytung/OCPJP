package uuu.blackcake.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.LoginFailException;
import uuu.blackcake.exception.VGBException;
import uuu.blackcake.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="uuu.blackcake.controller.LoginServlet"
,urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		//必須加在取得第一個參數之前
		request.setCharacterEncoding("utf-8");
		
		//1.取得request的Form Data: email,password,captcha		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		System.out.println("Email: "+ email);
		System.out.println("password: "+ password);
		System.out.println("Captcha: "+ captcha);
		
		//檢查:
		if(email==null||email.length()==0) {
			errors.add("必須輸入Email");
		}
		if(password==null||password.length()==0) {
			errors.add("必須輸入密碼");
		}
		if(captcha==null||captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}
		//2若無錯誤,則呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService cService = new CustomerService();
			
			try {
				Customer c = cService.login(email,password);
				//3.1 產生成功回應

				response.setContentType("text/html");//轉交JSP時,會造成JSP無效
				response.setCharacterEncoding("UTF-8");//若未設定,預設iso 8859-1(西歐)
				try(PrintWriter out = response.getWriter();){
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>登入成功</title>");
					out.println("</head>");
					out.println("<body>");
					out.println("<h1>");
					out.println("您好"+c.getName()+"登入成功!");
					out.println("</h1>");
					out.println("</body>");
					out.println("</html>");
				}
				return;
			}catch(LoginFailException e){
				errors.add(e.getMessage());//for user
			} catch (VGBException e) {
				this.log("登入失敗", e);//for admin Developer,Tester
				errors.add(e.getMessage());
			}catch(Exception e){
				this.log("登入失敗,發生非其錯誤",e);
				errors.add(e.getMessage());
			}
		}
		
		//3.2 產生失敗回應
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		try(PrintWriter out = response.getWriter();){
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<body>");
			out.println("登入失敗: "+errors);
			out.println("</body>");
			out.println("</html>");
		}
	}
}
