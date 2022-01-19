package uuu.blackcake.exception;

import uuu.blackcake.entity.OrderItem;

public class BlackCakeStockShortage extends BlackCakeException {
	private final OrderItem item;

	public BlackCakeStockShortage(OrderItem item) {
		super("庫存不足");
		this.item=item;
	}

	public BlackCakeStockShortage(OrderItem item, Throwable cause) {
		super("庫存不足", cause);
		this.item=item;
	}

	public OrderItem getItem() {
		return item;
	}

}
