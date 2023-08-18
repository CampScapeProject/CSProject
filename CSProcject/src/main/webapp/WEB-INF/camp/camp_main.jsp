<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.well{
	width: 1000px;
	height: 50px;
}

#cDate input {
  width: 250px;
  height: 40px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  text-align: center;
  margin-bottom: 20px;
}
.col-lg-12 h3{
	margin-top: 20px;
}
.single-input-primary:focus {
  outline: none;
  border: 1px solid #ff5e13;
}
.single-input-primary {
  display: block;
  width: 100%;
  line-height: 40px;
  border: 1px solid #DEE2E7;
  outline: none;
  background: #f9f9ff;
  padding: 0 20px;
}
.filter_result_wrap .filter_bordered {
  border: 2px solid #DEE2E7;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  padding: 25px;
}
</style>
</head>
<body>
<!-- 배경 -->
 <div class="bradcam_area bradcam_bg_2">
     <div class="container">
	     <div class="row">
	         <div class="col-xl-12">
	             <div class="bradcam_text text-center">
	                 <h3>Destinations</h3>
	                 <p>Pixel perfect design with awesome contents</p>
	             </div>
	         </div>
	     </div>
     </div>
</div>
<!---------->

<!-- 제목 칸 -->
<div class="where_togo_area" style="padding: 30px;">
    <div class="container" style="margin: 0 auto;">
    	<div class=row>
         <div class="col-lg-3">
             <div class="form_area">
                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">캠핑</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!---------->


<div class="popular_places_area">
	<div class="container">
		<div class="row">
	<!-- 검색 창 -->
		
			<div class="col-lg-4">
			    <div class="filter_result_wrap">
			        <h2>상세조건</h2>
			        <br>
			        <div class="filter_bordered">
			        <div class="col-lg-12" id="cDate" style="text-align: center;border-bottom: 2px solid #DEE2E7;">
			        	<input type="text" name="daterange"/>
			        </div>
			            <div class="filter_inner">
			                <div class="row">
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
			                        <div class="single_select">
			                        <h3><b>지역선택</b></h3>
			                            <select>
			                                <option data-display="지역">지역</option>
			                                <option value="1">Africa</option>
			                                <option value="2">canada</option>
			                                <option value="4">USA</option>
			                              </select>
			                        </div>
			                    </div>
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
	                                <div class="single_select">
	                                 <h3><b>가격선택</b></h3>
	                                    <select>
	                                        <option data-display="가격">가격</option>
	                                        <option value="1">advance</option>
	                                        <option value="2">advance</option>
	                                        <option value="4">premium</option>
	                                      </select>
	                                </div>
                                </div>
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
				                     <h3><b>검색</b></h3>
										<input type="text" name="first_name" placeholder="캠핑장명을 검색하세요."
											onfocus="this.placeholder = ''" onblur="this.placeholder = '캠핑장명을 검색하세요.'" required
												class="single-input-primary" style="margin-bottom: 20px;">
								</div>
			                  <!--   <div class="col-lg-12">
			                    	<div class="range_slider_wrap">
		                                 <span class="range">가격&nbsp;:&nbsp;만원&nbsp;~&nbsp;만원</span>
		                                 <div id="slider-range"></div>
		                                 <p>
		                                     <input type="text" id="amount" readonly style="border:0; color:#7A838B; font-weight:400;">
		                       			 </p>
			                    	</div>
			                    </div> -->
			                </div>
			            </div>
			            <br>
			            <div class="reset_btn">
			                <button class="boxed-btn4" type="submit">적용</button>
			            </div>
			        </div>
			    </div>
			</div>
	    <!----------->    
	    
	    	 
	    <!-- 리스트 목록 -->
	        <div class="col-lg-8">
	        	 <div class="well" style=" border-bottom: 2px solid #DEE2E7;">
					<select>
						<option value="1">조회순 &nbsp;&nbsp;</option>
						<option value="1">추천순 &nbsp;&nbsp;</option>
						<option value="1">리뷰순 &nbsp;&nbsp;</option>
					</select>
					<a href="../camp/camp_list.do" class="btn btn-info" role="button" style="float: right; margin-right: 20px;background-color:gray;border: none; ">캠핑장 전체보기</a>
	        	 </div>
	            <div class="row">
	                <div class="col-lg-6 col-md-6">
	                    <div class="single_place">
	                        <div class="thumb">
	                            <img src="../img/place/1.png" alt="">
	                            <a href="#" class="prise">가격</a>
	                        </div>
	                        <div class="place_info">
	                            <a href="destination_details.html"><h3>제목</h3></a>
	                            <p>메세지</p>
	                            <span><i class="fa fa-phone-square" style="color: #E86A33"></i></span>&nbsp;
	                            <span><i class="fa fa-location-arrow" style="color: #E86A33"></i></span>
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
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="more_place_btn text-center">
	                        <a class="boxed-btn4" href="#">캠핑장 더보기</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	   	 </div>
	   	 <!----------------->
	   	 
		</div>
	</div>
</div>
<script>
	/* new Vue({
		el:'.popular_places_area',
		data:{
			camp_list:[],
			curpage:1,
		}
		
		
	}) */
</script>
</body>
</html>