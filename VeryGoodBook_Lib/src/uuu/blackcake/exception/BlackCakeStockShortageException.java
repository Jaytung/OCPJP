package uuu.blackcake.exception;

import uuu.blackcake.entity.OrderItem;

public class BlackCakeStockShortageException extends BlackCakeException {
	private final OrderItem item;
	
	public BlackCakeStockShortageException(OrderItem item) {
		super("庫存不足");
		this.item= item;
	}

	public BlackCakeStockShortageException(OrderItem item, Throwable cause) {
		super("庫存不足", cause);
		this.item= item;
	}

	public OrderItem getOrderItem() {
		return item;
	}

	@Override
	public String toString() {
		return super.toString()
				+"\n[item=" + item + "]";
	}
}
