package uuu.vgb.entity;

import java.time.LocalDate;

public class Customer {

	public String id;// ROC ID,PKey
	public String name;// required,2~20字元
	public String email;// required,須符合Email格式
	public String password;// required,6-20字元
	public LocalDate birthday;// required,須年滿12歲
	public char gender;// M男, F女, O其他

	public String address = "";//
	public String phone = "";//
	public boolean subscribed = false;//

	/**
	 * 計算客戶年齡
	 * 
	 * @return int型態的顧客年齡
	 */
	public int getAge() {
		// 計算客戶年齡
		int thisYear = LocalDate.now().getYear();// 2021
		if (this.birthday != null) {
			
			
			int birthYear = this.birthday.getYear();// 2000//this抓自己類別中的屬性
			int age = thisYear - birthYear;
			return age;
		}else
			return -1;
			//TODO:第13張 throw exception物件
	}
	
	public void setBirthday(String date) {
		this.birthday=LocalDate.parse(date);
	}

	public void setBirthday(int year, int month, int day) {
		this.birthday=LocalDate.of(year, month, day);
	}

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
//		return(id+name+email+password);
//	}
}
