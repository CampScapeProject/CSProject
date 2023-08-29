<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 관리자 페이지</title>
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../layout/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../layout/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/d65519dfe2.js" crossorigin="anonymous"></script>
<style type="text/css">
	
    .mypage-title {
        margin-top: 40px;
        background: linear-gradient(142.94deg, #7fb88d 7.53%, #41644A 103.72%);
        border-radius: 20px 20px 0px 0px;
        color: white;
        width: 200px;
        height: 120px;
        position: relative;
        padding-top: 25px;
        font-family: 'Jua', sans-serif;
        font-size: 32px;
    }
    
    .mypage-menu {
    	margin-top: -40px;
        background-color: white;
        border: 1px solid #AAAAAA;
        border-radius: 20px;
        position: absolute;
        width: 200px;
        height: 650px;
        padding: 30px;
    }
    
    .nav-menu-li {
        list-style-type: none;
        line-height: 30px;
        font-size: 14px;
        font-weight: 500;
        margin-bottom: 15px;
        padding-left: 5px;
    }
    
    h4 {
    	font-weight: 500;
    }
    
</style>
</head>
<body>
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	<div style="min-height: 900px;width: 1300px;margin: 0 auto;">
		<div class="mypage text-center">
			<div class="row">
				<div class="col-lg-2">
					<tiles:insertAttribute name="menu"/>
				</div>
				<div class="col-lg-10">
					<tiles:insertAttribute name="content"/>
				</div>
			</div>
		</div>
	</div>
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>


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
</body>
</html>