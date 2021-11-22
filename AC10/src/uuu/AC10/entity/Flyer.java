package uuu.AC10.entity;

public interface Flyer {
	
	public static final int i = 0;
	
	void takeOff();
	
	void fly();
	
	public default void land() {
		System.out.println("flyer land");
	};
}
