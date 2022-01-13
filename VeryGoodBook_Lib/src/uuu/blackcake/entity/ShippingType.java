package uuu.blackcake.entity;

public enum ShippingType {
	BLACKCAKT("黑貓宅急便",80),
	SEVENELEVEN("7-11",60),
	HILIFE("萊爾富",50),
	OK("OK Mart",45),
	FAMILY("全家",60);
	
	private final String shippingName;
	private final double fee;
	
	public String getShippingName() {
		return shippingName;
	}

	public double getFee() {
		return fee;
	}
	
	private ShippingType(String shippingName, double fee) {
		this.shippingName = shippingName;
		this.fee = fee;
	}

	@Override
	public String toString() {
		return shippingName+(fee>0?","+fee+"元":"");
	}
	
}
