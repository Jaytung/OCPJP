package uuu.vgb.test;

import java.util.Random;
import java.util.Scanner;

public class TestGuessNumberIf {

	public static void main(String[] args) {
		// 1.用亂數產生1~10之間的一個數
		Random random = new Random();
		int num = random.nextInt(10) + 1;// 0~9+1
		System.out.println(num);
		// 2.讓使用者從鍵盤一個整數字
		System.out.println("請輸入1~10之間的整數");
		Scanner scanner = new Scanner(System.in);
		String data = scanner.next();
		if (data != null && data.matches("\\d")) {
			int guessNumber = Integer.parseInt(data);// 將字串轉為整數
			// 3.判斷使用者數字與步驟1.的數字相等
			if (guessNumber == num) {
				System.out.println("猜對了");
			} else {
				System.out.println("猜錯了\n答案是: " + num);
			}
		} else {
			System.out.println("輸入格式不正確,無法判讀");
		}
	}
}
