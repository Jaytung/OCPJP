package uuu.blackcake.service;

import java.util.List;

import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.Size;
import uuu.blackcake.entity.Spicy;
import uuu.blackcake.exception.BlackCakeException;


public class ProductService {
	private ProductsDAO dao = new ProductsDAO();

	public List<Product> getAllProducts() throws BlackCakeException {
		return dao.selsectAllProducts();
	}

	public List<Product> selectProductByName(String keyWord) throws BlackCakeException {
		return dao.selectProductByName(keyWord);
	}

	public List<Product> selectProductByCategory(String category) throws BlackCakeException {
		return dao.selectProductByCategory(category);
	}

	public Product selectProductById(String id) throws BlackCakeException {
		return dao.selectProductById(id);
	}

	public int getProductStock(Product p, Size size, String spicyName) throws BlackCakeException {
		String sizeName = size != null ? size.getName() : "";
		if(spicyName==null)spicyName="";
		return dao.selectProductRealTimeStock(p.getId(), sizeName, spicyName);
	}
}
