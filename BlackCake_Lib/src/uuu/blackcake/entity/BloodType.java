package uuu.blackcake.entity;

public enum BloodType {
	O,A,B,AB;
	
	private BloodType() {}

	@Override
	public String toString() {
		return super.toString()+"型,"+"ordinal:"+ordinal();
	}
}

