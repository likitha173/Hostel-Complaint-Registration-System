<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();

// Code for registration
if (isset($_POST['submit'])) {
    $blockno = $_POST['block'];
    $roomno = $_POST['room'];
    $seater = $_POST['seater'];
    $stayfrom = $_POST['stayf'];
    $duration = $_POST['duration'];
    $regno = $_POST['regno'];
    $fname = $_POST['fname'];
    $mname = $_POST['mname'];
    $lname = $_POST['lname'];
    $gender = $_POST['gender'];
    $contactno = $_POST['contact'];
    $emailid = $_POST['email'];
    $emcntno = $_POST['econtact'];
    $gurname = $_POST['gname'];
    $gurrelation = $_POST['grelation'];
    $gurcntno = $_POST['gcontact'];
    $paddress = $_POST['paddress'];
    $pcity = $_POST['pcity'];
    $pstate = $_POST['pstate'];
    $ppincode = $_POST['ppincode'];

    $result = "SELECT count(*) FROM userRegistration WHERE email=? OR regNo=?";
    $stmt = $mysqli->prepare($result);
    $stmt->bind_param('ss', $emailid, $regno);
    $stmt->execute();
    $stmt->bind_result($count);
    $stmt->fetch();
    $stmt->close();

    if ($count > 0) {
        echo "<script>alert('Registration number or email id already registered.');</script>";
    } else {
        $query = "INSERT INTO registration(blockno, roomno, seater, stayfrom, duration, regno, firstName, middleName, lastName, gender, contactno, emailid, egycontactno, guardianName, guardianRelation, guardianContactno, pmntAddress, pmntCity, pmnatetState, pmntPincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param('sssisssssssisssssssi', $blockno, $roomno, $seater, $stayfrom, $duration, $regno, $fname, $mname, $lname, $gender, $contactno, $emailid, $emcntno, $gurname, $gurrelation, $gurcntno, $paddress, $pcity, $pstate, $ppincode);
        $stmt->execute();
        $stmt->close();

        $query1 = "INSERT INTO userregistration(regNo, firstName, middleName, lastName, gender, contactNo, email, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt1 = $mysqli->prepare($query1);
        $stmt1->bind_param('ssssssss', $regno, $fname, $mname, $lname, $gender, $contactno, $emailid, $contactno);
        $stmt1->execute();
        echo "<script>alert('Student Successfully registered');</script>";
    }
}
?>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="theme-color" content="#325d88">
    <title>Student Hostel Registration</title>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <link rel="stylesheet" href="css/fileinput.min.css">
    <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-1.11.3-jquery.min.js"></script>
    <script type="text/javascript" src="js/validation.min.js"></script>
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script>
        function getSeater(val) {
            // Removed since you do not want to get the seater from the server
        }
    </script>
</head>
<body>
    <?php include('includes/header.php'); ?>
    <div class="ts-main-content">
        <?php include('includes/sidebar.php'); ?>
        <div class="content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="page-title">Registration</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">Fill all Info</div>
                                    <div class="panel-body">
                                        <form method="post" action="" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"><h4 style="color: green" align="left">Room Related info</h4></label>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Block no.</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="block" id="block" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Room no.</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="room" id="room" class="form-control" required onBlur="checkRoomAvailability()">
                                                    <span id="room-availability-status" style="font-size:12px;"></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Seater</label>
                                                <div class="col-sm-8">
                                                    <select name="seater" id="seater" class="form-control" required>
                                                        <option value="">Select Seater Type</option>
                                                        <option value="1 Bedded Non-AC">1 Bedded Non-AC</option>
                                                        <option value="2 Bedded AC">2 Bedded AC</option>
                                                        <option value="2 Bedded Non-AC">2 Bedded Non-AC</option>
                                                        <option value="3 Bedded AC">3 Bedded AC</option>
                                                        <option value="3 Bedded Non-AC">3 Bedded Non-AC</option>
                                                        <option value="4 Bedded AC">4 Bedded AC</option>
                                                        <option value="4 Bedded Non-AC">4 Bedded Non-AC</option>
                                                        <option value="6 Bedded AC">6 Bedded AC</option>
                                                        <option value="6 Bedded Non-AC">6 Bedded Non-AC</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Stay From</label>
                                                <div class="col-sm-8">
                                                    <input type="date" name="stayf" id="stayf" class="form-control">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Duration</label>
                                                <div class="col-sm-8">
                                                    <select name="duration" id="duration" class="form-control">
                                                        <option value="">Select Duration in Month</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"><h4 style="color: green" align="left">Personal info</h4></label>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Registration No. :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="regno" id="regno" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">First Name : </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="fname" id="fname" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Middle Name : </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="mname" id="mname" class="form-control">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Last Name : </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="lname" id="lname" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Gender : </label>
                                                <div class="col-sm-8">
                                                    <select name="gender" class="form-control" required="required">
                                                        <option value="">Select Gender</option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>
                                                        <option value="other">Other</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Contact No : </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="contact" id="contact" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Email id : </label>
                                                <div class="col-sm-8">
                                                    <input type="email" name="email" id="email" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Emergency Contact: </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="econtact" id="econtact" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"><h4 style="color: green" align="left">Guardian's info</h4></label>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Guardian Name :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="gname" id="gname" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Guardian Relation :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="grelation" id="grelation" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Guardian Contact no :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="gcontact" id="gcontact" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label"><h4 style="color: green" align="left">Correspondence Address</h4></label>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Address :</label>
                                                <div class="col-sm-8">
                                                    <textarea rows="5" name="paddress" id="paddress" class="form-control" required="required"></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">City :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="pcity" id="pcity" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">State :</label>
                                                <div class="col-sm-8">
                                                    <select name="pstate" id="pstate" class="form-control" required="required">
                                                        <option value="">Select State</option>
                                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                                        <option value="Assam">Assam</option>
                                                        <option value="Bihar">Bihar</option>
                                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                                        <option value="Goa">Goa</option>
                                                        <option value="Gujarat">Gujarat</option>
                                                        <option value="Haryana">Haryana</option>
                                                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                                        <option value="Jharkhand">Jharkhand</option>
                                                        <option value="Karnataka">Karnataka</option>
                                                        <option value="Kerala">Kerala</option>
                                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                                        <option value="Maharashtra">Maharashtra</option>
                                                        <option value="Manipur">Manipur</option>
                                                        <option value="Meghalaya">Meghalaya</option>
                                                        <option value="Mizoram">Mizoram</option>
                                                        <option value="Nagaland">Nagaland</option>
                                                        <option value="Odisha">Odisha</option>
                                                        <option value="Punjab">Punjab</option>
                                                        <option value="Rajasthan">Rajasthan</option>
                                                        <option value="Sikkim">Sikkim</option>
                                                        <option value="Tamil Nadu">Tamil Nadu</option>
                                                        <option value="Telangana">Telangana</option>
                                                        <option value="Tripura">Tripura</option>
                                                        <option value="Uttarakhand">Uttarakhand</option>
                                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                        <option value="West Bengal">West Bengal</option>
                                                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                                        <option value="Chandigarh">Chandigarh</option>
                                                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                                                        <option value="Daman and Diu">Daman and Diu</option>
                                                        <option value="Lakshadweep">Lakshadweep</option>
                                                        <option value="Delhi">Delhi</option>
                                                        <option value="Puducherry">Puducherry</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Pincode :</label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="ppincode" id="ppincode" class="form-control" required="required">
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-sm-offset-4">
                                                <button class="btn btn-default" type="submit">Cancel</button>
                                                <input type="submit" name="submit" Value="Register" class="btn btn-primary">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/fileinput.js"></script>
    <script src="js/chartData.js"></script>
    <script src="js/main.js"></script>
</body>


<script type="text/javascript">
	$(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
                $('#paddress').val( $('#address').val() );
                $('#pcity').val( $('#city').val() );
                $('#pstate').val( $('#state').val() );
                $('#ppincode').val( $('#pincode').val() );
            } 
            
        });
    });
</script>
	<script>
function checkAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'roomno='+$("#room").val(),
type: "POST",
success:function(data){
$("#room-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>

	<script>
function checkAvailability() {

$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'emailid='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function ()
{
event.preventDefault();
alert('error');
}
});
}
</script>
	<script>
function checkRegnoAvailability() {

$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'regno='+$("#regno").val(),
type: "POST",
success:function(data){
$("#user-reg-availability").html(data);
$("#loaderIcon").hide();
},
error:function ()
{
event.preventDefault();
alert('error');
}
});
}
</script>

</html>