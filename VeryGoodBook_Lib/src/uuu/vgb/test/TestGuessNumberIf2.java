package uuu.vgb.test;

import java.util.Random;
import java.util.Scanner;

public class TestGuessNumberIf2 {

	public static void main(String[] args) {
		//1.用亂數產生1~10之間的一個數
		Random random = new Random();
		int num = random.nextInt(10)+1;//0~9+1
		System.out.println(num);  
		//2.讓使用者從鍵盤一個整數字
			System.out.println("請輸入1~10之間的整數");

			Scanner scanner = new Scanner(System.in);
			int guessNum = scanner.nextInt();
			int i;
		    for(i=1;i<10;i++) {
			if(guessNum==num) {
				System.out.println("猜對");
				break;
				}if(guessNum!=num){
					System.out.println("猜錯");
					guessNum = scanner.nextInt();
				}if(i==2&&guessNum!=num){
					System.out.println("超過三次");
					break;
				}
			}
		}
	}
		



