package uuu.blackcake.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.ProductService;

public class TestProductService_getProductById {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			System.out.print(pService.selectProductByName("黑糖糕"));
		}catch(BlackCakeException e){
			Logger.getLogger("產品測試查詢").log(
			Level.SEVERE,e.getMessage(),e);
		}
	}
}
