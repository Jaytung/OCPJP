package uuu.blackcake.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout.do")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		//1.無formData要處裡
		//2.執行商業邏輯
		if(session!=null) {
			session.invalidate();
		}
		//3. 作法1 不建議:(內部)轉交給首頁 會造成首頁網址不正確
//		request.getRequestDispatcher("/").forward(request, response);
		
		//3. 做法2:改成外部轉交首頁
		response.sendRedirect(request.getContextPath());
	}

}
