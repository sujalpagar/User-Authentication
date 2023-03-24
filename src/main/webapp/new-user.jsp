<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	/*add full-width input fields*/
	input[type=text],
	input[type=password] {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 2px solid #ccc;
		box-sizing: border-box;
	}
	/* set a style for all buttons*/
	button {
		background-color: green;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		cursor: pointer;
		width: 100%;
	}
	/*set styles for the cancel button*/
	.cancelbtn {
		padding: 14px 20px;
		background-color: #FF2E00;
	}
	/*float cancel and signup buttons and add an equal width*/
	.cancelbtn,
	.signupbtn {
		float: left;
		width: 50%
	}
	/*add padding to container elements*/
	.container {
		padding: 16px;
	}
	/*define the modal’s background*/
	
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0, 0, 0);
		background-color: rgba(0, 0, 0, 0.4);
		padding-top: 60px;
	}
	/*define the modal-content background*/
	
	.modal-content {
		background-color: #fefefe;
		margin: 5% auto 15% auto;
		border: 1px solid #888;
		width: 80%;
	}
	/*define the close button*/
	
	.close {
		position: absolute;
		right: 35px;
		top: 15px;
		color: #000;
		font-size: 40px;
		font-weight: bold;
	}
	/*define the close hover and focus effects*/
	
	.close:hover,
	.close:focus {
		color: red;
		cursor: pointer;
	}
	
	.clearfix::after {
		content: "";
		clear: both;
		display: table;
	}
	
	@media screen and (max-width: 600px) {
		.cancelbtn,
		.signupbtn {
			width: 100%;
		}
	}
</style>

<body>
	
	<h2 style="text-align: center;">Modal Signup Form</h2>
	<!--Step 1:Adding HTML-->

	<div>
		<form class="modal-content animate" action="UserDataController">
			<input type="hidden" name="operation" value="signup">
			<div class="container">
				<label><b>Email</b></label>
				<input type="text" placeholder="Enter Email" name="uName" required>

				<label><b>Password</b></label>
				<%@ include file="Resources/AlertMessages/invalid-signup.jsp" %>
				<input type="password" placeholder="Enter Password" name="pass" required>

				<label><b>Repeat Password</b></label>
				<input type="password" placeholder="Repeat Password" name="pass-repeat" required>

				
				<input type="checkbox"> Remember me
				

				<div class="clearfix">
					<a href="index.jsp"><button type="button" class="cancelbtn">Cancel</button></a> 
					<button type="submit" class="signupbtn">Sign Up</button>
				</div>
			</div>
		</form>
	</div>

	

</body>

</html>
