package uuu.vgb.entity;

public class VIP extends Customer {
	private int discount;

	public int getDiscount() {
		return discount;
	}

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

	public void setDiscount(int discount) {
		if(discount >=2 && discount<100) {
			this.discount = discount;
		}else {
			System.out.println("discount不正確");
		}	
	}
	
	public String getDiscountString() {
		return getUnitDiscount() +"折";
	}

	public int getUnitDiscount() {
		int discountNum = (100 - discount);
		if (discountNum % 10 == 0) {
			this.discount = (discountNum / 10);
		}else {
			this.discount = discountNum;
		}return discount;
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
				+ ",折扣= "+ getUnitDiscount() + "折]";
	}
	
	
	
}
