package uuu.blackcake.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.blackcake.entity.CartItem;
import uuu.blackcake.entity.ShoppingCart;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/member/update_cart.do")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart!=null&&cart.size()>0) {
			for(CartItem item:cart.getCartItemSet()) {
				//1.取得Form中的資料
				String quantity = request.getParameter("quantity"+item.hashCode());
				String delete = request.getParameter("delete"+item.hashCode());
				System.out.println("quantity"+item.hashCode()+":"+quantity);
				System.out.println("delete"+item.hashCode()+":"+delete);
				
				//2.呼叫商業邏輯
				if(delete==null) {
					//修改數量
					if(quantity!=null&&quantity.matches("\\d+")) {
						int qty = Integer.parseInt(quantity);
						if(qty>0) {
							cart.updateCart(item, Integer.parseInt(quantity));
						}else {
							cart.remove(item);
						}
					}
				}else {//刪除這筆cartItem
					cart.remove(item);//可能發生runtimeException
				}
			}
			
		}
		//3.redirect回cart.jsp
		String checkout = request.getParameter("checkout");
		if(checkout!=null) {
			response.sendRedirect("check_out.jsp");
		}else {
			response.sendRedirect("cart.jsp");					
		}
	}

}
