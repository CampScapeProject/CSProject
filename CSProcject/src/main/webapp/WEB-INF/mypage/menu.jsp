<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mypage-menu a{
		color: gray;
	}
	.mypage-menu a:hover{
		font-weight: bold;
		text-decoration: none;
	}
</style>
</head>
<body>
		<div class="col-lg-2">
			<div class="mypage-title text-center">
				<span>마이페이지</span>
			</div>
			<div class="mypage-menu text-left">
				<h4>회원 정보</h4>
				<ul class="nav-menu-li">
					<li><a href="../mypage/main.do">- 정보 수정 / 탈퇴</a></li>
				</ul>
				
				<h4>캠핑장</h4>
				<ul class="nav-menu-li">
					<li><a href="../mypage/camp_reserve.do">- 캠핑장 예약 정보</a></li>
					<li><a href="../mypage/camp_review.do">- 내가 작성한 리뷰</a></li>
					<li><a href="../mypage/camp_jjim.do">- 내가 찜한 목록</a></li>
				</ul>
				
				<h4>렌터카</h4>
				<ul class="nav-menu-li">
					<li><a href="../mypage/rent_reserve.do">- 렌터카 예약 정보</a></li>
					<li><a href="../mypage/rent_review.do">- 내가 작성한 리뷰</a></li>
				</ul>
				
				<h4>캠핑용품</h4>
				<ul class="nav-menu-li">
					<li><a href="../mypage/shop_order.do">- 주문 확인</a></li>
					<li><a href="../mypage/shop_basket.do">- 장바구니</a></li>
				</ul>
				
				<h4>레시피</h4>
				<ul class="nav-menu-li">
					<li><a href="../mypage/recipe.do">- 내가 찜한 레시피</a></li>
				</ul>
				
				<h5><a href="../mypage/qna.do">내가 작성한 문의글</a></h5>
			</div>
		</div>
</body>
</html>