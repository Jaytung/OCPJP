package uuu.AC11.entity;

public class MyStatic {
	private static int i;//static attribute,class attribute
	private int j;//non-static attribute,object attribute,instance attribute
	
	static {
		i=Integer.getInteger("mydata", 123);
	}

	public MyStatic() {};
	
	public MyStatic(int i, int j) {
		this.i = i;
		this.j = j;
	}
	public static int getI() {
		return i;
	}
	public static void setI(int i) {
		MyStatic.i = i;
	}
	public int getJ() {
		return j+this.j;
	}
	public void setJ(int j) {
		this.j = j;
	}
}

