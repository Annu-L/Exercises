package random;

import java.util.Scanner;

public class Driver {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		//User Inputs
		int noOfCurrencyDen, totAmount;
		
		System.out.println("Enter size of currency denomination");
		noOfCurrencyDen = sc.nextInt();
		
		int[] denValues = new int[noOfCurrencyDen];
		
		System.out.println("Enter the currency denomination value:");
		for (int i = 0; i < noOfCurrencyDen; i++) {
			denValues[i] = sc.nextInt();
		}
		
		System.out.println("Enter the amount you want to pay");
		totAmount = sc.nextInt();
		
		//Need to sort array first in descending order
		SortingClass sort = new SortingClass();
		denValues = sort.sort(denValues);
		
		//Logic for currency denomination
		int[] countofDen = new int[noOfCurrencyDen];
		//If its zero
		if (totAmount <= 0) {
			System.out.println("Total amount is zero or negative. Pleaase enter correct amount");
		}
		//If meets with first value array
		else if (totAmount == denValues[0]) {
			countofDen[0] = 1;
		}
		else {
			for (int i =0; i <noOfCurrencyDen; i++)
			{
				if (totAmount >= denValues[i]) {
					countofDen[i] = totAmount / denValues[i];
					totAmount = totAmount - (countofDen[i] * denValues[i]);
				}
			}
		}
		//Output
		if (totAmount == 0) {
			System.out.println("Payment approach in min no. of currency notes will be:");
			for (int i = 0; i<noOfCurrencyDen; i++) {
				if (countofDen[i]>0)
					System.out.println(denValues[i] + " : " + countofDen[i]);
			}
		}
		else 
			System.out.println("Amount cannot be delivered with entered currency denominations");
			
	}
}
