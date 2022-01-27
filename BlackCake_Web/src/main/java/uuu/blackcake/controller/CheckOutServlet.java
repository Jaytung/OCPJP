package uuu.blackcake.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.entity.PaymentType;
import uuu.blackcake.entity.ShippingType;
import uuu.blackcake.entity.ShoppingCart;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.OrderService;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckOutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		List<String> errors = new ArrayList<>();
		// 1.取的FormData
		String paymentType = request.getParameter("paymentType");
		String shippingType = request.getParameter("shippingType");

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String shippingAddress = request.getParameter("shippingAddress");

		PaymentType pType = null;
		ShippingType sType = null;
		if (member == null && cart.isEmpty()) {
			errors.add("購物車是空的");
		}
		if (paymentType == null || paymentType.length() == 0) {
			errors.add("必須選擇付款方式");
		} else {
			try {
				pType = PaymentType.valueOf(paymentType);
			} catch (RuntimeException ex) {
				errors.add("付款方式不正確");
			}
		}
		if (shippingType == null || shippingType.length() == 0) {
			errors.add("必須選擇貨運方式");
		} else {
			try {
				sType = ShippingType.valueOf(shippingType);
			} catch (RuntimeException ex) {
				errors.add("貨運方式不正確");
			}
		}
		if (name == null || name.length() == 0) {
			errors.add("必輸輸入姓名");
		}

		if (phone == null || phone.length() == 0) {
			errors.add("必須輸入電話");
		}
		if (email == null || email.length() == 0) {
			errors.add("必須輸入email");
		}
		if (shippingAddress == null || shippingAddress.length() == 0) {
			errors.add("必須輸入收件人地址");
		}
		if (errors.isEmpty()) {
			Order order = new Order();
			try {
				order.setMember(member);
				order.setCreateDate(LocalDate.now());
				order.setCreatTime(LocalTime.now());
				order.setPaymentType(pType);
				order.setPaymentFee(pType.getFee());
				order.setShippingType(sType);
				order.setShippingFee(sType.getFee());
				order.setReceiptName(name);
				order.setReceiptPhone(phone);
				order.setReceiptEmail(email);
				order.setShippingAddres(shippingAddress);

				order.add(cart);
				
				OrderService oService = new OrderService();
				oService.createOrder(order);

				// 3.1 成功redirect至歷史訂單
				session.removeAttribute("cart");
				if (order.getPaymentType() == PaymentType.CARD) {
					request.setAttribute("order", order);
					request.getRequestDispatcher("/WEB-INF/credit_card.jsp").forward(request, response);
					return;
				}
				
				response.sendRedirect("order.jsp?orderId=" + order.getId());
				return;
			} catch (BlackCakeException e) {
				this.log("建立訂單失敗");
				errors.add(e.getMessage());
			} catch (Exception e) {
				this.log("建立訂單失敗發生非預期錯誤", e);
				errors.add("建立訂單發生錯誤:" + e.getMessage());
			}
		}
		// 3.2 errors:forward給check_out.jsp
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("check_out.jsp").forward(request, response);
	}

}
