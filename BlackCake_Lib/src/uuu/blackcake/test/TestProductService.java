package uuu.blackcake.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.ProductService;

public class TestProductService {

	public static void main(String[] args) {
//		ProductService pService = new ProductService();
//		try {
//			System.out.print(pService.getAllProducts());
//		}catch(BlackCakeException e){
//			Logger.getLogger("產品測試查詢").log(
//			Level.SEVERE,e.getMessage(),e);
//		}
		ProductService pService = new ProductService();
		try {
			System.out.print(pService.selectProductByCategory("糕點"));
		}catch(BlackCakeException e){
			Logger.getLogger("產品測試查詢").log(
			Level.SEVERE,e.getMessage(),e);
		}
//		ProductService pService = new ProductService();
//		try {
//			System.out.print(pService.selectProductByCategory());
//		}catch(BlackCakeException e){
//			Logger.getLogger("產品測試查詢").log(
//			Level.SEVERE,e.getMessage(),e);
//		}
	}
}