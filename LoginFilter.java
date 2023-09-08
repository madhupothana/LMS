package com.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.beans.factory.annotation.Autowired;

import com.services.CustomerService;
import com.services.LoanApplicantService;

@WebFilter("/Loginrwerr")
public class LoginFilter implements Filter {
	CustomerService customerservice;

	@Autowired
	public LoginFilter(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		if(customerservice.validateCustomer(email,pwd)) {
			chain.doFilter(request, response);
		}
		else {
			System.out.println("wrong credentials");
		}
	}

}
