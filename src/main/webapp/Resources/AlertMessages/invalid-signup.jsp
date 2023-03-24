<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>


	<%
	String message = (String) session.getAttribute("invalidPass");

	if (message != null) {
	%>


	<div class="alert alert-danger alert-dismissible fade show"
		role="alert">
		<strong>Sorry!</strong> Passwords Are Not Same.
	</div>

	<!-- <script type="text/javascript">
		document.getElementsByClassName("signupbtn")[0].addEventListener("click",invalidPass);
	</script> -->
	

	<%
	session.removeAttribute("invalidPass");
	}
	%>



 	
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
	</script>

</body>
</html>