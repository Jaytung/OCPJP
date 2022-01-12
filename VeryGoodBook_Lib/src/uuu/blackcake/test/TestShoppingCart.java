package uuu.blackcake.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.entity.CartItem;
import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.ShoppingCart;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;
import uuu.blackcake.service.ProductService;

public class TestShoppingCart {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		try {
			Customer member = cService.login("jimmy@gmail.com","asd12345");
			Product p1 = pService.selectProductById("1");
			ShoppingCart cart = new ShoppingCart();
			cart.setMember(member);
			cart.addToCart(p1, null, null, 1);
			System.out.println(cart);
			
			Product p5 =pService.selectProductById("5");
			cart.addToCart(p5, "小盒" ,null, 4);
			System.out.println(cart);
			
			
//			quantity1126 4
//			for(CartItem item:cart.getCartItemSet()) {
//				if(String.valueOf(item.hashCode()).equals("1126")){
//
//				String quantity = "12";
//				cart.updateCart(item, Integer.parseInt(quantity));				
//
//				}
//			}
			
			CartItem item = new CartItem();
			item.setProduct(p5);
			item.setSize(p5.getsize("小盒"));
			
			cart.updateCart(item, 10);
			System.out.println(cart);
			
	}catch(BlackCakeException e){
		Logger.getLogger("測試[加入購物車]").log(Level.SEVERE,"加入購物車失敗",e);
	}

}
}
