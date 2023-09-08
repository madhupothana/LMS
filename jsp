<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Multi-Part Form</title>

<style>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
/* Reset some default browser styles */
body {
	margin: 0;
	padding-top: 100px;
}
.header {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
	position: relative;
}
.form-container {
	max-width: 900px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	border-radius: 5px;
}

/* Style the tabs */
.tabs {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
}

.tab {
	background-color: gray;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.tab.active-tab {
	background-color: #007bff;
}

/* Style the form box */
.form-box {
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-part h2 {
	margin-bottom: 20px;
	color: #333;
}

input[type="text"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

input[type="date"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

input[type="tel"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

input[type="number"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

button.form-button {
	background-color: gray;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s;
}

button.form-button:hover {
	background-color: #0056b3;
}

form:invalid {
	border-color: #ff0000;
}

#submission-message {
	color: #009900;
	font-weight: bold;
	margin-top: 10px;
}
</style>

<script>
    let currentTab = 0;

    function showTab(tabIndex) {
        const formParts = document.querySelectorAll('.form-part');
        formParts[currentTab].style.display = 'none';
        formParts[tabIndex].style.display = 'block';
        
        // Remove the 'active-tab' class from all tab buttons
        const tabButtons = document.querySelectorAll('.tab');
        tabButtons.forEach(button => button.classList.remove('active-tab'));
        
        // Add the 'active-tab' class to the current tab button
        tabButtons[tabIndex].classList.add('active-tab');
        
        currentTab = tabIndex;
    }

    function nextTab(tabIndex) {
        const form = document.getElementById(`form-part-${tabIndex + 1}`);
        if (form.checkValidity()) {
            showTab(tabIndex + 1);
        } else {
            alert('Please fill in all required fields.');
        }
    }

    function prevTab(tabIndex) {
        showTab(tabIndex - 1);
    }
    </script>
</head>
<body>
	<div class="header bg-dark text-white py-3">
		<h1 class="text-center">MSB Bank</h1>
	</div>
	<center>
		<h2 style="color: black;">Loan Application Form</h2>
	</center>
	<div class="form-container">
		<div class="tabs">
			<button class="tab" onclick="showTab(0)">Personal Details</button>
			<button class="tab" onclick="showTab(1)">Nominee Details</button>
			<button class="tab" onclick="showTab(2)">Loan Details</button>
		</div>
		<div class="form-box">
			<div class="form-part">
				<form action="details" id="form-part-1" method="get">

					<b>FirstName : </b> <input type="text" name="cust_firstname"
						placeholder="Enter FirstName"><br> <b>LastName :
					</b> <input type="text" name="cust_lastname"
						placeholder="Enter Last name"><br> <b>DateOfBirth
						: </b><br> <input type="date" name="cust_dob"
						placeholder="Enter date of birth"><br> <b>Pancard
						No : </b> <input type="text" name="cust_panno"
						placeholder="Enter pancard number"><br> <b>Mobile
						Number : </b><br> <input type="tel" name="cust_mobile"
						placeholder="Enter mobile number"><br> <b>Address
						: </b> <input type="text" name="cust_address"
						placeholder="Enter address"><br> <b>Guardian Name
						: </b> <input type="text" name="cust_gname"
						placeholder="Enter guardian name"><br>

					<button class="form-button" type="button" onclick="nextTab(0)">Next</button>
			</div>
			<div class="form-part" style="display: none;">
				<h2>Nominee Details</h2>


				<b>Nominee Name : </b> <input type="text" name="lnap_nominee"
					placeholder="Enter Nominee Name"><br> <b>Relation
					: </b> <input type="text" name="lanp_relation"
					placeholder="Enter Relation"><br>

				<button class="form-button" type="button" onclick="prevTab(2)">Previous</button>
				<button type="button" class="form-button" onclick="nextTab(1)">Next</button>


			</div>
			<div class="form-part" style="display: none;">
				<h2>Loan Details</h2>
				<b>Amount : </b> <input type="text" name="lnap_amount"
					placeholder="Enter Amount"><br> <b>Applied Date :
				</b> <input type="date" name="lnap_apdate"
					placeholder="Enter Applied Date"><br> <b>Loan Type
					Id : </b><br> <input type="text" name="lnap_lnty_id"
					placeholder="Enter Loan Type Id"><br> <b>No of
					Years : </b><br> <input type="text" name="lnap_noy"
					placeholder="Enter No Of Years"><br> <b>Emi From
					Range : </b><br> <input type="tel" name="lnap_emi_range_from"
					placeholder="Enter Emi From Range"><br> <b>Emi to
					Range : </b> <input type="text" name="lnap_emi_range_to"
					placeholder="Enter Emi to Range"><br> <b>Cibil
					Score : </b> <input type="text" name="lnap_cibil_Score"
					placeholder="Enter Cibil Score"><br>




				<button type="button" class="form-button" onclick="prevTab(1)">Previous</button>
				<button class="form-button" type="submit">Preview</button>
				</form>
			</div>

		</div>
	</div>
</body>
</html>
