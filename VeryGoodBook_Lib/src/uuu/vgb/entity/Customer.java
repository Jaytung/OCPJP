package uuu.vgb.entity;

import java.time.LocalDate;

public class Customer {

	public String id;//ROC ID,PKey
	public String name;//required,2~20字元
	public String email;//required,須符合Email格式
	public String password;//required,6-20字元
	public LocalDate birthday;//required,須年滿12歲
	public char gender;//M男, F女, O其他
	
	public String address="";//
	public String phone="";//
	public boolean subscribed=true;//
	
	
//	public void test() {
//		id="A123123123";
//		name = "Henry";
//		email = "www@gmail.com.tw";
//		password = "123456789";
//		gender='M';
//	}
	
//	public int getAge() {
//		return birthday; 
//	}

//	public String toString() {
//		return(id+name+email+pasw);
//	}
}
