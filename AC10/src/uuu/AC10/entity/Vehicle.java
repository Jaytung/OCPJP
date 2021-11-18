package uuu.AC10.entity;

public abstract class Vehicle {

	private double MAX_LOAD;
	private double load;
	
	public Vehicle() {
		super();
	}

	public Vehicle(double MAX_LOAD) {
		this.MAX_LOAD=MAX_LOAD;
	}

	public double getLoad() {
		return load;
	}

	public void setLoad(double load) {
		if(load<=MAX_LOAD) {
			this.load=load;
		}else {
			System.err.println("過重:"+MAX_LOAD);			
		}
	}


	public double getMAX_LOAD() {
		return MAX_LOAD;
	}
	
	public abstract double calculateCostByMonth(int year , int month);

}