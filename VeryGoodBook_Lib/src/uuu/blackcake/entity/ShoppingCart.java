package uuu.blackcake.entity;

public class ShoppingCart {
	private Customer member;

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}
	/**
	 * 
	 * @param p是polymorphic argument(實體為Product或Outlet,...物件)
	 * @param color
	 * @param size
	 * @param quantity
	 */
	public void add(Product p, String color, String size, int quantity) {
		//TODO:
	}
	
	public double totalAmount() {
		double sum=0;
		if(member instanceof VIP) {
		
		}
		return sum;
	}
}
