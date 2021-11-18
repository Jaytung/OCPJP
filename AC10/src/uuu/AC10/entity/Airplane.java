package uuu.AC10.entity;

public class Airplane extends Vehicle implements Flyer {
	
	

	public Airplane() {
		super();
	}
	public Airplane(double MAX_LOAD) {
		super(MAX_LOAD);
	}
	@Override
	public double calculateCostByMonth(int year, int month) {
		return 0;
	}
	@Override
	public void takeOff() {
		System.out.println("take off");
	}
	@Override
	public void fly() {
		System.out.println("fly");
	}

}
