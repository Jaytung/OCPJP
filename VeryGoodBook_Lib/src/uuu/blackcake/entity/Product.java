package uuu.blackcake.entity;

import java.time.LocalDate;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Product {
	private int id;// 必要. PKey, auto increment,RW(>0)
	private String name;// 必要, UNIQUE INDEX,RW
	private double unitPrice;// 必要>0,RW
	private int stock;// 必要>0,RW
	private String description;
	private LocalDate shelfDate;// 必要,以上架當日為預設值,RW
	private String photoUrl;
	private String photoUrl1;

	private String category;
	private Map<String,Size> sizeMap=new HashMap<>();
	
	
	//accessors(getter)for sizeMap
	public Size getsize(String sizeName) {
		if(sizeName==null)
			throw new IllegalArgumentException("產品大小不得為null");		
		
		Size size = sizeMap.get(sizeName);
		//TODO:加檢查
		
		return size;
	}
	
	//mutators(setter)for sizeMap
	public void add(Size size) {
		if(size==null||size.getName()==null) 
			throw new IllegalArgumentException("產品大小不得為null");
		sizeMap.put(size.getName(), size);
	}
	
	
	public int getSizeMapSize() {
		return sizeMap.size();
	}

	public boolean isSizeMapEmpty() {
		return sizeMap.isEmpty();
	}

	public Collection<Size> getSizes() {
		return sizeMap.values();
	}

	public Product() {
		// super();
	}

	public Product(int id, String name, double unitPrice) {
		// super();
		this.setId(id);
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public Product(int id, String name, double unitPrice, int stock) {
		super();
		this.id = id;
		this.name = name;
		this.unitPrice = unitPrice;
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
		Product other = (Product) obj;
		if (id != other.id) {
			return false;
		}
		return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		if (id > 0) {
			this.id = id;
		} else {
			System.err.println("產品編號必需>0");
			// TODO:第13張 throw Exception
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if (name != null && name.length() >= 2 && name.length() <= 20) {
			this.name = name;
		} else {
			System.err.println("name必須輸入,且長度在2~20之間");
			// TODO:
		}
	}


	/**
	 * //查售價及定價
	 * 
	 * @return
	 */
	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		if (unitPrice > 0) {
			this.unitPrice = unitPrice;
		} else {
			System.err.println("輸入價格必需>0");
		}
	}

	public int getStock() {
		if(sizeMap!=null&&sizeMap.size()>0) {
			int sum = 0;
			for(Size size:sizeMap.values()) {
				sum+=size.getStock();
			}
			return sum;
		}
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getShelfDate() {
		return shelfDate;
	}

	public void setShelfDate(LocalDate shelfDate) {
		this.shelfDate = shelfDate;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getPhotoUrl1() {
		return photoUrl1;
	}

	public void setPhotoUrl1(String photoUrl1) {
		this.photoUrl1 = photoUrl1;
	}

	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return this.getClass().getName() + "\n" + "Product id=" + id + "\n" + "name=" + name + "\n"
		+ "size=" + "\n" + "unitPrice=" + unitPrice + "\n" + "on sale: " + "% off\n" 
		+ "stock=" + stock+ "\n" + "description=" + description + "\n" + "shelfDate=" + shelfDate 
		+ "\n" + "photoUrl=" + photoUrl + "\n"+"Category ="+category+ "\n"+"SizeMap:"+sizeMap;
	}


}
