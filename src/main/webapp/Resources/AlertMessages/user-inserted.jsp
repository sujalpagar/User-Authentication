<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

</head>
<body>
	
	<%
/* 		boolean insert = Boolean.valueOf(String.valueOf(session.getAttribute("inserted"))) ;*/

		String insert = (String) session.getAttribute("inserted");
		
		if(insert== "success"){
	%>
	
	<div class="alert alert-success alert-dismissible fade show"
		role="alert">
		<strong>Success!</strong> Account Create Successfully. 
		<a href="#" onclick="document.getElementById('id01').style.display='block'"
		style="width: auto; color : blue; text-decoration: underline;">Login</a>
	</div>
	
	<% 
		session.removeAttribute("inserted");
	}
	%>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>
</body>
</html>