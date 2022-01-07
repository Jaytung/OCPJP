package uuu.blackcake.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.ShoppingCart;
import uuu.blackcake.entity.Size;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.ProductService;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		List<String> errors = new ArrayList<>();
		//1.取得Form Data
		String productId= request.getParameter("productId");
		String sizeName = request.getParameter("size");
		String spicy=request.getParameter("spicy");
		String quantity = request.getParameter("quantity");
//		System.out.println(productId);
//		System.out.println(sizeName);
//		System.out.println(spicy);
//		System.out.println(quantity);
		if(productId!=null&&productId.length()>0) {
			
			//2.呼叫商業邏輯
			ProductService pService = new ProductService();
			try {
				Product p = pService.selectProductById(productId);
				if(p!=null) {
					if(quantity!=null&&quantity.matches("\\d+")) {
						ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
						if(cart==null) {
							cart = new ShoppingCart();
							session.setAttribute("cart", cart);
						}
						cart.addToCart(p, sizeName, spicy, Integer.parseInt(quantity));
					}
						
				}else {
					errors.add("加入購物車失敗,查無產品(productId:"+productId+")");
				}
			} catch (BlackCakeException e) {
				errors.add("加入購物車失敗,無法讀取產品資料");
			}
		}else {
			errors.add("加入購物車失敗,productId不正確");
		}
		if(errors.size()>0) {
			System.out.println(errors);
		}
		//3.redirect購物車
		response.sendRedirect(request.getContextPath()+"/member/cart.jsp");
//		request.getRequestDispatcher("/member/cart.jsp").forward(request, response);
	}

}
