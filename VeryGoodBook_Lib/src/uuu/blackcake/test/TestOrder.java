package uuu.blackcake.test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.entity.CartItem;
import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.entity.PaymentType;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.ShippingType;
import uuu.blackcake.entity.ShoppingCart;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;
import uuu.blackcake.service.OrderService;
import uuu.blackcake.service.ProductService;

public class TestOrder {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		try {
			Customer member = cService.login("jimmy@gmail.com","asd12345");
			Product p1 = pService.selectProductById("1");
			ShoppingCart cart = new ShoppingCart();
			cart.setMember(member);
			cart.addToCart(p1, null, null, 1);
//			System.out.println(cart);
			
			Product p5 =pService.selectProductById("1");
			cart.addToCart(p5,"",null, 3);

			System.out.println(cart);
			System.out.println("**********************************");
			Order order = new Order();
			order.setMember(member);
			order.setCreateDate(LocalDate.now());
			order.setCreatTime(LocalTime.now());
			PaymentType pType = PaymentType.valueOf("STORE");
			order.setPaymentType(pType);
			order.setPaymentFee(pType.getFee());
			ShippingType sType= ShippingType.valueOf("BLACKCAT");
			order.setShippingType(sType);
			order.setShippingFee(sType.getFee());
			order.setReceiptName("Jimmy");
			order.setReceiptEmail("Jimmy@gmail.com");
			order.setReceiptPhone("0988665209");		
			order.setShippingAddres("敦化北路158號");
			
			order.add(cart);
			OrderService oService = new OrderService();
			oService.createOrder(order);
			System.out.println("********************************");
			System.out.println(order);
			
			
//			quantity1126 4
//			for(CartItem item:cart.getCartItemSet()) {
//				if(String.valueOf(item.hashCode()).equals("1126")){
//
//				String quantity = "12";
//				cart.updateCart(item, Integer.parseInt(quantity));				
//
//				}
//			}
//			
//			CartItem item = new CartItem();
//			item.setProduct(p5);
//			item.setSize(p5.getsize("小盒"));
//			
//			cart.updateCart(item, 10);
//			System.out.println(cart);
			
	}catch(BlackCakeException e){
		Logger.getLogger("測試[加入購物車/建立訂單失敗]").log(Level.SEVERE,"加入購物車失敗/建立訂單失敗",e);
	}

}
}
