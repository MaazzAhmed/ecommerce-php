<?php
include('includes/config.php');
// if(strlen($_SESSION['login'])==0)
//     {   
// header('location:index.php');
// }

require_once('vendor/autoload.php'); 

\Stripe\Stripe::setApiKey('sk_test_51OqX2YIL2KheRhH7WHRRDfmyVs9nwYbNM4HBVgHc7iMhB3vG96qcxhYJKw1e6hpoKsThC0tmzahFJVp8eVV0R8My00TJJEsT3n');

$amount = $_GET['amount'] * 100; // Get amount from URL
; // Convert amount to cents
$currency = 'usd'; // Change according to your currency

try {
    $session = \Stripe\Checkout\Session::create([
        'payment_method_types' => ['card'],
        'line_items' => [[
            'price_data' => [
                'currency' => $currency,
                'unit_amount' => $amount,
                'product_data' => [
                    'name' => 'TechMart', // Change this
                    'images' => ['https://img.freepik.com/premium-vector/secure-payment-credit-card-icon-with-shield-secure-transaction-vector-stock-illustration_100456-11325.jpg'], // Add your image URL here
                    'description' => 'Thanks For Purchasing From Qadama.com',

                ],
            ],
            'quantity' => 1,
        ]],
        'mode' => 'payment',
        'success_url' => 'http://localhost/shopping/order-history.php?session_id={CHECKOUT_SESSION_ID}',
        'cancel_url' => 'http://localhost/shopping/index.php', // Redirect if payment is canceled
    ]);

    header('Location: ' . $session->url);
} catch (Exception $e) {
    echo 'Error: ' . $e->getMessage();
}
?>
