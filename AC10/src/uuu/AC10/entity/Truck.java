package uuu.AC10.entity;

public class Truck extends Vehicle {

	public Truck() {
		super();
	}

	public Truck(double MAX_LOAD) {
		super(MAX_LOAD);
	}

	@Override
	public double calculateCostByMonth(int year, int month) {
		return 120000;
	}
	
	
}

