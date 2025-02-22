<?php
include('includes/config.php');
// if(strlen($_SESSION['login'])==0)
//     {   
// header('location:index.php');
// }

require_once('vendor/autoload.php'); 

\Stripe\Stripe::setApiKey('sk_test_51OrDv4AXbQuutuLgSnKMtVqc6sNlHpCVYNNlRZ2CEQJ7eW83VoNlkxDgXJplEkTouEevkWa8nNcGELb7LMsIdCDm00RFiFRcm2');

$amount = $_GET['amount'] * 100; // Get amount from URL
; // Convert amount to cents
$currency = 'GBP'; // Change according to your currency


$protocol = !empty($_SERVER['HTTPS']) ? 'https://' : 'http://';
$domain = $_SERVER['HTTP_HOST'];
$success_url = $protocol . $domain . '/easyhomegoods/order-history.php?session_id={CHECKOUT_SESSION_ID}';
$cancel_url = $protocol . $domain . '/easyhomegoods/index.php';

try {
    $session = \Stripe\Checkout\Session::create([
        'payment_method_types' => ['card'],
        'line_items' => [[
            'price_data' => [
                'currency' => $currency,
                'unit_amount' => $amount,
                'product_data' => [
                    'name' => 'Easy Home Goods', // Change this
                    'images' => ['https://img.freepik.com/premium-vector/secure-payment-credit-card-icon-with-shield-secure-transaction-vector-stock-illustration_100456-11325.jpg'], // Add your image URL here
                    'description' => 'Thanks For Purchasing',

                ],
            ],
            'quantity' => 1,
        ]],
        'mode' => 'payment',
        'success_url' => $success_url,
        'cancel_url' => $cancel_url, // Redirect if payment is canceled
    ]);

    header('Location: ' . $session->url);
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
}
?>
