package uuu.blackcake.entity;

public class Outlet extends Product {
	
	private int unitDiscount;

	public Outlet() {
		super();
	}
	
	public Outlet(int id, String name, double unitPrice) {
		super(id, name, unitPrice);
	}
	
	public Outlet(int id, String name, double unitPrice, int stock) {
		super(id, name, unitPrice, stock);
	}
	
	
	/**
	 * 
	 * @param id
	 * @param name
	 * @param unitPrice
	 * @param stock:庫存
	 * @param discount:折扣
	 */
	public Outlet(int id, String name, double unitPrice, int stock,int unitDiscount) {
		super(id, name, unitPrice, stock);
		this.setUnitDiscount(unitDiscount);
	}

	public int getUnitDiscount() {
		return unitDiscount;
	}

	public void setUnitDiscount(int unitDiscount) {
		this.unitDiscount = unitDiscount;
	}
	
	public String getDiscountString() {//10% off:9折,15% off:85折
		int discount = 100-this.unitDiscount;
		if (discount%10==0) {
			discount = discount/10;
		}
		
		return discount+"折"; 
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + unitDiscount;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Outlet other = (Outlet) obj;
		if (unitDiscount != other.unitDiscount) {
			return false;
		}
		return true;
	}

	

	// 不能接使用Superclass的getUnitPrice,要將父類的unitPrice改為protected,
	// 以便子類讀取
	// 用overriding method來查售價
	/**
	 * //查售價
	 * 
	 * @return 折扣後的售價
	 */

	@Override
	public double getUnitPrice() {
		return super.getUnitPrice() * (100D - unitDiscount) / 100;
	}

	/**
	 * 查定價
	 * 
	 * @return折扣前的訂價
	 */
	public double getListPrice() {
		return super.getUnitPrice();
	}
	
	@Override
	public String toString() {
		return  super.toString() 
				+"\n"+"折扣:" + unitDiscount + "% off," + getDiscountString() 
				+ " 售價: "+ getUnitPrice();
	}

}

