package uuu.blackcake.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private int id;// Pkey,Auto-Increment
	private Customer member;// required
	private LocalDate createDate;// required
	private LocalTime creatTime = LocalTime.now();// required
	private String receiptName;// required
	private String receiptEmail;// required
	private String receiptPhone;// required
	private String shippingAddres;// required
	private int status = 0;// 0:新訂單,1:以轉帳,2:已入帳,3:已出貨
	private PaymentType paymentType;// required
	private double paymentFee;
	private String paymentNote;// optional 付款後才有評價
	private ShippingType shippingType;// required
	private double shippingFee;// required
	private String shippingNote;// optional 出貨後才有評價
	private Set<OrderItem> orderItemSet = new HashSet<>();// required
	private double totalAmount;

	public LocalTime getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(LocalTime creatTime) {
		this.creatTime = creatTime;
	}

	public Set<OrderItem> getOrderItemSet() {
		return new HashSet<>(orderItemSet);
	}

	public Customer getMember() {
		return member;
	}

	public void setMember(Customer member) {
		this.member = member;
	}

	public int getSize() {
		return orderItemSet.size();
	}

	public int getTotalQuantity() {
		int sum = 0;
		for (OrderItem item : orderItemSet) {
			sum += item.getQuantity();
		}
		return sum;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getTotalAmount() {
		if (orderItemSet.size() > 0) {
			double sum = 0;
			for (OrderItem item : orderItemSet) {
				sum += item.getPrice() * item.getQuantity();
			}
			return sum;
		} else {
			return this.totalAmount;
		}
	}

	public double getTotalAmountWithFee() {// TODO:免運上限
		double sum = getTotalAmount();
		sum += paymentFee + shippingFee;
		return Math.round(sum);
	}

	public void add(OrderItem Item) {// for OrdersDAO: 查詢訂單明細後將orderItem記錄在order物件中
		orderItemSet.add(Item);
	}

	public void add(ShoppingCart cart) {
		if (cart == null || cart.isEmpty()) {
			throw new IllegalArgumentException("購物車不得為null,或必須有明細");
		}
		for (CartItem cartItem : cart.getCartItemSet()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setSize(cartItem.getSize());
			orderItem.setSpicy(cartItem.getSpicy());
			orderItem.setPrice(cartItem.getProduct().getUnitPrice());
			orderItem.setQuantity(cart.getQuantity(cartItem));
			orderItemSet.add(orderItem);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

	public String getReceiptName() {
		return receiptName;
	}

	public void setReceiptName(String receiptName) {
		this.receiptName = receiptName;
	}

	public String getReceiptEmail() {
		return receiptEmail;
	}

	public void setReceiptEmail(String receiptEmail) {
		this.receiptEmail = receiptEmail;
	}

	public String getReceiptPhone() {
		return receiptPhone;
	}

	public void setReceiptPhone(String receiptPhone) {
		this.receiptPhone = receiptPhone;
	}

	public String getShippingAddres() {
		return shippingAddres;
	}

	public void setShippingAddres(String shippingAddres) {
		this.shippingAddres = shippingAddres;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getStatusString() {
		return Status.getDescription(status);
	}

	public String getStatusString(int status) {
		return Status.getDescription(status);
	}
	public ShippingType getShippingType() {
		return shippingType;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}
	
	
	public PaymentType getPaymentType() {
		return paymentType;
	}

	public double getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(double paymentFee) {
		this.paymentFee = paymentFee;
	}

	public String getPaymentNote() {
		return paymentNote;
	}

	public void setPaymentNote(String paymentNote) {
		this.paymentNote = paymentNote;
	}

	public String getShippingNote() {
		return shippingNote;
	}

	public void setShippingNote(String shippingNote) {
		this.shippingNote = shippingNote;
	}


	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}

	@Override
	public String toString() {
		return "訂單[編號=" + id + ", 訂購日期時間=" + createDate + " " + creatTime + ", 處理狀態=" + status + ",\n 訂購人=" + member
				+ ",\n 收件人 " + receiptName + "," + receiptEmail + "," + receiptPhone + ",\n 收件地址=" + shippingAddres
				+ ",\n 付款方式與費用=" + paymentType.getDescription() + "," + paymentFee + "元," + ",\n 付款資訊=" + paymentNote
				+ ",\n 收件方式與費用=" + shippingType.getDescription() + "," + shippingFee + "元," + " 出貨資訊=" + shippingNote
				+ ",\n" + orderItemSet + ",\n 共" + getSize() + "項, " + getTotalQuantity() + "件" + ",\n 總金額"
				+ getTotalAmount() + ",\n 總金額(+手續費)=" + getTotalAmountWithFee() + "]";
	}

	public enum Status {
		NEW("新訂單"), TRANSFORED("已轉帳"), PAID("已入帳"),
		SHIPPED("已出貨"), ARRIVED("已到貨"), CHECKED("已簽收"),
		COMPLETE("完結");

		private final String description;

		private Status(String description) {
			this.description = description;
		}

		public String getDescription() {
			return description;
		}

		public static String getDescription(int status) {
			if (status >= 0 && status < values().length)
				return values()[status].getDescription();
			else {
				return String.valueOf(status);
			}
		}
	}

}
