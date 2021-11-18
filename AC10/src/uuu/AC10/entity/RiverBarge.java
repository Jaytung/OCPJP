package uuu.AC10.entity;

public class RiverBarge extends Vehicle {
	

	public RiverBarge() {
		super();
	}

	public RiverBarge(double MAX_LOAD) {
		super(MAX_LOAD);
	}
//	/**
//	 * @deprecated 該功能停用
//	 */
//	@Deprecated
//	@Override
	public double calculateCostByMonth(int year, int month) {
		return 200000;
		
		//throw new UnsupportedOperationException("該功能不支援");
	}
	
}
