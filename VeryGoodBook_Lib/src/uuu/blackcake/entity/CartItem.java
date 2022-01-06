package uuu.blackcake.entity;

public class CartItem {
	private Product product;//Pkey
	private Size size;//Pkey
	private String Spicy="";//Pkey
	
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
		result = prime * result + ((Spicy == null) ? 0 : Spicy.hashCode());
		result = prime * result + ((product == null) ? 0 : product.hashCode());
		result = prime * result + ((size == null) ? 0 : size.hashCode());
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
		if (Spicy == null) {
			if (other.Spicy != null) {
				return false;
			}
		} else if (!Spicy.equals(other.Spicy)) {
			return false;
		}
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
		return true;
	}
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	public String getSpicy() {
		return Spicy;
	}
	public void setSpicy(String spicy) {
		Spicy = spicy;
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName()+ "CartItem: \n product=" + product + ", \n Spicy=" + Spicy;
	}
}
