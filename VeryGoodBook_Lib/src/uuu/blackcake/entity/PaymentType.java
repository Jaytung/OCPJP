package uuu.blackcake.entity;

public enum PaymentType {
	SHOP("門市付款",0),
	ATM("ATM轉帳",0),
	STORE("超商付款",30),
	HOME("貨到付款",80);
	
	private final String paymentName;
	private final double fee;
	
	public String getPaymentName() {
		return paymentName;
	}

	public double getFee() {
		return fee;	
	}
	
	private PaymentType(String paymentName, double fee) {
		this.paymentName = paymentName;
		this.fee = fee;
	}

	@Override
	public String toString() {
		return paymentName+(fee>0?","+fee+"元":"0"+"元");
	}
	
}
