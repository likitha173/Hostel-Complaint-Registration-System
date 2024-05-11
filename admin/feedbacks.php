<?php
session_start();
include('includes/config.php');
include('includes/checklogin.php');
check_login();

if(isset($_GET['del']))
{
	$id=intval($_GET['del']);
	$adn="delete from registration where regNo=?";
		$stmt= $mysqli->prepare($adn);
		$stmt->bind_param('i',$id);
        $stmt->execute();
        $stmt->close();	   


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
	<meta name="theme-color" content="#3e454c">
	<title>Manage Rooms</title>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<link rel="stylesheet" href="css/fileinput.min.css">
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<link rel="stylesheet" href="css/style.css">
<script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+510+',height='+430+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}
</script>

</head>

<body>
	<?php include('includes/header.php');?>

	<div class="ts-main-content">
			<?php include('includes/sidebar.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title" style="margin-top:4%">Student Feedback</h2>
						<div class="panel panel-default">
    <div class="panel-heading">All Feedback Details</div>
    <div class="panel-body">
        <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sno.</th>
                    <th>Student Name</th>
                    <th>Reg No</th>
                    <th>Room No</th>
                    <th>Feedback Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $query = "SELECT * FROM feedback";
                $result = $mysqli->query($query);
                $cnt = 1;
                while ($row = $result->fetch_assoc()) {
                    ?>
                    <tr>
                        <td><?php echo $cnt; ?></td>
                        <td><?php echo $row['StudentName']; ?></td>
                        <td><?php echo $row['RegNo']; ?></td>
                        <td><?php echo $row['roomNo']; ?></td>
                        <td><?php echo $row['FeedbackMessage']; ?></td>
                        <td><a href="feedback-details.php?id=<?php echo $row['id']; ?>">View Details</a></td>
                    </tr>
                    <?php
                    $cnt++;
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<?php	
$aid=$_SESSION['id'];
$ret="SELECT r.regno, CONCAT(ur.firstName, ' ', ur.middleName, ' ', ur.lastName) AS studentName, r.roomno, r.seater, r.stayfrom, f.postinDate
FROM registration r
JOIN userregistration ur ON r.emailid = ur.email
JOIN feedback f ON ur.id = f.userId";

$stmt= $mysqli->prepare($ret) ;
//$stmt->bind_param('i',$aid);
$stmt->execute() ;//ok
$res=$stmt->get_result();
$cnt=1;
while($row=$res->fetch_object())
	  {
	  	?>
<tr><td><?php echo $cnt;;?></td>
<td><?php echo $row->firstName;?><?php echo $row->middleName;?><?php echo $row->lastName;?></td>
<td><?php echo $row->regno;?></td>
<td><?php echo $row->roomno;?></td>
<td><?php echo $row->seater;?></td>
<td><?php echo $row->stayfrom;?></td>
<td><?php echo $row->postinDate;?></td>
<td>
<a href="feedback-details.php?regno=<?php echo $row->regno;?>&&uid=<?php echo $row->userId;?>" title="View Full Details" target="blank"><i class="fa fa-desktop"></i></a>&nbsp;&nbsp;
</td>
										</tr>
									<?php
$cnt=$cnt+1;
									 } ?>
											
										
									</tbody>
								</table>

								
							</div>
						</div>

					
					</div>
				</div>

			

			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>

</body>

</html>
