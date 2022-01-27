package uuu.blackcake.entity;

public enum ShippingType {
	SHOP("門市取貨",0),
	STORE("超商取貨", 60),
	HOME("黑貓宅急便", 100);
	
	private final String description;
	private final double fee;
	
	public String getShippingName() {
		return description;
	}

	public double getFee() {
		return fee;
	}
	public String getDescription() {
		return description;
	}
	
	private ShippingType(String shippingName, double fee) {
		this.description = shippingName;
		this.fee = fee;
	}

	@Override
	public String toString() {
		return description+(fee>0?","+fee+"元":"");
	}
	
}
