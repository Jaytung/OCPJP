package uuu.blackcake.test;

import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.Size;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.ProductService;

public class TestProductService_getProductByID {

	public static void main(String[] args) {
		ProductService pService = new ProductService();
		try {
			Product p = pService.selectProductById("5");
			System.out.println(p);
			
			System.out.println(p.getSize());
			
			Collection<Size> collection = p.getSizes();
			System.out.println(collection);
			
			if(p.getSizeMapSize()>0) {
				for(Size size:collection) {
					System.out.println(size);
				}
			}
//最好不要在ProductDAO之外用產品的加入顏色
//			Size large = new Size();
//			large.setName("中");
//			p.add(large);
			System.out.println(p.getSize());
		}catch(BlackCakeException e){
			Logger.getLogger("產品測試查詢").log(
			Level.SEVERE,e.getMessage(),e);
		}
	}
}
