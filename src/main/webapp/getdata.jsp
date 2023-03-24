<%@page import="com.jdbc.JDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Resources/css/styles.css">
</head>
<body>
	
	<%
		boolean ans = Boolean.valueOf(String.valueOf(request.getAttribute("finalAns")));
	%>


	
	
	<% if(ans){ %>
	<h1 class="final-ans" style="font-weight: bold; font-family: sans-serif; text-align: center; ">Valid User</h1>
	
	<a href="index.jsp"><button style="height: 40px; width: 90px; font-size: 18px; font-family: sans-serif; background-color: rgb(212, 21, 21); color: white; border-radius: 8px;">Logout</button></a>  
	
	<%}else %>
	

	
	
	
	
	
</body>
</html>