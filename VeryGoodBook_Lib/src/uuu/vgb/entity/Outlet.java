package uuu.vgb.entity;

public class Outlet extends Product {
	
	private int discount;

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
	public Outlet(int id, String name, double unitPrice, int stock,int discount) {
		super(id, name, unitPrice, stock);
		this.discount=discount;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public int hashCode() {
		return super.hashCode();
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
		return super.getUnitPrice() * (100 - this.getUnitDiscount()) / 100;
	}

	/**
	 * 查定價
	 * 
	 * @return折扣前的訂價
	 */
	public double getListPrice() {
		return super.getUnitPrice();
	}

}
