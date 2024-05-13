<?php
session_start();

$fullName = '';

if (isset($_SESSION['id'])) { 
    include('includes/config.php');

    $userId = $_SESSION['id'];

    $sql = "SELECT firstName, lastName FROM userregistration WHERE id = ?";
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $fullName = $row['firstName'] . ' ' . $row['lastName'];
    }
}

?>

<div class="brand clearfix">
    <a href="#" class="logo"><img src="img/VITLogo.png" width="120" height="40" alt="Your Logo"></a>
    <span class="menu-btn"><i class="fa fa-bars"></i></span>
    <ul class="ts-profile-nav">
        <li class="ts-account">
            <a href="#"> <?php echo $fullName; ?> <i class="fa fa-angle-down hidden-side"></i></a>
            <ul>
                <li><a href="my-profile.php">My Account (Student)</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </li>
    </ul>
</div>

<?php
if (!isset($_SESSION['id'])) { ?>
<div class="brand clearfix">
    <a href="#" class="logo"><img src="img/VITLogo.png" width="120" height="40" alt="Your Logo"></a>
    <span class="menu-btn"><i class="fa fa-bars"></i></span>
</div>
<?php } ?>
