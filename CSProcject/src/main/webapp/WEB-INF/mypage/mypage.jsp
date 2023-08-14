<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
    .mypage {
        height: 100vh;
    }
	
    .mypage-title {
        margin-top: 80px;
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
        height: 600px;
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
<div class="container">
	<div class="mypage text-center">
	
		<div class="col-lg-2">
			<div class="mypage-title text-center">
				<span>마이페이지</span>
			</div>
			<div class="mypage-menu text-left">
				<h4>회원 정보</h4>
				<ul class="nav-menu-li">
					<li>- 정보 수정 / 탈퇴</li>
				</ul>
				
				<h4>캠핑장</h4>
				<ul class="nav-menu-li">
					<li>- 캠핑장 예약 정보</li>
					<li>- 내가 작성한 리뷰</li>
				</ul>
				
				<h4>렌터카</h4>
				<ul class="nav-menu-li">
					<li>- 렌터카 예약 정보</li>
					<li>- 내가 작성한 리뷰</li>
				</ul>
				
				<h4>캠핑용품</h4>
				<ul class="nav-menu-li">
					<li>- 주문 확인</li>
				</ul>
				
				<h4>레시피</h4>
				<ul class="nav-menu-li">
					<li>- 내가 찜한 레시피</li>
				</ul>
				
				<h5>내가 작성한 문의글</h5>
			</div>
		</div>
		
		<!-- 여기만 수정할것 제발... -->
		<div class="col-lg-10">
			<div class="mypage-main">
				<h3 class="text-left">마이페이지</h3>
			</div>
		</div>
	
	</div>
</div>
</body>
</html>