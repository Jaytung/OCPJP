package uuu.blackcake.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import uuu.blackcake.entity.Outlet;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.Size;
import uuu.blackcake.entity.Spicy;
import uuu.blackcake.exception.BlackCakeException;

class ProductsDAO {
	private static final String SELECT_ALL_PRODUCTS=
			"SELECT id, name, unit_price, stock,"
			+ " photo_url, description, shelf_date,"
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
//				p.setPhotoUrl(rs.getString("photo_url1"));
				p.setDescription(rs.getString("description"));
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
			+ " shelf_date, unit_Discount FROM blackcake.product "
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
//					p.setPhotoUrl(rs.getString("photo_url1"));
					p.setDescription(rs.getString("description"));
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
			+ " shelf_date, unit_Discount, category FROM blackcake.product "
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
	//大小價格查詢
	private static final String SELECT_PRODUCT_BY_ID=
		"SELECT id, name, unit_price,  description, shelf_date, unit_Discount, category, brand, "
		+ "products_sizes.product_id, size_name,  icon_url, "
		+ "products_sizes.size_price AS size_price, "
		+ "products_spicy.spicy_name AS spicy_name,"
		+ "products_spicy.stock AS spicy_stock, "
		+ "product.stock,products_sizes.stock AS size_stock, "
		+ "product.photo_url,products_sizes.photo_url AS photo_url, "
		+ "product.photo_url_1 "
		+ "FROM product "
		+ "	LEFT JOIN products_sizes ON product.id=product_id "
		+ "		LEFT JOIN products_spicy ON product.id=products_spicy.product_id "
		+ "WHERE  id= ?";
	public Product selectProductById(String id)throws BlackCakeException {
		Product p = null;
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
					//讀取第一筆才需要建立Producet物件,並讀取產品資料指派給屬性
					if(p==null) {
						
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
					p.setPhotoUrl1(rs.getString("photo_url_1"));
					p.setDescription(rs.getString("description"));
					p.setShelfDate(LocalDate.parse(rs.getString("shelf_date")));
					p.setCategory(rs.getString("category"));
					}
					
					
					//讀取大小資料並加入產品p中
					String sizeName=rs.getString("size_name");
					if(sizeName!=null) {						
					Size size = new Size();				
					size.setName(sizeName);
					size.setPrice(rs.getInt("size_price"));
					size.setStock(rs.getInt("size_stock"));
					size.setPhotoURL(rs.getString("photo_url"));
					size.setIconURL(rs.getString("icon_url"));
					System.out.println(size);
					p.add(size);
					}
					System.out.println(p);
					
					String spicyName=rs.getString("spicy_name");
					if(spicyName!=null) {
						Spicy spicy = new Spicy();
						spicy.setName(spicyName);
						spicy.setStock(rs.getInt("spicy_stock"));
						System.out.println(spicy);
						p.add(spicy);
					}
				}
			}
		} catch (SQLException e) {
			throw new BlackCakeException("[商品分類查詢]失敗",e);
		}
		return p;
	}
	private static final String SELECT_PRODUCT_REAL_TIME_STOCK="";
	public int selectProductRealTimeStock(int id, String sizeName, String spicyName) {
		//TODO:即時庫存查詢
		return 0;
	}
}
