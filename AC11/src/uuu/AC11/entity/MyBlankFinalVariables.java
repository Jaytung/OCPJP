package uuu.AC11.entity;

public class MyBlankFinalVariables {
	private final int i;//black final non-static attribute
	private final static int j;
	
	static {
		j=Integer.getInteger("mydata", 789);
	}
	
	public MyBlankFinalVariables() {
		this(100);
	}
	
	public MyBlankFinalVariables(int i) {
		this.i = i;
	}

	public static int getJ() {
		return j;
	}

	public int getI() {
		return i;
	}
	
}
