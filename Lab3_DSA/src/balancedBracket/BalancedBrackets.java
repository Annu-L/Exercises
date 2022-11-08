package balancedBracket;
// Code for checking
// balanced brackets

import java.util.*;

public class BalancedBrackets {

	static boolean isBalancedStringExp(String input)
	{
		Stack<Character> stack
			= new Stack<Character>();

		for (int i = 0; i < input.length(); i++) {
			char x = input.charAt(i);

			if (x == '(' || x == '[' || x == '{') {
				stack.push(x);
				continue;
			}

			if (stack.isEmpty())
				return false;
			char check;
			switch (x) {
			case ')':
				check = stack.pop();
				if (check == '{' || check == '[')
					return false;
				break;

			case '}':
				check = stack.pop();
				if (check == '(' || check == '[')
					return false;
				break;

			case ']':
				check = stack.pop();
				if (check == '(' || check == '{')
					return false;
				break;
			}
		}
		return (stack.isEmpty());
	}

	public static void main(String[] args)
	{
		String input = "( [ [ { } ] ] )";

		if (isBalancedStringExp(input))
			System.out.println("The entered String has Balanced Brackets");
		else
			System.out.println("The entered Strings Do Not contain Balanced Brackets");
	}
}
