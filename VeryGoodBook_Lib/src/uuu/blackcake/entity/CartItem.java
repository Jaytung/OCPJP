package uuu.blackcake.entity;

import uuu.blackcake.exception.DataInvalidException;

public class CartItem {
	private Product product;//Pkey
	private Size size;//Pkey
	private Spicy spicy;//Pkey
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((spicy == null) ? 0 : spicy.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		CartItem other = (CartItem) obj;
		if (spicy == null) {
			if (other.spicy != null) {
				return false;
			}
		} else if (!spicy.equals(other.spicy)) {
			return false;
		}
		return true;
	}
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	public Spicy getSpicy() {
		return spicy;
	}
	public void setSpicy(Spicy spicy) {
		this.spicy = spicy;
	}
	public double getListPirce() {
		if(size==null) {
			if(product!=null) {
				return product.getUnitPrice();
			}else {
				throw new DataInvalidException("明細中查無資料");
			}
		}else {
			return size.getPrice();
		}
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName()+ "CartItem: \n product=" + product + ", \n Spicy=" + spicy;
	}
}
