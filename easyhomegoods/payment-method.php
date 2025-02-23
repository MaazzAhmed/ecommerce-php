<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['login']) == 0) {
    header('location:login.php');
} else {
    if (isset($_POST['submit'])) {
        $paymentMethod = $_POST['paymethod'];
		
        if ($paymentMethod == 'Debit / Credit card') {
			mysqli_query($con, "update orders set paymentMethod='$paymentMethod' where userId='" . $_SESSION['id'] . "' and paymentMethod is null ");
			$amount = urlencode($_SESSION['tp']);
            header('location:debit-credit-card.php?amount=' . $amount);
          
        } else {
            mysqli_query($con, "update orders set paymentMethod='$paymentMethod' where userId='" . $_SESSION['id'] . "' and paymentMethod is null ");
            unset($_SESSION['cart']);
            header('location:order-history.php');
            exit; 
        }
    }
	


?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<!-- Meta -->
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
		<link rel="stylesheet" href="assets/css/green.css">
		<link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		<link rel="shortcut icon" href="assets/images/favicon.ico">
	</head>

	<body class="student-1

">


		<header class="header-style-1">
			<?php include('includes/top-header.php'); ?>
			<?php include('includes/main-header.php'); ?>
			<?php include('includes/menu-bar.php'); ?>
		</header>
		<div class="breadcrumb">
			<div class="container">
				<div class="breadcrumb-inner">
					<ul class="list-inline list-unstyled">
						<li><a href="home.html">Home</a></li>
						<li class='active'>Payment Method</li>
					</ul>
				</div><!-- /.breadcrumb-inner -->
			</div><!-- /.container -->
		</div><!-- /.breadcrumb -->

		<div class="body-content outer-top-bd">
			<div class="container">
				<div class="checkout-box faq-page inner-bottom-sm">
					<div class="row">
						<div class="col-md-12">
							<h2>Choose Payment Method</h2>
							<div class="panel-group checkout-steps" id="accordion">
								<!-- checkout-step-01  -->
								<div class="panel panel-default checkout-step-01">

									<!-- panel-heading -->
									<div class="panel-heading">
										<h4 class="unicase-checkout-title">
											<a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
												Select your Payment Method
											</a>
										</h4>
									</div>
									<!-- panel-heading -->

									<div id="collapseOne" class="panel-collapse collapse in">

										<!-- panel-body  -->
										<div class="panel-body">
											<form name="payment" method="post">
												<input type="radio" name="paymethod" value="COD" checked="checked"> COD
												<input type="radio" name="paymethod" value="Debit / Credit card"> Debit / Credit card <?php 	$_SESSION['tp'] = $totalprice . ".00"; ?><br /><br />
												<input type="submit" value="submit" name="submit" class="btn btn-primary">


											</form>
										</div>
										<!-- panel-body  -->

									</div><!-- row -->
								</div>
								<!-- checkout-step-01  -->


							</div><!-- /.checkout-steps -->
						</div>
					</div><!-- /.row -->
				</div><!-- /.checkout-box -->
				<!-- ============================================== BRANDS CAROUSEL ============================================== -->
				<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
			</div><!-- /.container -->
		</div><!-- /.body-content -->
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