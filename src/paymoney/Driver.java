package paymoney;

import java.util.Scanner;

public class Driver {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("Enter  the size of Transaction array");
		int size = sc.nextInt();
		int transactions[] = new int[size];
		System.out.println("Enter the amount or values of array");
		for (int i = 0; i < size; i++) {
			transactions[i] = sc.nextInt();

		}
		
		System.out.println("enter the total no of targets that needs to be achieved");
		int targetNo = sc.nextInt();

		while (targetNo-- != 0) {
			System.out.println("Enter the value of target");
			int targetAmt = sc.nextInt();
			PayMoney pm = new PayMoney();
			int nDays = pm.numberOfDays(transactions, targetAmt);
			System.out.println(nDays);
			if (nDays != -1) {
				System.out.println("The target " + targetAmt + " Crores achieved after " + nDays + " transactions");
			} else
				System.out.println("The Given target " + targetAmt + " is not achieved");
		}
	}

}