<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- Add Bootstrap CSS link -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.header {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	position: relative;
}

.container {
	display: flex;
	padding-top :40px;
	justify-content: center;
	align-items: center;
	height: 100vh; /* Center the container vertically */
}

.product {
	width: 50%;
	padding: 20px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.product label {
	display: block;
	margin-bottom: 10px;
}

.product input[type="text"], .product input[type="password"] {
	width: 100%; /* Full-width input fields */
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.product button {
	width: 100%; /* Full-width button */
	padding: 10px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.product button:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<form action="Login">
		<div class="header bg-dark text-white py-3">
			<h1 class="text-center">MSB Bank</h1>
		</div>
		<div class="container">
			<div class="product">
				<h1><b>Login</b></h1>
				<label for="user"><b>Customer id:</b></label> <input type="text"
					placeholder="Enter id" name="email" required> <br>
				<label for="psw"><b>Name:</b></label> <input type="password"
					placeholder="Enter name" name="password" required> <br>
				<!-- Use Bootstrap class for the button -->
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
		</div>
	</form>
	<!-- Add Bootstrap JS and jQuery (optional) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>