<?php
session_start();
error_reporting(0);
include('includes/config.php');
//  user Registration
if (isset($_POST['submit'])) {
	$name = $_POST['fullname'];
	$email = $_POST['emailid'];
	$contactno = $_POST['contactno'];
	$password = md5($_POST['password']);
	$authenticationkey = md5($_POST['authenticationkey']);
	$query = mysqli_query($con, "insert into users(name,email,contactno,password,authenticationkey) values('$name','$email','$contactno','$password','$authenticationkey')");
	if ($query) {
		echo "<script>alert('You are successfully register');</script>";
	} else {
		echo "<script>alert('Not register something went worng');</script>";
	}
}
// User login
if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $authenticationkey = md5($_POST['authenticationkey']);

    $query = mysqli_query($con, "SELECT * FROM users WHERE email='$email'");
    $num = mysqli_fetch_array($query);

    if ($num > 0) {
        if ($num['password'] == $password && $num['authenticationkey'] == $authenticationkey) {
            // Login successful
            $extra = "my-cart.php";
            $_SESSION['login'] = $_POST['email'];
            $_SESSION['id'] = $num['id'];
            $_SESSION['username'] = $num['name'];
            $uip = $_SERVER['REMOTE_ADDR'];
            $status = 1;
            $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('" . $_SESSION['login'] . "','$uip','$status')");
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            header("location:http://$host$uri/$extra");
            exit();
        } elseif ($num['password'] != $password) {
            // Incorrect password
            $extra = "login.php";
            $email = $_POST['email'];
            $uip = $_SERVER['REMOTE_ADDR'];
            $status = 0;
            $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            header("location:http://$host$uri/$extra");
            $_SESSION['errmsg'] = "Incorrect Password";
            exit();
        } elseif ($num['authenticationkey'] != $authenticationkey) {
            // Incorrect authentication key
            $extra = "login.php";
            $email = $_POST['email'];
            $uip = $_SERVER['REMOTE_ADDR'];
            $status = 0;
            $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
            $host = $_SERVER['HTTP_HOST'];
            $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            header("location:http://$host$uri/$extra");
            $_SESSION['errmsg'] = "Authentication Failed! Due To Incorrect Authentication Key";
            exit();
        }
    } else {
        // Invalid email
        $extra = "login.php";
        $email = $_POST['email'];
        $uip = $_SERVER['REMOTE_ADDR'];
        $status = 0;
        $log = mysqli_query($con, "insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
        $host = $_SERVER['HTTP_HOST'];
        $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
        header("location:http://$host$uri/$extra");
        $_SESSION['errmsg'] = "Invalid Email";
        exit();
    }
}



?>


<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="Ecommerce">
	<meta name="robots" content="noindex nofollow">

	<title><?php echo ucfirst(basename($_SERVER['PHP_SELF'], '.php')) ?></title>

	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.transitions.css">
	<link href="assets/css/lightbox.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/rateit.css">
	<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

	<!-- Icons/Glyphs -->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>

	<!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">
	<script type="text/javascript">
		function valid() {
			if (document.register.password.value != document.register.confirmpassword.value) {
				alert("Password and Confirm Password Field do not match  !!");
				document.register.confirmpassword.focus();
				return false;
			}
			return true;
		}
	</script>
	<script>
		function userAvailability() {
			$("#loaderIcon").show();
			jQuery.ajax({
				url: "check_availability.php",
				data: 'email=' + $("#email").val(),
				type: "POST",
				success: function(data) {
					$("#user-availability-status1").html(data);
					$("#loaderIcon").hide();
				},
				error: function() {}
			});
		}
	</script>



</head>

<body class="student-1">



	<!-- ============================================== HEADER ============================================== -->
	<header class="header-style-1">

		<!-- ============================================== TOP MENU ============================================== -->
		<?php include('includes/top-header.php'); ?>
		<!-- ============================================== TOP MENU : END ============================================== -->
		<?php include('includes/main-header.php'); ?>
		<!-- ============================================== NAVBAR ============================================== -->
		<?php include('includes/menu-bar.php'); ?>
		<!-- ============================================== NAVBAR : END ============================================== -->

	</header>

	<!-- ============================================== HEADER : END ============================================== -->
	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<li><a href="home.html">Home</a></li>
					<li class='active'>Authentication</li>
				</ul>
			</div><!-- /.breadcrumb-inner -->
		</div><!-- /.container -->
	</div><!-- /.breadcrumb -->

	<div class="body-content outer-top-bd">
		<div class="container">
			<div class="sign-in-page inner-bottom-sm">
				<div class="row">
					<!-- Sign-in -->
					<div class="col-md-6 col-sm-6 sign-in">
						<h4 class="">sign in</h4>
						<p class="">Hello, Welcome to your account.</p>
						<form class="register-form outer-top-xs" method="post">
							<span style="color: white;background-color: red;font-size: 20px;">
								<?php
								echo htmlentities($_SESSION['errmsg']);
								?>
								<?php
								echo htmlentities($_SESSION['errmsg'] = "");
								?>
							</span>
							<div class="form-group">
								<label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
								<input type="email" name="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1">
							</div>
							<div class="form-group">
								<label class="info-title" for="exampleInputPassword1">Password <span>*</span></label>
								<input type="password" name="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label class="info-title" for="exampleInputAuthenticationKey">Authentication Key <span>*</span></label>
								<input type="password" name="authenticationkey" class="form-control unicase-form-control text-input" id="exampleInputAuthenticationKey">
							</div>
							<div class="radio outer-xs">
								<a href="forgot-password.php" class="forgot-password pull-right">Forgot your Password & Authentication Key?</a>
							</div>
							<button type="submit" class="btn-upper btn btn-primary checkout-page-button" name="login">Login</button>
						</form>
					</div>
					<!-- Sign-in -->

					<!-- create a new account -->
					<div class="col-md-6 col-sm-6 create-new-account">
						<h4 class="checkout-subtitle">create a new account</h4>
						<p class="text title-tag-line">Create your own Shopping account.</p>
						<form class="register-form outer-top-xs" role="form" method="post" name="register" onSubmit="return valid();">
							<div class="form-group">
								<label class="info-title" for="fullname">Full Name <span>*</span></label>
								<input type="text" class="form-control unicase-form-control text-input" id="fullname" name="fullname" required="required">
							</div>


							<div class="form-group">
								<label class="info-title" for="exampleInputEmail2">Email Address <span>*</span></label>
								<input type="email" class="form-control unicase-form-control text-input" id="email" onBlur="userAvailability()" name="emailid" required>
								<span id="user-availability-status1" style="font-size:12px;"></span>
							</div>

							<div class="form-group">
								<label class="info-title" for="contactno">Contact No. <span>*</span></label>
								<input type="text" class="form-control unicase-form-control text-input" id="contactno" name="contactno" maxlength="10" required>
							</div>

							<div class="form-group">
								<label class="info-title" for="password">Password. <span>*</span></label>
								<input type="password" class="form-control unicase-form-control text-input" id="password" name="password" required>
							</div>

							<div class="form-group">
								<label class="info-title" for="confirmpassword">Confirm Password. <span>*</span></label>
								<input type="password" class="form-control unicase-form-control text-input" id="confirmpassword" name="confirmpassword" required>
							</div>
							<div class="form-group">
								<label class="info-title" for="authenticatiomkey">Authentication Key <span>*</span></label>
								<input type="password" class="form-control unicase-form-control text-input" id="auth" name="authenticationkey" required>
							</div>


							<button type="submit" name="submit" class="btn-upper btn btn-primary checkout-page-button" id="submit">Sign Up</button>
						</form>

						<span class="checkout-subtitle outer-top-xs">Register Now to Enjoy These Benefits:</span>

						<div class="checkbox">
							<label class="checkbox">
								Streamline your checkout process.
							</label>
							<label class="checkbox">
								Track your orders effortlessly.
							</label>
							<label class="checkbox">
								Keep track of all your purchases.
							</label>
						</div>
						<!-- create a new account -->
					</div><!-- /.row -->
				</div>
			</div>
		</div>
		<?php include('includes/footer.php'); ?>
		<script src="assets/js/jquery-1.11.1.min.js"></script>

		<script src="assets/js/bootstrap.min.js"></script>

		<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>

		<script src="assets/js/echo.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
		<script src="assets/js/bootstrap-slider.min.js"></script>
		<script src="assets/js/jquery.rateit.min.js"></script>
		<script type="text/javascript" src="assets/js/lightbox.min.js"></script>
		<script src="assets/js/bootstrap-select.min.js"></script>
		<script src="assets/js/wow.min.js"></script>
		<script src="assets/js/scripts.js"></script>




	</body>

</html>