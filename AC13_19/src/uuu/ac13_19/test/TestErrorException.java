package uuu.ac13_19.test;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

public class TestErrorException {
	private static int i =3;
	public static void main(String[] args) {
		//Error:不正確的recursive造成StackOverFlowError
		if(i>0||args!= null) {
			System.out.println(i--);
			main(null);			
		}else {
			System.out.println("結束");
		}
//		
		//Exception:
		//RuntimeExecption:
//		int j =1/i; //當i==0時,會發生ArithmeticException(Unchecked Exception)
		
		String s = "123.4";
		int k = Integer.parseInt(s="1234");//當s字串不是整數時,會發生NumberFormatException(Unchecked Exception)
		System.out.println("k:"+k);
		try {
			LocalDate date = LocalDate.parse(s);//當s字串不符合iso-8601日期格式時,會發生DateTimeParseException(Unchecked Exception)
			System.out.println("date: "+date);
		}catch(DateTimeParseException e){
			System.err.println("日期格式不符合ISO8601:"+e);
		}
		s="1999/01/12";
		
//		//check Exception
//			try{
//			java.util.Date date1 = new java.text.SimpleDateFormat("yyyy/mm/dd").parse(s);
//		}catch(ParseException e) {
//			System.err.println("日期格式不正確");
//		}
		
	}
	

}
