package com.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CustomerDaoImp;
import com.model.Customer;
import com.model.LoanDetails;
import com.model.Nominee;
@Service
public class CustomerService {
	CustomerDaoImp  cd;
	
	
	@Autowired
	public CustomerService(CustomerDaoImp  cd) {
		// TODO Auto-generated constructor stub
		this.cd=cd;
	}
	@Transactional
	public void addCustomer(Customer cus) {
		cd.addCustomer(cus);
	}
	
	
	@Transactional
	public void addNominee(Nominee nom) {
		cd.addNominee(nom);
	}
	@Transactional
	public void addLoan(LoanDetails ld) {
		cd.addLoanDetails(ld);
	}
	public boolean validateCustomer(String email, String pwd) {
		// TODO Auto-generated method stub
		return cd.validateCustomer(email,pwd);
	}
}