package uuu.blackcake.entity;

import uuu.blackcake.exception.DataInvalidException;

public class Size {
	private String name;//PKey
	private String photoURL;
	private String iconURL;
	private int stock;
	
	public String getName() {
		return name;
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
		return this.getClass().getSimpleName()+"大小名稱:"+name+"\n"+"庫存:"+stock+"\n"
		+"photoURL:"+photoURL+"\n"+"iconURL:"+iconURL;
	}
}
