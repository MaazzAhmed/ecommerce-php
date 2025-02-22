<?php
session_start();
include("includes/config.php");
$_SESSION['login']=="";
$timezone = 'UTC'; 

// User ke timezone ko detect karne ke liye, agar client side se timezone aaya hai
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
$ldate = date('d-m-Y h:i:s A', time());
mysqli_query($con,"UPDATE userlog  SET logout = '$ldate' WHERE userEmail = '".$_SESSION['login']."' ORDER BY id DESC LIMIT 1");
session_unset();
$_SESSION['errmsg']="You have successfully logout";
?>
<script language="javascript">
document.location="index.php";
</script>
