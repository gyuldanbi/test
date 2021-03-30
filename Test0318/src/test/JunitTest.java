package test;

import static org.junit.Assert.*;

import org.junit.Test;

public class JunitTest {
	String arraytest[] = {"APPLE", "PEACH"};
	String arraytest2[] = {"APPLE", "STRAWBERRY"};
	
	Calculator cal = new Calculator();
	BooleanTest bool = new BooleanTest();
	
	@Test
	public void testMultiple() {
		assertEquals(10 ,cal.multiple(7, 8));
	}
	@Test
	public void testMultiple2() {
		assertNull(cal.multiple(7, 8));
	}
	@Test
	public void testMultiple3() {
		assertNotNull(cal.multiple(7, 8));
	}
	
	@Test
	public void testIsInteger() {
		assertTrue(bool.isInteger("AAA"));
	}
	@Test
	public void testIsInteger2() {
		assertFalse(bool.isInteger("12345"));
	}
	@Test
	public void testArray() {
		assertArrayEquals(arraytest, arraytest2);
	}
	@Test
	public void testDB() {
		DBconn con = new DBconn();
		try {
			assertNull(con.testA());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
