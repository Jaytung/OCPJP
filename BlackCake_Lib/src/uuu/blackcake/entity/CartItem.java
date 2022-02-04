package uuu.blackcake.entity;

import uuu.blackcake.exception.DataInvalidException;


public class CartItem {
	private Product product; //Pkey
	private Size size;	//Pkey
	private Spicy spicy;	//Pkey
//	private String size="";	//Pkey
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public Size getSize() {
		return size;
	}
	
	public void setSize(Size size) {
		this.size = size;
	}
	
	public String getSpicy() {
		return spicy!=null?spicy.getName():"";
	}
	public Spicy getSpicyObj() {
		return spicy;
	}
	
	public void setSpicy(Spicy spicy) {
		this.spicy = spicy;
	}
	
	public double getListPrice() {
		if(size==null) {
			if(product !=null) {
				return product instanceof Outlet?((Outlet)product).getListPrice(): product.getUnitPrice();
			}else {
				throw new DataInvalidException("明細中無產品資料");
			}
		}else {
			return size.getListPrice();
		}
	}
	
	public double getUnitPrice() {
		if(size==null) {
			if(product!=null) {
				return product.getUnitPrice();
			}else {
				throw new DataInvalidException("明細中無產品資料");
			}
		}else {
			return size.getUnitPrice();
		}
	}
	
	public String getDiscountString() {
		if(product instanceof Outlet) {
			return ((Outlet)product).getDiscountString();
		}else {
			return "";
		}
	}
	
	public String getPhotoUrl() {
		if(product != null){
			return product.getPhotoUrl();
		}else {
			throw new DataInvalidException("明細中無產品資料");
		}
	}
	
	public String getSizeName() {
		if(size!=null) {
			return size.getName();
		}else {
			return "";
		}
	}
	
	@Override
	public String toString() {
		return this.getClass().getSimpleName()
				+"[產品=" + product 
				+ ",\n 購買顏色=" + size 
				+ ",\n 購買size=" + spicy + "\n";
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
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		if (product == null) {
			if (other.product != null)
				return false;
		} else if (!product.equals(other.product))
			return false;
		if (size == null) {
			if (other.size != null)
				return false;
		} else if (!size.equals(other.size))
			return false;
		if (spicy == null) {
			if (other.spicy != null)
				return false;
		} else if (!spicy.equals(other.spicy))
			return false;
		return true;
	}
}
