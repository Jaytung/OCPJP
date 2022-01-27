package uuu.blackcake.entity;

public class VIP extends Customer {
	private int discount=5;//5% off, 1~90% off

	public VIP() {
		super();
	}

	public VIP(String id, String name, String password, String email) {
		super(id, name, password, email);
	}

	public VIP(String id, String name, String password, int discount) {
		super(id, name, password);
		this.setDiscount(discount);
	}
	
	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		if(discount >=1 && discount<100) {
			this.discount = discount;
		}else {
			System.err.println("discount不正確");
		}	
	}
	

	public String getDiscountString() {
		int discountNum = (100 - this.discount);
		if (discountNum % 10 == 0) {
			discountNum = (discountNum / 10);
		}
		return discountNum+"折";
	}

	public void setUnitDiscount(int unitDiscount) {
		if(unitDiscount<0) {
			this.discount=0;
			System.err.println("輸入折扣必需>0");
		}else {
			this.discount = unitDiscount;
		}

	}

	@Override
	public String toString() {
		return super.toString()+"\n"
				+"VIP [product discount:" + getDiscount() +"% off"
				+ ",折扣= "+ getDiscountString()+"]";
	}
	
	
	
}
