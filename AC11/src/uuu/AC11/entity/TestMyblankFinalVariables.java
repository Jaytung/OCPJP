package uuu.AC11.entity;

public class TestMyblankFinalVariables {

	public static void main(String[] args) {
		System.out.println(MyBlankFinalVariables.getJ());
		
		MyBlankFinalVariables obj = new MyBlankFinalVariables();
		System.out.println(obj.getI());//100
		
		MyBlankFinalVariables obj2 = new MyBlankFinalVariables(123);
		System.out.println(obj2.getI());//123
		
		final int k;
		System.out.println(k=100);
		//k=100; //compile-time error
		
		System.out.println(Math.PI);
		System.out.println(Math.E);
	}

}
