package uuu.blackcake.entity;

public class Size implements Comparable<Size> {
	private String name;//PKey
	private String photoURL;
	private String iconURL;
	private int stock;
	private int price;
	private int listPrice;
	private int ordinal;
	

	public int getListPrice() {
		return listPrice;
	}

	public void setListPrice(int listPrice) {
		this.listPrice = listPrice;
	}
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Size other = (Size) obj;
		if (name == null) {
			if (other.name != null) {
				return false;
			}
		} else if (!name.equals(other.name)) {
			return false;
		}
		return true;
	}

	public void setName(String name) {
			this.name = name;			
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}
	public String getPhotoURL() {
		return iconURL;
	}
	public void setIconURL(String iconURL) {
		this.iconURL = iconURL;
	}
	public String getIconURL() {
		return iconURL;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public String toString() {
		return this.getClass().getSimpleName()+"大小名稱:"+name+"\n"+"庫存:"+stock+",\n"
		+"photoURL:"+photoURL+"\n"+"iconURL:"+iconURL+"\n"+"Size_price:"+price+"\n 定價:"+listPrice;
	}

	public int getOrdinal() {
		return ordinal;
	}

	public void setOrdinal(int ordinal) {
		this.ordinal = ordinal;
	}

	@Override
	public int compareTo(Size another) {
		return this.ordinal-another.ordinal;
	}
}
