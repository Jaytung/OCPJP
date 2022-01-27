package uuu.blackcake.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class ShoppingCart {
	private Customer member;
	private Map<CartItem,Integer> cartMap = new HashMap<>();

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}

	//accessor 可用Delegate method產生
	public int size() {
		return cartMap.size();
	}

	public boolean isEmpty() {//可用size()==0來代替此方法
		return cartMap.isEmpty();
	}

	public Set<CartItem> getCartItemSet() {//回傳集合元件時不得原本的參考,必須回傳複本物件
		
		return new HashSet<>(cartMap.keySet());
	}
	
	

//	public Collection<Integer> values() {
//		return cartMap.values();
//	}
	public Integer getQuantity(CartItem item) {
		return cartMap.get(item);
	}
	
	//mutator
	public void addToCart(Product product, String sizeName, String spicyName, int quantity) {
		if(product==null)
			throw new IllegalArgumentException("加入購物車產品不得為null");
		
		Size size =null;
		if(sizeName!=null&& sizeName.length()>0) {
			size = product.getsize(sizeName);
		}
		//TODO:檢查前端傳入sizeName與後端產品的清單對應是否正確
//		else if() {...}
		Spicy spicy = null;
		if(spicyName!=null&&spicyName.length()>0){
			spicy = product.getspicy(spicyName);
		}
		
		if(quantity<=0) throw new IllegalArgumentException("加入購物車數量不能小於1");
		CartItem item = new CartItem();
		item.setProduct(product);
		item.setSize(size);
		item.setSpicy(spicy);
		
		//找出之前是否加入相同的(product,sizeName,size)產品的數量
		Integer oldQuantity=cartMap.get(item);
		if(oldQuantity!=null) {
			quantity+=oldQuantity;
		}
		cartMap.put(item, quantity);
		
	}
	
	public void updateCart(CartItem item,int quantity) {
		if(item==null)throw new IllegalArgumentException("購物車item不得為null");
		//找出之前是否加入相同的(product,colorName,size)產品的數量
		Integer oldQuantity = cartMap.get(item);
		if(oldQuantity!=null) {
			cartMap.put(item, quantity);			
		}
	}
	
	public void remove(CartItem item) {
		cartMap.remove(item);
	}

	public int getTotalQuantity() {
		int sum=0;
		for(Integer quantity:cartMap.values()) {
			if(quantity!=null) {
				sum+=quantity;
			}
		}
		return sum;
	}
	public double getTotalAmount() {
		double sum =0;
		for(CartItem item:cartMap.keySet()) {
//			double sizePrice = item.getSize().getPrice();
			double price = item.getUnitPrice();
			Integer qty = cartMap.get(item);
			if(qty!=null)sum= sum+price*qty;
		}
		return sum;
	}
	
	public int getTotalAmountTest() {
		int sum=0;
//		Collection<Integer>values=cartMap.values();
//		Iterator<Integer> iterator = values.iterator();
//		while(iterator.hasNext()) {
		for(Integer quantity:cartMap.values()) {
//			Integer quantity = iterator.next();
			if(quantity!=null) {
				sum+=quantity;
			}
		}
		return sum;
	}
	
	
	/**
	 * 
	 * @param p是polymorphic argument(實體為Product或Outlet,...物件)
	 * @param color
	 * @param size
	 * @param quantity
	 */
	//access{s}for cartMap:可用delegate Method來加入
	public void add(Product p, String color, String size, int quantity) {
		//TODO:
	}
	
	@Override
	public String toString() {
		return "購物車 訂購人=" + member
				+ "\n 購物車內容=" + cartMap
				+"\n 共"+size()+"項"
				+"\n 有"+getTotalQuantity()+"件"
				+ "\n 總金額"+ getTotalAmount() ;
	}
}
