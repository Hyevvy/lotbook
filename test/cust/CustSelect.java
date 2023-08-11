package cust;


import org.junit.Test;

import app.cust.CustServiceImpl;
import app.dto.Cust;

public class CustSelect {
	@Test
	public void test() {
		CustServiceImpl service;
		service = new CustServiceImpl();
		Cust data = new Cust("id15", "pwd15", "hi15");
		try {
			service.register(data);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Cust cust = null;
		
		try {
			cust = service.get("id01");
			System.out.println(cust);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
