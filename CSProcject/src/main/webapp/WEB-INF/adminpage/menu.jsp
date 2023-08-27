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
			<span>관리자페이지</span>
		</div>
		<div class="mypage-menu text-left">
			<h4>회원 정보</h4>
			<ul class="nav-menu-li">
				<li><a href="../adminpage/main.do">- 정보 수정 / 탈퇴</a></li>
			</ul>
			
			<h4>캠핑장</h4>
			<ul class="nav-menu-li">
				<li><a href="../adminpage/camp_reserve.do">- 캠핑장 예약 정보</a></li>
				<li><a href="../adminpage/camp_review.do">- 내가 작성한 리뷰</a></li>
			</ul>
			
			<h4>렌터카</h4>
			<ul class="nav-menu-li">
				<li><a href="../adminpage/rent_list.do">- 렌터카 목록</a></li> 
				<li><a href="../adminpage/rent_reserve.do">- 렌터카 예약 정보</a></li>
			</ul>
			
			<h4>캠핑용품</h4>
			<ul class="nav-menu-li">
				<li><a href="../adminpage/shop_goods.do">- 물품 정보</a></li>
			</ul>
			
			<h4>레시피</h4>
			<ul class="nav-menu-li">
				<li><a href="../adminpage/recipe.do">- 레시피 목록 및 삭제</a></li>
			</ul>
			
			<h5><a href="../adminpage/qna.do">문의글</a></h5>
		</div>
	</div>
</body>
</html>