package uuu.blackcake.entity;

public class Spicy {
	private int id;//Pkey
	private String name;
	private int stock;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
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
		Spicy other = (Spicy) obj;
		if (id != other.id) {
			return false;
		}
		return true;
	}
	@Override
	public String toString() {
		return "辣度 [產品ID:" + id + ",\n 辣度:" + name + ",\n 辣度庫存:" + stock + "]";
	}
}
