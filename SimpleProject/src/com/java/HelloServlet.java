package com.java;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ss2.sdk.SS2;

@SuppressWarnings("serial")
public class HelloServlet extends HttpServlet {

	/**
	 * 
	 */
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
			
		
		//hello git
		SS2 ss2Obj = new SS2();
		String shieldsquare_username = ""; // Enter the UserID of the user. This is optional.
		int shieldsquare_calltype = 1;  // Update corresponding value as per CallType in the below table.
		String shieldsquare_pid = "";  // Please leave this as empty.

		com.fasterxml.jackson.databind.JsonNode ss2respJson=ss2Obj.shieldsquare_ValidateRequest(req, res, shieldsquare_pid, shieldsquare_username, shieldsquare_calltype);

		System.out.println(ss2respJson);
		

		if (ss2respJson.get("responsecode").equals("-1"))
		{
		//Exception has occurred. Check the ssResponse.get(“reason”) for the cause of the exception
			System.out.println("error occured");
		}
		//Set the value of ss2respJson to the HTTP request object like:
		req.setAttribute("ss2apirespJson",ss2respJson);
		RequestDispatcher requestDispatcher=req.getRequestDispatcher("index.html");  
		requestDispatcher.include(req,res); 
		
		
	}

}
