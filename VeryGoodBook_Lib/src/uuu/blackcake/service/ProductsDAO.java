package uuu.blackcake.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Result;

import uuu.blackcake.entity.Outlet;
import uuu.blackcake.entity.Product;
import uuu.blackcake.exception.BlackCakeException;

class ProductsDAO {
	private static final String SELECT_ALL_PRODUCTS=
			"SELECT id, name, unit_price, stock,"
			+ " photo_url, description, size, shelf_date,"
			+ " unit_Discount FROM blackcake.product";
	List<Product> selsectAllProducts() throws BlackCakeException {
		List<Product> list= new ArrayList<>();
		
		try(
			Connection connection = RDBConnection.getConnection();//1,2.取得連線
			PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_PRODUCTS);//3.準備連線	
			ResultSet rs = pstmt.executeQuery();//4.執行指令
			) {
			while(rs.next()) {
				Product p;
				int unitDiscount =rs.getInt("unit_Discount");
				if(unitDiscount>0) {
					p = new Outlet();
					((Outlet)p).setUnitDiscount(unitDiscount);
				}else {
					p=new Product();
				}
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setUnitPrice(rs.getDouble("unit_price"));
				p.setStock(rs.getInt("stock"));
				p.setPhotoUrl(rs.getString("photo_url"));
				p.setDescription(rs.getString("description"));
				p.setSize(rs.getString("size"));
				p.setShelfDate(LocalDate.parse(rs.getString("shelf_date")));
				
				list.add(p);
			}
		} catch (SQLException e) {
			throw new BlackCakeException("[查詢全部產品]失敗",e);
		}
		return list;
	}
	private static final String SELECT_PRODUCT_BY_NAME=
			"SELECT id, name, unit_price, stock, photo_url, description,"
			+ " size, shelf_date, unit_Discount FROM blackcake.product "
			+ "WHERE name LIKE ?";
	public List<Product> selectProductByName(String keyWord)throws BlackCakeException {
		List<Product> list = new ArrayList<>();
		try(
				Connection connection = RDBConnection.getConnection();//1,2.取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_NAME);//3.準備連線
				
				) {
			//3.1傳入?的值
			pstmt.setString(1, '%'+keyWord+'%');
			//4.
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令					
				) {	
				while(rs.next()) {
					Product p;
					int unitDiscount =rs.getInt("unit_Discount");
					if(unitDiscount>0) {
						p = new Outlet();
						((Outlet)p).setUnitDiscount(unitDiscount);
					}else {
						p=new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setSize(rs.getString("size"));
					p.setShelfDate(LocalDate.parse(rs.getString("shelf_date")));
					
					list.add(p);
				}
			}
		} catch (SQLException e) {
			throw new BlackCakeException("[關鍵字查詢產品]失敗",e);
		}
		return list;
	}
	
	private static final String SELECT_PRODUCT_BY_CATEGORY=
			"SELECT id, name, unit_price, stock, photo_url, description,"
			+ " size, shelf_date, unit_Discount, category FROM blackcake.product "
			+ "WHERE category LIKE ?";
	public List<Product> selectProductByCategory(String category)throws BlackCakeException {
		List<Product> list = new ArrayList<>();
		try(
				Connection connection = RDBConnection.getConnection();//1,2.取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_CATEGORY);//3.準備連線
				
				) {
			//3.1傳入?的值
			pstmt.setString(1,category);
			//4.
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令					
				) {	
				while(rs.next()) {
					Product p;
					int unitDiscount =rs.getInt("unit_Discount");
					if(unitDiscount>0) {
						p = new Outlet();
						((Outlet)p).setUnitDiscount(unitDiscount);
					}else {
						p=new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setSize(rs.getString("size"));
					p.setShelfDate(LocalDate.parse(rs.getString("shelf_date")));
					p.setCategory(rs.getString("category"));
					list.add(p);
				}
			}
		} catch (SQLException e) {
			throw new BlackCakeException("[商品分類查詢]失敗",e);
		}
		return list;
	}
	private static final String SELECT_PRODUCT_BY_ID=
		"SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,\r\n"
		+ "product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock\r\n"
		+ "FROM product LEFT JOIN products_sizes ON id=product_id\r\n"
		+ "WHERE  id= ?";
	public Product selectProductById(String id)throws BlackCakeException {
		Product p = new Product();
		try(
				Connection connection = RDBConnection.getConnection();//1,2.取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_PRODUCT_BY_ID);//3.準備連線
				
				) {
			//3.1傳入?的值
			pstmt.setString(1,id);
			//4.
			try(
					ResultSet rs = pstmt.executeQuery();//4.執行指令					
				) {	
				while(rs.next()) {
					int unitDiscount =rs.getInt("unit_Discount");
					if(unitDiscount>0) {
						p = new Outlet();
						((Outlet)p).setUnitDiscount(unitDiscount);
					}else {
						p=new Product();
					}
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setUnitPrice(rs.getDouble("unit_price"));
					p.setStock(rs.getInt("stock"));
					p.setPhotoUrl(rs.getString("photo_url"));
					p.setDescription(rs.getString("description"));
					p.setSize(rs.getString("size"));
					p.setShelfDate(LocalDate.parse(rs.getString("shelf_date")));
					p.setCategory(rs.getString("category"));
					
					System.out.println(rs.getString("size_name"));
					System.out.println(rs.getString("product.stock"));
					System.out.println(rs.getString("product.photo_url"));
					System.out.println(rs.getString("icon_url"));
				}
			}
		} catch (SQLException e) {
			throw new BlackCakeException("[商品分類查詢]失敗",e);
		}
		return p;
	}
}
