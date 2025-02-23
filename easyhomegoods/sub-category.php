<?php
session_start();
error_reporting(0);
include('includes/config.php');
$cid = intval($_GET['scid']);
if (isset($_GET['action']) && $_GET['action'] == "add") {
	$id = intval($_GET['id']);
	if (isset($_SESSION['cart'][$id])) {
		$_SESSION['cart'][$id]['quantity']++;
	} else {
		$sql_p = "SELECT * FROM products WHERE id={$id}";
		$query_p = mysqli_query($con, $sql_p);
		if (mysqli_num_rows($query_p) != 0) {
			$row_p = mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productPrice']);
			header('location:my-cart.php');
		} else {
			$message = "Product ID is invalid";
		}
	}
}
// COde for Wishlist
if (isset($_GET['pid']) && $_GET['action'] == "wishlist") {
	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {
		mysqli_query($con, "insert into wishlist(userId,productId) values('" . $_SESSION['id'] . "','" . $_GET['pid'] . "')");
		echo "<script>alert('Product aaded in wishlist');</script>";
		header('location:my-wishlist.php');
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
	</div><!-- /.breadcrumb -->
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row outer-bottom-sm'>
				<div class='col-md-3 sidebar'>
					<!-- ================================== TOP NAVIGATION ================================== -->
					<!-- ================================== TOP NAVIGATION : END ================================== -->
					<div class="sidebar-module-container">
						<h3 class="section-title">shop by</h3>
						<div class="sidebar-filter">
							<!-- ============================================== SIDEBAR CATEGORY ============================================== -->
							<div class="sidebar-widget wow fadeInUp outer-bottom-xs" >
								<div class="widget-header m-t-20" style="background-color: #0a093e;">
									<h4 class="widget-title" style="color: white;">Category</h4>
								</div>
								<div class="sidebar-widget-body m-t-10">
									<?php $sql = mysqli_query($con, "select id,categoryName  from category");
									while ($row = mysqli_fetch_array($sql)) {
									?>
										<div class="accordion">
											<div class="accordion-group">
												<div class="accordion-heading">
													<a href="category.php?cid=<?php echo $row['id']; ?>" class="accordion-toggle collapsed">
														<?php echo $row['categoryName']; ?>
													</a>
												</div>
											</div>
										</div>
									<?php } ?>
								</div><!-- /.sidebar-widget-body -->
							</div><!-- /.sidebar-widget -->




							<!-- ============================================== COLOR: END ============================================== -->

						</div><!-- /.sidebar-filter -->
					</div><!-- /.sidebar-module-container -->
				</div><!-- /.sidebar -->
				<div class='col-md-9'>
					<!-- ========================================== SECTION – HERO ========================================= -->

					<div id="category" class="category-carousel hidden-xs">
						<div class="item">
							<div class="image">
								<h3>Category</h3>
							</div>
							<div class="container-fluid">
								<div class="caption vertical-top text-left">
								<?php $sql = mysqli_query($con, "select subcategory  from subcategory where id='$cid'");
									while ($row = mysqli_fetch_array($sql)) {
									?>
										<div class="big-text" style="padding-left: 180px;">
										<?php echo htmlentities($row['subcategory']); ?>
										<?php } ?>
										<br />
										</div>


										<div class="excerpt hidden-sm hidden-md">
										</div>

								</div><!-- /.caption -->
							</div><!-- /.container-fluid -->
						</div>
					</div>

					<div class="search-result-container">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active " id="grid-container">
								<div class="category-product  inner-top-vs">
									<div class="row">
										<?php
										$ret = mysqli_query($con, "select * from products where subCategory='$cid'");
										$num = mysqli_num_rows($ret);
										if ($num > 0) {
											while ($row = mysqli_fetch_array($ret)) { ?>
												<div class="col-sm-6 col-md-4 wow fadeInUp">
													<div class="products">
														<div class="product">
															<div class="product-image">
																<div class="image">
																	<a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>"><img src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" alt="" width="200" height="300"></a>
																</div><!-- /.image -->
															</div><!-- /.product-image -->


															<div class="product-info text-left">
																<h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>"><?php echo htmlentities($row['productName']); ?></a></h3>
																<div class="rating rateit-small"></div>
																<div class="description"></div>

																<div class="product-price">
																	<span class="price">
																		$ <?php echo htmlentities($row['productPrice']); ?> </span>
																	<span class="price-before-discount">$ <?php echo htmlentities($row['productPriceBeforeDiscount']); ?></span>

																</div><!-- /.product-price -->

															</div><!-- /.product-info -->
															<div class="cart clearfix animate-effect">
																<div class="action">
																	<ul class="list-unstyled">
																		<li class="add-cart-button btn-group">
																			<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
																				<i class="fa fa-shopping-cart"></i>
																			</button>
																			<a href="category.php?page=product&action=add&id=<?php echo $row['id']; ?>">
																				<button class="btn btn-primary" type="button">Add to cart</button></a>

																		</li>

																		<li class="lnk wishlist">
																			<a class="add-to-cart" href="category.php?pid=<?php echo htmlentities($row['id']) ?>&&action=wishlist" title="Wishlist">
																				<i class="icon fa fa-heart"></i>
																			</a>
																		</li>


																	</ul>
																</div><!-- /.action -->
															</div><!-- /.cart -->
														</div>
													</div>
												</div>
											<?php }
										} else { ?>

											<div class="col-sm-6 col-md-4 wow fadeInUp">
												<h3>No Product Found</h3>
											</div>

										<?php } ?>










									</div><!-- /.row -->
								</div><!-- /.category-product -->

							</div><!-- /.tab-pane -->



						</div><!-- /.search-result-container -->

					</div><!-- /.col -->
				</div>
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
	<script src="assets/js/scripts.js"></script>






</body>

</html>