package controller;

import java.io.IOException;

import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.UserDto;
import service.UserService;
//Used to Map a request string should be same as action

@WebServlet("/signup")
public class SignUp extends HttpServlet{
	//Request is Coming from form so do Post

   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 //Receiving values from front end and Loading inside Object
	//int id=Integer.parseInt(req.getParameter("id"));
	String name=req.getParameter("name");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	long mobile=Long.parseLong(req.getParameter("mobile"));
	LocalDate dob=LocalDate.parse(req.getParameter("dob"));
	String gender=req.getParameter("gender");
	//int age=LocalDate.now().getYear()-dob.getYear();
	int age=Period.between(dob, LocalDate.now()).getYears();
	
	
	UserDto dto=new UserDto();
	dto.setPassword(password);
	dto.setName(name);
	// dto.setId(id);
	dto.setAge(age);
	dto.setDob(dob);
	dto.setEmail(email);
	dto.setGender(gender);
	dto.setMobile(mobile);
	
	UserService service=new UserService();
	//Saving user after checking age and email is unique
	if(service.saveUser(dto)) {
		resp.getWriter().print("<h1 align='center' style='color:green'>Account Created Successfully</h1>");
		req.getRequestDispatcher("login.html").include(req,resp);
	}else {
		resp.getWriter().print("<h1 style='color:red'>Sorry!! Account Cannot be Created</h1>");
		req.getRequestDispatcher("signup.html").include(req, resp);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*resp.getWriter().print("<h1>");
	resp.getWriter().print("Name: "+"<br>");
	resp.getWriter().print("Email: "+email+"<br>");
	resp.getWriter().print("Password: "+password+"<br>");
	resp.getWriter().print("Mobile: "+mobile+"<br>");
	resp.getWriter().print("DOB: "+dob+"<br>");
	resp.getWriter().print("Gender: "+gender+"<br>");
	resp.getWriter().print("age: "+age+"<br>");*/
} 
}
