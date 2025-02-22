
<?php
session_start();
include('include/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
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


?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo ucfirst(basename($_SERVER['PHP_SELF'], '.php'))?>- TechMart</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/images/favicon.ico">


	<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>
</head>
<body>
<?php include('include/header.php');?>

	<div class="wrapper">
		<div class="container">
			<div class="row">
<?php include('include/sidebar.php');?>				
			<div class="span9">
					<div class="content">

	<div class="module">
							<div class="module-head">
								<h3>Pending Orders</h3>
							</div>
							<div class="module-body table">
	<?php if(isset($_GET['del']))
{?>
									<div class="alert alert-error">
										<button type="button" class="close" data-dismiss="alert">×</button>
									<strong>Oh snap!</strong> 	<?php echo htmlentities($_SESSION['delmsg']);?><?php echo htmlentities($_SESSION['delmsg']="");?>
									</div>
<?php } ?>

									<br />

							
									<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped display table-responsive">
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email / Contact no</th>
            <th>Shipping Address</th>
            <th>Product</th>
            <th>Qty</th>
            <th>Amount</th>
            <th>Order Date</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $f1 = "00:00:00";
        $from = date('Y-m-d') . " " . $f1;
        $t1 = "23:59:59";
        $to = date('Y-m-d') . " " . $t1;
        $query = mysqli_query($con, "SELECT users.name AS username, users.email AS useremail, users.contactno AS usercontact, users.shippingAddress AS shippingaddress, users.shippingCity AS shippingcity, users.shippingState AS shippingstate, users.shippingPincode AS shippingpincode, products.productName AS productname, products.shippingCharge AS shippingcharge, orders.quantity AS quantity, orders.orderDate AS orderdate, products.productPrice AS productprice, orders.id AS id FROM orders JOIN users ON orders.userId=users.id JOIN products ON products.id=orders.productId WHERE orders.orderDate BETWEEN '$from' AND '$to'");
        $cnt = 1;
        while ($row = mysqli_fetch_array($query)) {
        ?>
            <tr>
                <td><?php echo htmlentities($cnt); ?></td>
                <td><?php echo htmlentities($row['username']); ?></td>
                <td><?php echo htmlentities($row['useremail']); ?> / <?php echo htmlentities($row['usercontact']); ?></td>
                <td><?php echo htmlentities($row['shippingaddress'] . ", " . $row['shippingcity'] . ", " . $row['shippingstate'] . " - " . $row['shippingpincode']); ?></td>
                <td><?php echo htmlentities($row['productname']); ?></td>
                <td><?php echo htmlentities($row['quantity']); ?></td>
                <td><?php echo htmlentities($row['quantity'] * $row['productprice'] + $row['shippingcharge']); ?></td>
                <td><?php echo htmlentities($row['orderdate']); ?></td>
                <td><a href="updateorder.php?oid=<?php echo htmlentities($row['id']); ?>" title="Update order" target="_blank"><i class="icon-edit"></i></a></td>
            </tr>
        <?php
            $cnt = $cnt + 1;
        }
        ?>
    </tbody>
</table>

							</div>
						</div>						

						
						
					</div><!--/.content-->
				</div><!--/.span9-->
			</div>
		</div><!--/.container-->
	</div><!--/.wrapper-->

<?php include('include/footer.php');?>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="scripts/datatables/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('.datatable-1').dataTable();
			$('.dataTables_paginate').addClass("btn-group datatable-pagination");
			$('.dataTables_paginate > a').wrapInner('<span />');
			$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
			$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
		} );
	</script>
</body>
<?php } ?>