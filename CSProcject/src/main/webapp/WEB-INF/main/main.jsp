<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Travelo</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../layout/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
	
	<!-- 폰트 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

    <!-- CSS here -->
    <link rel="stylesheet" href="../layout/css/bootstrap.min.css">
    <link rel="stylesheet" href="../layout/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../layout/css/magnific-popup.css">
    <link rel="stylesheet" href="../layout/css/font-awesome.min.css">
    <link rel="stylesheet" href="../layout/css/themify-icons.css">
    <link rel="stylesheet" href="../layout/css/nice-select.css">
    <link rel="stylesheet" href="../layout/css/flaticon.css">
    <link rel="stylesheet" href="../layout/css/gijgo.css">
    <link rel="stylesheet" href="../layout/css/animate.css">
    <link rel="stylesheet" href="../layout/css/slick.css">
    <link rel="stylesheet" href="../layout/css/slicknav.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="https://kit.fontawesome.com/d65519dfe2.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../layout/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
<body>
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	<div style="min-height: 1100px;">
		<tiles:insertAttribute name="home"/>
	</div>
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>
	
	

<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    
    <!-- JS here -->
    <script src="../layout/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="../layout/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../layout/js/popper.min.js"></script>
    <script src="../layout/js/bootstrap.min.js"></script>
    <script src="../layout/js/owl.carousel.min.js"></script>
    <script src="../layout/js/isotope.pkgd.min.js"></script>
    <script src="../layout/js/ajax-form.js"></script>
    <script src="../layout/js/waypoints.min.js"></script>
    <script src="../layout/js/jquery.counterup.min.js"></script>
    <script src="../layout/js/imagesloaded.pkgd.min.js"></script>
    <script src="../layout/js/scrollIt.js"></script>
    <script src="../layout/js/jquery.scrollUp.min.js"></script>
    <script src="../layout/js/wow.min.js"></script>
    <script src="../layout/js/nice-select.min.js"></script>
    <script src="../layout/js/jquery.slicknav.min.js"></script>
    <script src="../layout/js/jquery.magnific-popup.min.js"></script>
    <script src="../layout/js/plugins.js"></script>
    <script src="../layout/js/gijgo.min.js"></script>
    <script src="../layout/js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="../layout/js/contact.js"></script>
    <script src="../layout/js/jquery.ajaxchimp.min.js"></script>
    <script src="../layout/js/jquery.form.js"></script>
    <script src="../layout/js/jquery.validate.min.js"></script>
    <script src="../layout/js/mail-script.js"></script>


    <script src="../layout/js/main.js"></script>
<!--     <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script> -->
    
</body>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
$(function() {
	var today=new Date();
	var tomorrow = new Date(today.setDate(today.getDate()+1))
 	$('input[name="daterange"]').daterangepicker({
	    "startDate": new Date(),
	    "endDate": tomorrow
	}, function(start, end, label) {
	  	console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
});
</script>
</html>