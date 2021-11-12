package uuu.vgb.entity;

import java.time.LocalDate;
import java.time.Period;

public class Customer {

	private String id;// ROC ID,PKey
	private String name;// required,2~20字元
	private String email;// required,須符合Email格式
	private String password;// required,6-20字元
	private LocalDate birthday;// required,須年滿12歲 iso8601格式
	private char gender;// M男, F女, O其他
	private String address = "";//
	private String phone = "";//
	private boolean subscribed = false;//

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		if (email != null && email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
			this.email = email;
		} else {
			System.err.println("Email輸入格式不正確");
		}
	}

	public char getGender() {
		return this.gender;
	}

	public void setGender(char gender) {
		if (gender == 'M' || gender == 'F' || gender == 'O') {
			this.gender = gender;
		} else {
			System.err.println("性別資料不正確");
		}
	}

	public void setPassword(String password) {
		// TODO:Password檢查
		if (password != null && password.length() > 6 && password.length() < 20) {
			this.password = password;
		} else {
			System.err.println("密碼長度必須在6~20之間");
		}
	}

	public String getPassword() {
		return this.password;
	}

	public void setId(String id) {
		// "^[A-Z][12]\\d{8}$"
		// if(id!=null && id.matches("[A-Z][1289]\\d{8}")){
		if (checkId(id)) {
			this.id = id;
		} else {
			System.err.println("身分證格式有誤");
		}
	}

	public boolean checkId(String id) {
		if (id != null && id.matches("[A-Z][1289]\\d{8}")) {
			// 1.將第一碼英文大寫->數字
			char char1 = id.charAt(0);
			int number1;
			if (char1 >= 'A' && char1 < 'I') {
				number1 = char1 - 'A' + 10;// A==(65-65)+10,B==(66-65)+10, C==(67-65)+10
				// TODO:J(18)-N,P(23)-V,X,Y,W,Z,I,O
			} else if (char1 >= 'J' && char1 < 'O') {
				number1 = char1 - 'J' + 18;// J==(74-74)+18,K==(75-74)+18,L==(76-74)+18
			} else if (char1 >= 'P' && char1 <= 'V') {
				number1 = char1 - 'p' + 23;// P==(80-80)+23,Q==(81-80)+23,R(82-80)+23
			} else {
//				if(char1=='X') {
//					number1=30;
//				}else if(char1=='Y') {
//					number1=31;
//				}else if(char1=='W') {
//					number1=32;
//				}else if(char1=='Z') {
//					number1=33;
//				}else if(char1=='I') {
//					number1=34;
//				}else if(char1=='O') {
//					number1=35;
//				}else {
//					
//				}

				switch (char1) {
				case 'X':
					number1 = 30;
					break;
				case 'Y':
					number1 = 31;
					break;
				case 'W':
					number1 = 32;
					break;
				case 'Z':
					number1 = 33;
					break;
				case 'I':
					number1 = 34;
					break;
				case 'O':
					number1 = 35;
					break;
				default:
					return false;
				}
			}
			int sum = number1 / 10 + number1 % 10 * 9;
			// 2.將個數字加總
			for (int i=1,j=8;i<9;i++,j--){
				sum= sum+(id.charAt(i)-'0')*j;
			}
//			sum = sum + (id.charAt(1) - '0') * 8;
//			sum = sum + (id.charAt(2) - '0') * 7;
//			sum = sum + (id.charAt(3) - '0') * 6;
//			sum = sum + (id.charAt(4) - '0') * 5;
//			sum = sum + (id.charAt(5) - '0') * 4;
//			sum = sum + (id.charAt(6) - '0') * 3;
//			sum = sum + (id.charAt(7) - '0') * 2;
//			sum = sum + (id.charAt(8) - '0') * 1;
			sum = sum + (id.charAt(9) - '0') * 1;
			//3. 正確格式
			return (sum % 10 == 0);
		}
		return false;//不符合格式
	}

	public String getId() {
		return this.id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		if (name != null && (name = name.trim()).length() > 2 && name.length() < 20) {
			this.name = name.trim();
		} else {
			System.err.println("輸入姓名必需長度2~20字之間");
		}
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if (address != null && address.length() > 0) {
			address = address.trim();
		}
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		if (phone != null && phone.length() > 0) {
			this.phone = phone;
		}
	}

	public boolean isSubscribed() {
		return subscribed;
	}

	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}

	/**
	 * 計算客戶年齡
	 * 
	 * @return int型態的客戶年齡
	 */
	public int getAge() {
		return this.getAge(this.birthday);
	}

	/**
	 * 計算客戶年齡
	 * 
	 * @param 指定生日birthday
	 * @return int型態的顧客年齡
	 */
	public int getAge(LocalDate birthday) {
		// 計算客戶年齡
		int thisYear = LocalDate.now().getYear();// 2021
		if (birthday != null) {
			int birthYear = birthday.getYear();// 2000//this抓自己類別中的屬性
			int age = thisYear - birthYear;
			return age;
		} else {
			return -1;
			// TODO:第13張 throw exception物件
		}
	}

	public void setBirthday(LocalDate birthday) {
		if (birthday != null) {
			if (getAge(birthday) >= 12) {
				this.birthday = birthday;
			} else {
				System.err.println("客戶生日須年滿12歲");
			}
		}
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(String date) {
		this.setBirthday(LocalDate.parse(date));
	}

	public void setBirthday(int year, int month, int day) {
		this.setBirthday(LocalDate.of(year, month, day));
	}

	public int getAge1() {
		// 計算客戶年齡
		if (birthday != null) {
			Period age = Period.between(birthday, LocalDate.now());// 2000//this抓自己類別中的屬性
			return age.getYears();
		} else {
			return -1;
		}
	}
}
