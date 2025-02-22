<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['login']) == 0) {
	header('location:index.php');
} else {
	if (isset($_POST['update'])) {
		$name = $_POST['name'];
		$contactno = $_POST['contactno'];
		$query = mysqli_query($con, "update users set name='$name',contactno='$contactno' where id='" . $_SESSION['id'] . "'");
		if ($query) {
			echo "<script>alert('Your info has been updated');</script>";
		}
	}


	$timezone = 'UTC';

	if (isset($_POST['timezone'])) {
		$timezone = $_POST['timezone'];
	} elseif (isset($_COOKIE['timezone'])) {
		$timezone = $_COOKIE['timezone'];
	} elseif (isset($_SESSION['timezone'])) {
		$timezone = $_SESSION['timezone'];
	} elseif (function_exists('date_default_timezone_get')) {
		$timezone = @date_default_timezone_get();
	}

	date_default_timezone_set($timezone);
	$currentTime = date('d-m-Y h:i:s A', time());


	if (isset($_POST['submit'])) {
		$sql = mysqli_query($con, "SELECT password FROM  users where password='" . md5($_POST['cpass']) . "' && id='" . $_SESSION['id'] . "'");
		$num = mysqli_fetch_array($sql);
		if ($num > 0) {
			$con = mysqli_query($con, "update students set password='" . md5($_POST['newpass']) . "', updationDate='$currentTime' where id='" . $_SESSION['id'] . "'");
			echo "<script>alert('Password Changed Successfully !!');</script>";
		} else {
			echo "<script>alert('Current Password not match !!');</script>";
		}
	}

	if (isset($_POST['auth'])) {
		$currentAuthKey = md5($_POST['currentauthkey']);
		$newAuthKey = md5($_POST['newauthkey']);
		$confirmNewAuthKey = md5($_POST['cnfnewauthkey']);

		$sql = mysqli_query($con, "SELECT authenticationkey FROM  users where authenticationkey='" . $currentAuthKey . "' && id='" . $_SESSION['id'] . "'");
		$num = mysqli_fetch_array($sql);
		if ($num > 0) {
			if ($newAuthKey === $confirmNewAuthKey) {
				$con = mysqli_query($con, "update students set authenticationkey='" . $newAuthKey . "', updationDate='$currentTime' where id='" . $_SESSION['id'] . "'");
				echo "<script>alert('Authentication Key Changed Successfully !!');</script>";
			} else {
				echo "<script>alert('New Authentication Key and Confirm New Authentication Key do not match !!');</script>";
			}
		} else {
			echo "<script>alert('Current Authentication Key does not match !!');</script>";
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


		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.ico">
		<script type="text/javascript">
			function valid() {
				if (document.chngpwd.cpass.value == "") {
					alert("Current Password Filed is Empty !!");
					document.chngpwd.cpass.focus();
					return false;
				} else if (document.chngpwd.newpass.value == "") {
					alert("New Password Filed is Empty !!");
					document.chngpwd.newpass.focus();
					return false;
				} else if (document.chngpwd.cnfpass.value == "") {
					alert("Confirm Password Filed is Empty !!");
					document.chngpwd.cnfpass.focus();
					return false;
				} else if (document.chngpwd.newpass.value != document.chngpwd.cnfpass.value) {
					alert("Password and Confirm Password Field do not match  !!");
					document.chngpwd.cnfpass.focus();
					return false;
				}
				return true;
			}
		</script>
		<script type="text/javascript">
			function validAuth() {
				if (document.chngauthkey.currentauthkey.value == "") {
					alert("Current Authentication Key Field is Empty !!");
					document.chngauthkey.currentauthkey.focus();
					return false;
				} else if (document.chngauthkey.newauthkey.value == "") {
					alert("New Authentication Key Field is Empty !!");
					document.chngauthkey.newauthkey.focus();
					return false;
				} else if (document.chngauthkey.cnfnewauthkey.value == "") {
					alert("Confirm New Authentication Key Field is Empty !!");
					document.chngauthkey.cnfnewauthkey.focus();
					return false;
				} else if (document.chngauthkey.newauthkey.value != document.chngauthkey.cnfnewauthkey.value) {
					alert("New Authentication Key and Confirm New Authentication Key Fields do not match  !!");
					document.chngauthkey.cnfnewauthkey.focus();
					return false;
				}
				return true;
			}
		</script>

	</head>

	<body class="student-1

">
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
						<li><a href="#">Home</a></li>
						<li class='active'>Checkout</li>
					</ul>
				</div><!-- /.breadcrumb-inner -->
			</div><!-- /.container -->
		</div><!-- /.breadcrumb -->

		<div class="body-content outer-top-bd">
			<div class="container">
				<div class="checkout-box inner-bottom-sm">
					<div class="row">
						<div class="col-md-8">
							<div class="panel-group checkout-steps" id="accordion">
								<!-- checkout-step-01  -->
								<div class="panel panel-default checkout-step-01">

									<!-- panel-heading -->
									<div class="panel-heading">
										<h4 class="unicase-checkout-title">
											<a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
												<span>1</span>My Profile
											</a>
										</h4>
									</div>
									<!-- panel-heading -->

									<div id="collapseOne" class="panel-collapse collapse in">

										<!-- panel-body  -->
										<div class="panel-body">
											<div class="row">
												<h4>Personal info</h4>
												<div class="col-md-12 col-sm-12 already-registered-login">

													<?php
													$query = mysqli_query($con, "select * from users where id='" . $_SESSION['id'] . "'");
													while ($row = mysqli_fetch_array($query)) {
													?>

														<form class="register-form" role="form" method="post">
															<div class="form-group">
																<label class="info-title" for="name">Name<span>*</span></label>
																<input type="text" class="form-control unicase-form-control text-input" value="<?php echo $row['name']; ?>" id="name" name="name" required="required">
															</div>



															<div class="form-group">
																<label class="info-title" for="exampleInputEmail1">Email Address <span>*</span></label>
																<input type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" value="<?php echo $row['email']; ?>" readonly>
															</div>
															<div class="form-group">
																<label class="info-title" for="Contact No.">Contact No. <span>*</span></label>
																<input type="text" class="form-control unicase-form-control text-input" id="contactno" name="contactno" required="required" value="<?php echo $row['contactno']; ?>" maxlength="10">
															</div>
															<button type="submit" name="update" class="btn-upper btn btn-primary checkout-page-button">Update</button>
														</form>
													<?php } ?>
												</div>
												<!-- already-registered-login -->

											</div>
										</div>
										<!-- panel-body  -->

									</div><!-- row -->
								</div>
								<!-- checkout-step-01  -->
								<!-- checkout-step-02  -->
								<div class="panel panel-default checkout-step-02">
									<div class="panel-heading">
										<h4 class="unicase-checkout-title">
											<a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseTwo">
												<span>2</span>Change Password
											</a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">

											<form class="register-form" role="form" method="post" name="chngpwd" onSubmit="return valid();">
												<div class="form-group">
													<label class="info-title" for="Current Password">Current Password<span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="cpass" name="cpass" required="required">
												</div>



												<div class="form-group">
													<label class="info-title" for="New Password">New Password <span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="newpass" name="newpass">
												</div>
												<div class="form-group">
													<label class="info-title" for="Confirm Password">Confirm Password <span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="cnfpass" name="cnfpass" required="required">
												</div>
												<button type="submit" name="submit" class="btn-upper btn btn-primary checkout-page-button">Change </button>
											</form>




										</div>
									</div>
								</div>
								<!-- checkout-step-02  -->

								<!-- checkout-step-03  -->
								<div class="panel panel-default checkout-step-03">
									<div class="panel-heading">
										<h4 class="unicase-checkout-title">
											<a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseThree">
												<span>3</span>Change Authentication Key
											</a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">

											<form class="register-form" role="form" method="post" name="chngauthkey" onSubmit="return validAuth();">
												<div class="form-group">
													<label class="info-title" for="Current Authentication Key">Current Authentication Key<span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="currentauthkey" name="currentauthkey" required="required">
												</div>

												<div class="form-group">
													<label class="info-title" for="New Authentication Key">New Authentication Key <span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="newauthkey" name="newauthkey">
												</div>
												<div class="form-group">
													<label class="info-title" for="Confirm New Authentication Key">Confirm New Authentication Key <span>*</span></label>
													<input type="password" class="form-control unicase-form-control text-input" id="cnfnewauthkey" name="cnfnewauthkey" required="required">
												</div>
												<button type="submit" name="auth" class="btn-upper btn btn-primary checkout-page-button">Change </button>
											</form>
										</div>
									</div>
								</div>
								<!-- checkout-step-03  -->

							</div><!-- /.checkout-steps -->
						</div>
						<?php include('includes/myaccount-sidebar.php'); ?>
					</div><!-- /.row -->
				</div><!-- /.checkout-box -->

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
<?php } ?>