package uuu.blackcake.entity;

import java.time.LocalDate;
import java.time.Period;

import uuu.blackcake.exception.DataInvalidException;

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
	

	
	public Customer() {
		
	}
			
//	@Override
//	public int hashCode() {
//		int hash = this.id !=null?id.hashCode():0;
//		hash = hash*31+name!=null?name.hashCode():0;
//		hash= hash*31+gender;
//		return hash;
//	}


//	@Override
//	public boolean equals(Object obj) {
//		if(this==obj) return true;
//		//if(obj!= null && this.getClass()==obj.getClass())
//		if(obj instanceof Customer) {
//			Customer other = (Customer)obj;
//			if((id)!=null && (name)!=null && this.id.equals(other.id) 
//					&& this.name.equalsIgnoreCase(other.name)) {
//				return true;
//			}
//		}
//		return false;
//	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (!(obj instanceof Customer)) {
			return false;
		}
		Customer other = (Customer) obj;
		if (id == null) {
//			if (other.id != null) { //兩個id都為null時會變true,故註解掉
				return false;
//			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		return true;
	}

	public Customer(String id, String name, String password, String email) {
		//super();
		this(id,name,password);//使用下方三個參數的建構子
		this.setEmail(email);
	}

	public Customer(String id, String name, String password) {
		this.setId(id);
		this.setName(name);
		this.setPassword(password);
	}
	
	public String getEmail() {
		return this.email;
	}
	private static final String EMAIL_PATTERN="^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";

	public void setEmail(String email) {
		if (email != null && email.matches(EMAIL_PATTERN)) {
			this.email = email;
		} else {
//			System.err.println("Email輸入格式不正確");
			String msg = String.format("email必須輸入且符合格式");
			//throw Exception
			throw new DataInvalidException(msg);
		}
	}

	public char getGender() {
		return this.gender;
	}
	
	public static final char MALE = 'M';
	public static final char FEMALE = 'F';
	public static final char OTHER = 'O';
	public void setGender(char gender) {
		if (gender == MALE || gender == FEMALE || gender == OTHER) {
			this.gender = gender;
		} else {
//			System.err.printf("性別資料不正確應為男:%s,女:%s,其他:%s",MALE,FEMALE,OTHER);
			String msg = String.format("性別資料不正確，應為男:%s,女:%s,其他:%s", 
					MALE,FEMALE,OTHER);
			throw new DataInvalidException(msg);
		}
	}
	
	public static final int MIN_PWD_LENGTH=6;
	public static final int MAX_PWD_LENGTH=20;
	public void setPassword(String password) {
		// TODO:Password檢查
		if (password != null && password.length() >= MIN_PWD_LENGTH && password.length() <= MAX_PWD_LENGTH) {
			this.password = password;
		} else {
//			System.err.printf("密碼長度必須在%d~%d之間",MIN_PWD_LENGTH,MAX_PWD_LENGTH);
			String msg = String.format("密碼必須輸入且長度在%d~%d之間",
					MIN_PWD_LENGTH,MAX_PWD_LENGTH);
			throw new DataInvalidException(msg);
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
//			System.err.println("身分證格式有誤");
			throw new DataInvalidException("身分證號格式不正確");
		}
	}
	
	public static final String ID_CHECK = "[A-Z][1289]\\d{8}";
	public static boolean checkId(String id) {
		if (id != null && id.matches(ID_CHECK)) {
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
			//sum+(id(1)-48)*8 +(id(2)-48)*7+(id(3)-48)*6...(id(8)-48)*1 
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
	
	public static final int MIN_NAME_LENGTH=2;
	public static final int MAX_NAME_LENGTH=20;
	public void setName(String name) {
		if (name != null && (name = name.trim()).length() >MIN_NAME_LENGTH  && name.length() < MAX_NAME_LENGTH) {
			this.name = name.trim();
		} else {
//			System.err.printf("輸入姓名必需長度在%d~%d之間",MIN_NAME_LENGTH);
			String msg = String.format("客戶姓名必須輸入且長度在%d~%d之間",
					MIN_NAME_LENGTH,MAX_NAME_LENGTH);
			//throw Exception
			throw new DataInvalidException(msg);
		}
	}

	public String getAddress() {
		return address;
	}
	
	public static final int MIN_ADDRESS_LENGTH = 0;
	public void setAddress(String address) {
		if (address != null && address.length() > MIN_ADDRESS_LENGTH) {
			address = address.trim();
		}
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}
	
	public static final int MIN_PHONE_LENGTH=0;
	public void setPhone(String phone) {
		if (phone != null && phone.length() > MIN_PHONE_LENGTH) {
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

	public static int getAge(LocalDate birthday) {
		int thisYear = LocalDate.now().getYear();
		if(birthday!=null) {
//			int birthYear = birthday.getYear(); 
//			int age = thisYear-birthYear;
//			System.out.println(
//					Period.between(birthday, LocalDate.now())); //for test
			int age = Period.between(birthday, LocalDate.now()).getYears();
			return age;		
		}else {
			return -1;
			//TODO:第13章 改(拋出)throw exception物件
		}
	}	
	
	public static final int MIN_AGE = 12;
	public void setBirthday(LocalDate birthday) {
		if (birthday != null) {
			if (getAge(birthday) >= MIN_AGE) {
				this.birthday = birthday;
			} else {
//				System.err.println("客戶生日須年滿12歲");
				String msg = String.format("客戶生日必須輸入且年滿%d歲",MIN_AGE);
				throw new DataInvalidException(msg);
			}
		}
	}

	public LocalDate getBirthday() {
		return birthday;
	}
	
//	public void setBirthday(java.util.Date date) {
//		this.birthday=date;
//	}

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

	@Override
	public String toString() {
		return  "\n"+this.getClass().getName()+": \n"
				+"id= " + id + "\n"
				+ "name= " + name + "\n"
				+ "email= " + email + "\n"
				+ "password= " + password + "\n"
				+ "birthday= "+ birthday + "("+ "Age:"+getAge()+" years old )\n"
				+ "gender= " + gender + "\n"
				+ "address= " + address + "\n"
				+ "phone= " + phone + "\n"
				+ "subscribed= "+ subscribed;
	}


}
