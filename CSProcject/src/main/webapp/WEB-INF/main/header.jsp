<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                                        <img src="../layout/img/logo.png">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a class="active" href="../main/home.do">홈</a></li>
                                            <li><a href="#">캠핑장<i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="../camp/camp_main.do">캠핑장 예약</a></li>
                                                    <li><a href="../camp/camp_list.do">캠핑장 전체</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="../rent/rent_main.do">렌터카</a></li>
                                            <li><a href="../shop/shop_main.do">쇼핑몰</a></li>
                                            <li><a href="../recipe/recipe_main.do">레시피</a></li>
                                            <c:if test="${sessionScope.admin=='n' }"><li><a href="../mypage/main.do">마이페이지</a></li></c:if>
                                            <c:if test="${sessionScope.admin=='y' }"><li><a href="../adminpage/main.do">관리자페이지</a></li></c:if>
                                            <li><a href="#">고객센터 <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="../notice/notice_main.do">공지사항</a></li>
                                                    <li><a href="../qna/qna_main.do?qcno=1">문의사항</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-4 col-lg-4 d-none d-lg-block">
                                <div class="social_wrap d-flex align-items-center justify-content-end">
                                	<span style="margin-right: 20px;">
	                               		<sup style="color: #A2A2A2;">오늘의 날씨</sup> 
	                               		<img :src="'http://openweathermap.org/img/wn/'+weather_data.weather[0].icon+'.png'" style="margin-right: -8px;">
	                               		{{weather_data.main.temp}}˚
                               		</span>
                                    <div class="number" style="padding-left: 20px;border-left: 1px solid #EAEAEA;">
                                      <p> <c:if test="${sessionScope.name!=null }"><i class="fa fa-user" style="color: black"></i> ${sessionScope.name}님</c:if></p>
                                    </div>
                                    <div class="social_links d-none d-xl-block">
                                        <ul>
                                           <c:if test="${sessionScope.name==null }"> <li><a href="../member/login.do"> <i class="fa-solid fa-right-to-bracket"></i> login & join </a></li></c:if>
                                           <c:if test="${sessionScope.name!=null }"> <li><a href="../member/logout.do"> <i class="fa fa-arrow-right-from-bracket"></i> logout </a></li></c:if>
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
    
<script>
	let header=new Vue({
		el:'header',
		data:{
			weather_data:[]
		},
		mounted:function(){
			axios.get('https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=8d866292cddcb29177c61c1d26f091f0&units=metric').then(res=>{
				console.log(res.data)
				this.weather_data=res.data
			})
		}
	})
</script>
</body>
</html>