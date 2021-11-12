package uuu.vgb.entity;

import java.time.LocalDate;

public class Product {
	private int id;// 必要. PKey, auto increment,RW(>0)
	private String name;// 必要, UNIQUE INDEX,RW
	private String size;
	private double unitPrice;// 必要>0,RW
	private int unitDiscount;
	private int stock;// 必要>0,RW
	private String description;
	private LocalDate shelfDate;// 必要,以上架當日為預設值,RW
	private String photoUrl;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		if(id>0) {
			this.id = id;
		}else {
			System.err.println("產品編號必需>0");
			//TODO:第13張 throw Exception
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if(name!=null&&name.length()>=2&&name.length()<=20) {
			this.name = name;			
		}else {
			System.err.println("name必須輸入,且長度在2~20之間");
			//TODO:
		}
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		if(unitPrice>0) {
			this.unitPrice = unitPrice;
		}else {
			System.err.println("輸入價格必需>0");
		}
	}

	public int getUnitDiscount() {
		int discountNum = (100 - unitDiscount);
		if (discountNum % 10 == 0) {
			this.unitDiscount = (discountNum / 10);
		} else {
			this.unitDiscount = discountNum;
		}
		return unitDiscount;
	}

	public void setUnitDiscount(int unitDiscount) {
		if(unitDiscount<0) {
			this.unitDiscount=0;
			System.err.println("輸入折扣必需>0");
		}else {
			this.unitDiscount = unitDiscount;
		}

	}

	public int getStock() {
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

}
