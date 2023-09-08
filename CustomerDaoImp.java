package com.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.model.Customer;
import com.model.LoanDetails;
import com.model.Nominee;

public class CustomerDaoImp {
	@PersistenceContext
	private EntityManager em;
	
	
	public void addCustomer(Customer customer) {
		em.persist(customer);
		
	}
	public void addNominee(Nominee nom) {
		// TODO Auto-generated method stub
		em.persist(nom);
	}
	
	public void addLoanDetails(LoanDetails ld) {
		// TODO Auto-generated method stub
		
		
		em.persist(ld);
		
	}
	public boolean validateCustomer(String email, String pwd) {
		String jpql = "SELECT e FROM Users e WHERE e.user_email = :paramValue1 and e.user_pwd = :paramValue2";
		Query query = em.createQuery(jpql);
		query.setParameter("paramValue1", email);
		query.setParameter("paramValue2", pwd);
		if(query.getSingleResult()!=null) {
			return true;
		}
		return false;
	}

	
	
}