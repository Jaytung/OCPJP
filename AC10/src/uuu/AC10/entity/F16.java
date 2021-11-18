package uuu.AC10.entity;

public class F16 extends Vehicle implements Flyer ,Fighter {

	@Override
	public void fight() {
		System.out.println("F16作戰中");
	}

	@Override
	public void takeOff() {
		System.out.println("F16降落");
	}

	public F16() {
		super();
	}

	public F16(double MAX_LOAD) {
		super(MAX_LOAD);
	}

	@Override
	public void fly() {
		System.out.println("F16飛行中");
	}

	@Override
	public double calculateCostByMonth(int year, int month) {
		return 300000;
	}

}
