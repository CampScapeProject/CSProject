<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../layout/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

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

    .col-lg-10 {
    	margin-top: -130px;
    	margin-left: 250px;
    	background-color: red;
    	width: 160%;
    	height: 700px;
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
				<tiles:insertAttribute name="menu"/>
				<tiles:insertAttribute name="content"/>
		</div>
	</div>
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>

</body>
</html>