package test;

public class BooleanTest {
	public boolean isInteger(String string) {
		int integer = 0;
		try {
			integer = Integer.parseInt(string);
		} catch (NumberFormatException e) {
			return false;
		}
		return true;
	}
}
