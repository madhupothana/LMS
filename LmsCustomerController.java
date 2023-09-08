package com.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Customer;

import com.model.LoanDetails;
import com.model.Nominee;
import com.services.CustomerService;
import com.services.LoanApplicantService;

@Controller
public class LmsCustomerController {
	LoanApplicantService las;

	@Autowired
	public LmsCustomerController(LoanApplicantService las, CustomerService customerservice) {
		this.las = las;
		this.customerservice = customerservice;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {

		return "admin";
	}

	@RequestMapping(value = "/customerlogin", method = RequestMethod.GET)
	public String customerlogin() {

		return "customerlogin";
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {

		return "about";
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String start() {
		return "customer";
	}

	@RequestMapping(value = "/listall")
	public String list() {
		return "applicationlist";
	}

	@RequestMapping(value = "/loanapplicant", method = RequestMethod.GET)
	public String Applicant() {

		return "adminoptions";
	}

	@RequestMapping(value = "/listApplicants", method = RequestMethod.GET)
	public String listApplicants(Model model) {
		ArrayList<LoanDetails> llist = las.getAll();
		model.addAttribute("llist", llist);
		return "applicationlist";
	}

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String View(@RequestParam("id") int id, Model model) {
		System.out.println(id);
		LoanDetails l = las.getApplicant(id);
		System.out.println(l.getLnap_status());
		model.addAttribute("applicant", l);
		return "view";
	}

	@RequestMapping(value = "/Editapplicant", method = RequestMethod.POST)
	public String View(LoanDetails la, Model model) {
		las.editApplicant(la);
		ArrayList<LoanDetails> llist = las.getAll();
		model.addAttribute("llist", llist);
		return "applicationlist";
	}

	CustomerService customerservice;

	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String loanApplicant(Model model, Customer customer, Nominee nominee, LoanDetails loandetails) {
		System.out.println(loandetails.toString());
		model.addAttribute("customer", customer);
		model.addAttribute("nominee", nominee);
		model.addAttribute("loandetails", loandetails);
		return "preview";

	}

	@RequestMapping(value = "/preview", method = RequestMethod.GET)
	public String preview() {

		return "customer";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Model model, 
            @ModelAttribute("customer") Customer customer,
            @ModelAttribute("nominee") Nominee nominee,
            @ModelAttribute("loandetails") LoanDetails loandetails)  {
		customerservice.addCustomer(customer);

		customerservice.addNominee(nominee);
		loandetails.setLnap_cust_id(customer.getCust_id());
		loandetails.setLnap_nom_requested(nominee.getNom_id());
		customerservice.addLoan(loandetails);
		return "save";
	}

}