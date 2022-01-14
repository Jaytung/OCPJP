package uuu.blackcake.entity;

public class OrderItem {
	private Product product;//Pkey
	private Size size;//Pkey
	private String spicy;//Pkey
	private double price;//交易價
	private int quantity;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Size getSize() {
		return size;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((size == null) ? 0 : size.hashCode());
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
		OrderItem other = (OrderItem) obj;
		if (product == null) {
			if (other.product != null) {
				return false;
			}
		} else if (!product.equals(other.product)) {
			return false;
		}
		if (size == null) {
			if (other.size != null) {
				return false;
			}
		} else if (!size.equals(other.size)) {
			return false;
		}
		if (spicy == null) {
			if (other.spicy != null) {
				return false;
			}
		} else if (!spicy.equals(other.spicy)) {
			return false;
		}
		return true;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	public String getSpicy() {
		return spicy;
	}
	public void setSpicy(String spicy) {
		this.spicy = spicy;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "訂單明細 訂購產品=" + product + 
				",\n 訂購size=" + size + 
				",\n 訂購spicy=" + spicy + 
				",\n 交易價price=" + price +
				",\n 數量quantity=" + quantity;
	}

}
