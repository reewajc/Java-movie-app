package movies;
/*
Author: Ram and Jonathan
Date: 09/30/2021
Description: Assignment week 8 showform class for custom tag
Company: Bellevue
*/

import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

public class ShowForm extends TagSupport {
	public int doEndTag() throws JspException{
		JspWriter out = pageContext.getOut();
		try{
		out.println("<div class=\"container\">\r\n"
				+ "		<form method=\"post\">\r\n"
				+ "			<h1>Please enter your favorite movies information</h1>\r\n"
				+ "			<div class=\"mb-3\">\r\n"
				+ "				<label for=\"title\" class=\"form-label\">Movie Name</label> <input\r\n"
				+ "					type=\"text\" name=\"title\" class=\"form-control\" id=\"title\" required>\r\n"
				+ "			</div>\r\n"
				+ "			<div class=\"mb-3\">\r\n"
				+ "				<label for=\"year\" class=\"form-label\">Released Year</label> <input\r\n"
				+ "					type=\"text\" name=\"year\" class=\"form-control\" id=\"year\" required>\r\n"
				+ "			</div>\r\n"
				+ "			<div class=\"mb-3\">\r\n"
				+ "				<label for=\"actor\" class=\"form-label\">Actor</label> <input\r\n"
				+ "					type=\"text\" name=\"actor\" class=\"form-control\" id=\"actor\" required>\r\n"
				+ "			</div></br>\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "			<button type=\"submit\" class=\"btn btn-primary\">Submit</button>\r\n"
				+ "\r\n"
				+ "		</form>\r\n"
				+ "	</div>");
		}
		catch(Exception e){
		}
		return super.doEndTag();
		}
}
