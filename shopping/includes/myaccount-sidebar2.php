<?php

$amount = $_SESSION['tp'] = "$totalprice" . ".00";
// $amount = $_POST['totalpaymentamount'];
?>
<div class="col-md-4">
	<!-- checkout-progress-sidebar -->
	<div class="checkout-progress-sidebar ">
		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="unicase-checkout-title">Procceed to payment
					</h4>
				</div>
				<div class="panel-body">
					<ul class="nav nav-checkout-progress list-unstyled">
						<li><a class="btn" style="background-color: #540505; color : white; text-transform : capitalize;"  href="payment-method.php?amount=<?php echo $amount; ?>">Procceed to pay</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- checkout-progress-sidebar -->
</div>