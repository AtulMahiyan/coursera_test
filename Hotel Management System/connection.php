<?php
   $con=mysqli_connect("localhost","root","","hotman");
   
   if(mysqli_connect_error())
   {
       echo"<script>alert('Cannot Connect');</script>";
       exit();
   }

?>