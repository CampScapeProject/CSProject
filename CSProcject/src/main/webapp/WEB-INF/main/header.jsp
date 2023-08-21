<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo">
                                    <a href="../main/home.do">
                                        <img src="../layout/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="../main/home.do">홈</a></li>
                                            <li><a href="../camp/camp_main.do">캠핑장예약</a></li>
                                            <li><a href="../rent/rent_main.do">렌터카</a></li>
                                            <li><a href="../shop/shop_main.do">쇼핑몰</a></li>
                                            <li><a href="#">캠핑정보 <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                        <li><a href="../camptip/camptip_main.do">캠핑팁</a></li>
                                                        <li><a href="../recipe/recipe_main.do">레시피</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../mypage/main.do">마이페이지</a></li>
                                            <li><a href="../adminpage/main.do">관리자페이지</a></li>
                                            <li><a href="#">고객센터 <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="../notice/notice_main.do">공지사항</a></li>
                                                    <li><a href="../qna/qna_main.do">문의사항</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 d-none d-lg-block">
                                <div class="social_wrap d-flex align-items-center justify-content-end">
                                	<c:if test="${sessionScope.id!=null }">
	                                    <div class="number">
	                                        <p> <i class="fa fa-user" style="color: black"></i>${sessionScope.name }님</p>
	                                    </div>
                                    </c:if>
                                    
                                    <div class="social_links d-none d-xl-block">
                                        <ul>
                                        	<c:if test="${sessionScope.id==null }">
                                            <li><a href="../member/login.do"> <i class="fa-solid fa-right-to-bracket"></i> 로그인 </a></li>
                                            </c:if>
                                            
                                            <c:if test="${sessionScope.id!=null }">
                                            <li><a href="#"> <i class="fa fa-arrow-right-from-bracket"></i> 로그아웃 </a></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->
</body>
</html>