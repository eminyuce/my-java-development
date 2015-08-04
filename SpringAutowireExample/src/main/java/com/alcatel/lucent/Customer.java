package com.alcatel.lucent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("customerObject")
public class Customer {
	
	@Autowired
	@Qualifier("personA")
	private Person person;
	
	
	public void getMessage() {
		// TODO Auto-generated method stub
		System.out.println("Customer "+person.toString());
	}

}
