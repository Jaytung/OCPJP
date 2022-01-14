package uuu.blackcake.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.Set;

public class Order {
	private int id;// Pkey,Auto-Increment
	private LocalDate createDate;// required
	private LocalTime creatTime = LocalTime.now();// required
	private Customer member;// required
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
		return getTotalAmount() + paymentFee + shippingFee;
	}

	public void add(OrderItem Item) {
		orderItemSet.add(Item);
	}

	public void add(ShoppingCart cart) {
		if (cart == null || cart.isEmpty()) {
			throw new IllegalArgumentException("購物車不得為null,或必須有明細");
		} else {
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

	public double getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
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

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public ShippingType getShippingType() {
		return shippingType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public void setShippingType(ShippingType shippingType) {
		this.shippingType = shippingType;
	}

	@Override
	public String toString() {
		return "訂單Order id=" + id + ",\n createDate=" + createDate + ",\n creatTime=" + creatTime + ",\n member="
				+ member + ",\n receiptName=" + receiptName + ",\n receiptEmail=" + receiptEmail + ",\n receiptPhone="
				+ receiptPhone + ",\n shippingAddres=" + shippingAddres + ",\n status=" + status + ",\n paymentType="
				+ paymentType + ",\n paymentFee=" + paymentFee + ",\n paymentNote=" + paymentNote + ",\n shippingType="
				+ shippingType + ",\n shippingFee=" + shippingFee + ",\n shippingNote=" + shippingNote
				+ ",\n orderItemSet=" + orderItemSet + ",\n 項數=" + getSize() + ",\n 件數=" + getTotalQuantity()
				+ ",\n 商品金額=" + getTotalAmount() + ",\n 應付金額=" + getTotalAmountWithFee();
	}

}
