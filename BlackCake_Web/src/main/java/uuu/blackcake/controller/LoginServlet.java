package uuu.blackcake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.LoginFailException;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;
import uuu.blackcake.service.MailService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="uuu.blackcake.controller.LoginServlet"
,urlPatterns = {"/login.do"},loadOnStartup = 1)
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        System.out.println("LoginServlet Started!");
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		//必須加在取得第一個參數之前
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		//1.取得request的Form Data: email,password,captcha		
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		System.out.println("Account: "+ account);
		System.out.println("Password: "+ password);
		System.out.println("Captcha: "+ captcha);
		
		//檢查:
		if(account==null||account.length()==0) {
			errors.add("必須輸入帳號");
		}
		if(password==null||password.length()==0) {
			errors.add("必須輸入密碼");
		}
		if(captcha==null||captcha.length()==0) {
			errors.add("必須輸入驗證碼");
		}else {
			String oldCaptcha = (String)session.getAttribute("LoginCaptchaServlet");
			if(!captcha.equalsIgnoreCase(oldCaptcha)) {
				errors.add("驗證碼不正確");
			}
		}
		session.removeAttribute("LoginCaptchaServlet");
		//2若無錯誤,則呼叫商業邏輯
		if(errors.isEmpty()) {
			CustomerService cService = new CustomerService();
			
			try {
				Customer c = cService.login(account,password);
				//3.1 forward(內部轉交)to view: login_ok.jsp(/login_ok.jsp)
				session.setAttribute("member", c);
//				session.setMaxInactiveInterval(10*60);//連線逾時時間設為10分鐘
				
				//add cookies(account,remberMe)
				String remberMe = request.getParameter("remberMe");
				Cookie AcCookie = new Cookie("account",account);
				Cookie autoCookie = new Cookie("remberMe","checked");
				
				if(remberMe==null) {
					AcCookie.setMaxAge(0);//秒數0表示刪除此Cookie
					autoCookie.setMaxAge(0);//秒數0表示刪除此Cookie
				}else {					
					AcCookie.setMaxAge(7*24*60*60);//秒數為單位
					autoCookie.setMaxAge(7*24*60*60);//秒數為單位
				}
				
				response.addCookie(AcCookie);
				response.addCookie(autoCookie);
				
//				3. 作法1:(內部)轉交給login_ok.jsp
				String uri = (String)session.getAttribute("previous_uri");
				String queryString = (String)session.getAttribute("previous_query_string");

				if(uri!=null) request.setAttribute("previous_uri", uri);
				if(queryString!=null)request.setAttribute("previous_query_string", queryString);
				session.removeAttribute("previous_uri");
				session.removeAttribute("previous_query_string");	
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("/login_ok.jsp");
				MailService.sendHelloMailWithLogo(account);
				dispatcher.forward(request, response);
				
				//3. 做法2 轉交外部網址
//				response.sendRedirect(request.getContextPath());
				return;
			}catch(LoginFailException e){
				errors.add(e.getMessage());//for user
			} catch (BlackCakeException e) {
				this.log("登入失敗", e);//for admin Developer,Tester
				errors.add(e.getMessage());
			}catch(Exception e){
				this.log("登入失敗,發生非其錯誤",e);
				errors.add(e.getMessage());
			}
		}
		
		//3.2 forward(內部轉交)to View:login.html(/login,html)產生失敗回應
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);

		}
	}
