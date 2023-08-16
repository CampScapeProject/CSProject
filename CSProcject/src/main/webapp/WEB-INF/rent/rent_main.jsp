<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
</head>
<body style="background-color: #F7FAFD;">
	<!-- where_togo_area_start  -->
    <div class="where_togo_area" style="padding: 30px;">
        <div class="container" style="margin: 0 auto;">
        	<div class=row>
	            <div class="col-lg-3">
	                <div class="form_area">
	                    <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">차량 조회</h1>
	                </div>
	            </div>
	            <div class="col-lg-9" style="padding-top: 10px;">
	                <div class="search_wrap">
	                    <form class="search_form" action="#">
	                        <div class="input_field">
	                            <input type="text" placeholder="Where to go?">
	                        </div>
	                        <div class="input_field">
	                            <input id="datepicker" placeholder="Date">
	                        </div>
	                        <div class="input_field">
	                            <select>
	                                <option data-display="Travel type">Travel type</option>
	                                <option value="1">Some option</option>
	                                <option value="2">Another option</option>
	                            </select>
	                        </div>
	                        <div class="search_btn">
	                            <button class="boxed-btn4 " type="submit" >Search</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
            </div>
        </div>
    </div>
    <!-- where_togo_area_end  -->
    
    <div class="popular_places_area" style="padding-top: 50px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="filter_result_wrap">
                        <h3>차량 옵션</h3>
                        <div class="filter_bordered" style="background-color: white;">
                            <div class="filter_inner">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single_select">
                                            <select>
                                                <option data-display="Country">Country</option>
                                                <option value="1">Africa</option>
                                                <option value="2">canada</option>
                                                <option value="4">USA</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_select">
                                            <select>
                                                <option data-display="Travel type">Travel type</option>
                                                <option value="1">advance</option>
                                                <option value="2">advance</option>
                                                <option value="4">premium</option>
                                              </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="range_slider_wrap">
                                            <span class="range">Prise range</span>
                                            <div id="slider-range"></div>
                                            <p>
                                                <input type="text" id="amount" readonly style="border:0; color:#7A838B; font-weight:400;">
                                            </p>
                                        </div>
                                    </div>
                                </div>


                            </div>

                            <div class="reset_btn">
                                <button class="boxed-btn4" type="submit">Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="single_place">
                                <div class="thumb">
                                    <img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/SUV/%EB%8D%94-%EA%B7%B8%EB%9E%9C%EB%93%9C%EC%8A%A4%ED%83%80%EB%A0%89%EC%8A%A4.jpg" height="250px" alt="">
                                    <!-- <a href="#" class="prise">$500</a> -->
                                </div>
                                <div class="place_info">
                                    <a href="#"><h3 style="margin: 0">더뉴그랜드스타렉스 12인승</h3></a>
                                    <p>현대</p>
                                    <div class="rating_days d-flex justify-content-between">
                                        <span class="d-flex justify-content-center align-items-center">
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i>
                                             <a href="#">(20 Review)</a>
                                        </span>
                                        <div class="days">
                                            <i class="fa fa-clock-o"></i>
                                            <a href="#">5 Days</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="single_place">
                                <div class="thumb">
                                    <img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/%EC%8A%B9%ED%95%A9%EC%B0%A8/%EC%98%AC%EB%89%B4%EC%B9%B4%EB%8B%88%EB%B0%9C_9%EC%9D%B8%EC%8A%B9.jpg" height="250px" alt="">
                                    <!-- <a href="#" class="prise">$500</a> -->
                                </div>
                                <div class="place_info">
                                    <a href="#"><h3 style="margin: 0">올뉴카니발 9인승</h3></a>
                                    <p>기아</p>
                                    <div class="rating_days d-flex justify-content-between">
                                        <span class="d-flex justify-content-center align-items-center">
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i>
                                             <a href="#">(20 Review)</a>
                                        </span>
                                        <div class="days">
                                            <i class="fa fa-clock-o"></i>
                                            <a href="#">5 Days</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>