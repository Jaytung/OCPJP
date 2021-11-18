package uuu.AC10.entity;

public interface Flyer {
	
	public static final int i = 0;
	
	abstract void takeOff();
	
	abstract void fly();
	
	public default void land() {
		System.out.println("flyer land");
	};
}
