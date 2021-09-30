<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" import="movies.*" pageEncoding="UTF-8"%>
<!-- Author: Jonathan & Ram Company: Bellevue University: Description: JSP app using java beans, custom tag, and JDBC to display movie information -->


<%@ page import="java.io.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	body {
		background-color: #c9c1c1;
	}
	#week8A{
		color: rgb(203, 18, 219);
	}
	.jumbotron{
		background-color: #f7f7f7;
	}
	#footer{
		font-weight: bolder;
	}

</style>
<title>Ram Form Post week 7</title>
</head>
<body>

<div class="container">
 <div class="jumbotron">
    <h1 id="week8A" class="text-center font-weight-bold">Week 8 Assignment</h1>      
    <p class="text-center">JSP Application using beans, database, and custom tags.</p>
  </div> 
	<%
	//Display the form when the page loads
	if (request.getMethod().equals("GET")) {
	%>
	<%@ taglib uri="/showFormTag" prefix="showForm" %>
	<showForm:showFormTag />
	
	<%
	}

	//Post the form data to the database when the form is posted
	if (request.getMethod().equals("POST")) {
	%>
	<!-- Use movie bean-->
	<jsp:useBean id="movieBean" class="movies.Movie" scope="page">
		<jsp:setProperty name="movieBean" property="*" />
	</jsp:useBean>

	<%
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String username = "user name";
	String password = "password";

	try (Connection connection = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = connection.prepareStatement("INSERT INTO movie(title, year, actor) VALUES(?, ?, ?)")) {

		ps.setString(1, movieBean.getTitle());
		ps.setString(2, movieBean.getYear());
		ps.setString(3, movieBean.getActor());

		ps.executeUpdate();
		ps.close();

	} catch (Exception e) {
		out.println(e);
	}

	//Call getAllMovies method to make list of movies

	String sql = "SELECT * FROM movie";
	List<Movie> movies = new ArrayList<>();

	try (Connection connection = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = connection.prepareStatement(sql)) {
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			String movieTitle = rs.getString("title");
			String relesasedYear = rs.getString("year");
			String movieActor = rs.getString("actor");

			Movie movie = new Movie();
			movie.setTitle(movieTitle);
			movie.setYear(relesasedYear);
			movie.setActor(movieActor);

			movies.add(movie);

		}

	} catch (SQLException e) {
		out.println(e);
	}
    out.println("<h2 class='text-center text-primary'>Movies</h2>");

	out.println("<table class= 'table table-hover table-dark'>");
	out.println("<tr><th>Title</th><th>Year</th><th>Actor</th><tr>");

	//loop thorough the movies and print the information to the table
	for (Movie m : movies) {
		out.println("<tr><td>" + m.getTitle() + "</td><td>" + m.getYear() + "</td><td>" + m.getActor() + "</td></tr>");
	

	}
	out.println("</table>");
	out.println("<a href='http://localhost:7070/week8/RamJonFormPost5.jsp'> Go Back <a>");

	}
	%>

</div>
<footer id="footer" class="text-success text-center">Website created by Jonathan and Ram - Bellevue University</footer>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.0/js/bootstrap.min.js"></script>
	
</body>
</html>