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
 
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 
<style type="text/css">
	.filter_result_wrap input[type="checkbox"]{
		width: 15px;
		height: 15px;
	}
	
	.col-lg-8 .row::-webkit-scrollbar {
	    width: 10px;
	}
	.col-lg-8 .row::-webkit-scrollbar-thumb {
	    background-color: rgb(180, 180, 180);
	    border-radius: 10px;
	}
	.col-lg-8 .row::-webkit-scrollbar-track {
	    background-color: #F5F5F5;
	}
	
	.tabs {
	  display: flex;
	}
	
	.tabs > div {
	  	padding: 10px 20px;
	  	cursor: pointer;
	}
	
	.tabs > div.active {
	  	border-bottom: 3px solid #E86A33;
	  	font-weight: bold;
	  	color: #E86A33;
	}
	
	.tabs > div:hover{
		font-weight: bold;
		color:#E86A33;
	}
	
	.tab-content > div {
	  display: none;
	}
	
	.tab-content > div:nth-child(1),
	.tab-content > div:nth-child(2),
	.tab-content > div:nth-child(3) {
	  display: block;
	}
</style>

</head>
<body style="background-color: #F7FAFD;">
<div class="el-space">

		<!-- where_togo_area_start  -->
	    <div class="where_togo_area" style="padding: 30px;">
	        <div class="container" style="margin: 0 auto;">
	        	<div class=row>
		            <div class="col-lg-4 text-left">
		                <div class="form_area">
		                    <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">예약정보</h1>
		                </div>
		            </div>
	            </div>
	        </div>
	    </div>
	    <!-- where_togo_area_end  -->
	
    
    <div class="popular_places_area" style="padding-top: 50px;padding-bottom: 100px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
	                <div class="filter_result_wrap">
						<div class="filter_bordered" style="background-color: white; border-radius: 20px;">
							<div class="filter_inner">
							
								<div class="row" style="margin: 0 auto;">
									<img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/%EC%A4%91%ED%98%95%EC%B0%A8/SM6.jpg" style="width: 40%;margin: auto;display: block;">                             	
								</div>
								
								<div style="height: 20px;"></div>
								
								<div style="margin:30px;">
									<h3 style="margin-bottom: 3px;"><i class="fa-solid fa-car"></i>&nbsp;현대</h3>
									<h2 style="font-size: 1.4em;">스타렉스 2세대 12인승</h2>
								</div>
								
								<hr>
								
								<div class="row text-center">
									<div class="col-lg-4">
										대여일
										<p style="font-weight: bold;">2023-08-23</p>
									</div>
									<div class="col-lg-4">
										대여기간
										<p style="font-weight: bold;">2일</p>
									</div>
									<div class="col-lg-4">
										반납일
										<p style="font-weight: bold;">2023-08-25</p>
									</div>
	    						</div>
	    						
								<hr>
								
								<div class="row">
									<div class="col-lg-12">
									  
									<div id="app" >
										<div class="tabs row text-center" style="padding:20px 35px 0 35px">
										    <div
										      v-for="(tab, index) in tabs"
										      :key="index"
										      :class="{ active: activeTab === index }"
										      @click="setActiveTab(index)"
										      class="col-lg-4"
										    >
										      {{ tab.title }}
										    </div>
										</div>
										<div style="height: 20px;"></div>
									  	<div class="tab-content" style="padding:0 20px 0 20px;min-height: 200px;">
									    	<div v-for="(tab, index) in tabs" :key="index" v-show="activeTab === index">
									      		<template v-if="index == 0">
									      			<h3 style="margin-bottom: 10px;"><b>차량 정보</b></h3>
										        	<i class="fa-solid fa-car-side"></i>&nbsp; RV/SUV &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-droplet"></i>&nbsp; 경유 &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-person"></i>&nbsp; 6인 &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-coins"></i>&nbsp; 37000
										      		
										      		<div style="height: 20px;"></div>
										      		
									      			<h3 style="margin-bottom: 10px;"><b>차량 옵션</b></h3>
										      		가죽시트,금연,네비게이션,시트열선,운전석에어백,조수석에어백,후방센서,후방카메라,ABS,블루투스,AUX,MP3,USB,스마트키
												</template>
									      		<template v-if="index == 1">
										        	<h3 style="margin-bottom: 20px;"><b>운전자 대여조건</b></h3>
										        	<div class="row">
										        		<div class="col-lg-1" style="padding-right: 0">
										        			<i class="fa-solid fa-check"></i>
										        		</div>
										        		<div class="col-lg-11" style="padding: 0">
										        			<p>운전자 나이 만 26세 이상</p>
										        		</div>
										        		
										        		<div class="col-lg-1" style="padding-right: 0">
										        			<i class="fa-solid fa-check"></i>
										        		</div>
										        		<div class="col-lg-11" style="padding: 0">
										        			<p>면허취득일 1년 이상</p>
										        		</div>
										        		
										        		<div class="col-lg-1" style="padding-right: 0">
										        			<i class="fa-solid fa-check"></i>
										        		</div>
										        		<div class="col-lg-11" style="padding: 0">
										        			<p>차량 대여 시 실물면허증 소지 (2종 보통 면허 이상 필요)</p>
										        		</div>
										        	</div>
										        	
										        	<h3 style="margin-bottom: 20px;margin-top: 20px;"><b>렌트카 예약 전, 꼭 확인해주세요!</b></h3>
										        	<div class="row">
										        		<div class="col-lg-1" style="padding-right: 0">
										        			<i class="fa-solid fa-check"></i>
										        		</div>
										        		<div class="col-lg-11" style="padding: 0">
										        			<p>제주도의 경우, 렌트카 업체 영업시간 외 대여/반납이 필요한 경우 고객센터를 통한 상담 후 예약 진행해주세요.</p>
										        		</div>
										        		
										        		<div class="col-lg-1" style="padding-right: 0">
										        			<i class="fa-solid fa-check"></i>
										        		</div>
										        		<div class="col-lg-11" style="padding: 0">
										        			<p>
										        				외국인 대여, 낚시용품 지참, 애견동물 동반 가능 여부와 주행거리 제한 규정<br>
										        				- 반려동물 동반 시 대여 불가능<br>
										        				- 낚시용품 지참 시 대여 불가능<br>
										        				- 실내클리닝 비용 청구<br>
										        				&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i> 악취/오염 발생 시 정도에 따라 실내 클리닝 비용 청구<br>
										        				- 군인대여 직업군인만 가능<br>
										        				&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i> 공무원증 지참 시 가능<br>
										        				- 외국인대여 가능<br>
										        				&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i> 여권과 국제면허증 지참 (제네바, 비엔나 협약국)<br>
										        				&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-arrow-right"></i> 외국인 단독 대여 불가능 (한국인 보증인 정보 필요)<br>
										        				
										        			</p>
										        		</div>
										        	</div>
										        	
										        	<h3 style="margin-bottom: 20px; margin-top: 20px;"><b>자차보험</b></h3>
										        	<div class="row">
										        		<div class="col-lg-12">
											        		<p>
											        		&lt; 일반자차 &gt;<br>
															- 보상한도 내에서 면책금과 휴차보상료(1일 대여요금의 50%)는 임차인 부담<br>
															- 단독사고인 경우 보험처리 가능<br>
															- 휠/타이어 보험처리 불가<br>
															<br>
															&lt; 완전자차 &gt;<br>
															- 보상한도 내에서 면책금과 휴차보상료는 없음<br>
															- 단독사고인 경우 보험처리 가능<br>
															- 휠/타이어 보험처리 불가<br>
															<br>
															&lt; 종합보험 &gt;<br>
															- 접수 시 대인/자손(인당 50만원), 대물(건당 50만원)면책금 발생<br>
															</p>
										        		</div>
										        	</div>
										        	
												</template>
									      		<template v-if="index == 2">
										        	<div class="row">
										        		<div class="col-lg-12 text-right" style="margin-bottom: 15px;">
										        			최신순 <input type="radio" name="review" checked value="최신순" style="color: red;">&nbsp;
										        			평점 높은 순 <input type="radio" name="review" value="최신순" style="color: red;">&nbsp;
										        			평점 낮은 순 <input type="radio" name="review" value="최신순" style="color: red;">
										        		</div>
										        		
										        		<div class="col-lg-4 text-left">
										        			Review(10)
										        		</div>
										        		<div class="col-lg-8 text-right">
										        			<i class="fa-solid fa-star" style="color: #FDAE5C"></i> 4.5
										        		</div>
										        		
										        		
										        		<div class="col-lg-12">
										        			<hr>
										        		</div>
										        		
										        		<div class="col-lg-12" 
										        			style="min-height:100px;background-color: #F7FAFD;border-radius: 30px;padding: 10px 20px;margin-bottom: 5px;"
										        		>
										        			<div class="row">
											        			<div class="col-lg-6 text-left">hong</div>
											        			<div class="col-lg-6 text-right">
											        				<i class="fa-solid fa-star" style="color: #FDAE5C"></i> 4
											        			</div>
											        			<div class="col-lg-12" style="margin: 5px 0;">
											        				친절하고 차량상태 우수함 차량스크레치 동영상까지 찍고 바딱 스크레치 까지 찍어서 남겨놨는데 무난히 검사완료 해주셨음 이번9월달 또 이용할 예정임 
											        			</div>
											        			<div class="col-lg-12">
											        				<span style="font-size: 15px;">2023.08.16</span> 
											        			</div>
										        			</div>
										        		</div>
										        		
										        		<div class="col-lg-12" 
										        			style="min-height:100px;background-color: #F7FAFD;border-radius: 30px;padding: 10px 20px;margin-bottom: 5px;"
										        		>
										        			<div class="row">
											        			<div class="col-lg-6 text-left">hong</div>
											        			<div class="col-lg-6 text-right">
											        				<i class="fa-solid fa-star" style="color: #FDAE5C"></i> 4
											        			</div>
											        			<div class="col-lg-12" style="margin: 5px 0;">
											        				친절하고 차량상태 우수함 차량스크레치 동영상까지 찍고 바딱 스크레치 까지 찍어서 남겨놨는데 무난히 검사완료 해주셨음 이번9월달 또 이용할 예정임 
											        			</div>
											        			<div class="col-lg-12">
											        				<span style="font-size: 15px;">2023.08.16</span> 
											        			</div>
										        			</div>
										        		</div>
										        	</div>
												</template>
									    	</div>
									  	</div>
									</div>
									  
									</div>
								</div>
	    	
	    					</div>
						</div>
					</div>
                </div>
                
                <div class="col-lg-4">
                    <div class="filter_result_wrap">
                        <div class="filter_bordered" style="background-color: white;">
                            <div class="filter_inner">
                            	<h3><b>운전자 정보</b></h3>
					        	<div class="row">
					        		<div class="col-lg-12" style="margin-bottom: 10px;">
						        		<input type="text" style="width: 100%" placeholder="이름"> 
					        		</div>
					        		<div class="col-lg-12" style="margin-bottom: 10px;">
						        		<input type="text" style="width: 100%" placeholder="생년월일 ex)20030101"> 
					        		</div>
					        		<div class="col-lg-12" style="margin-bottom: 10px;">
						        		<input type="text" style="width: 100%" placeholder="휴대폰 번호 (- 빼고)"> 
					        		</div>
					        		<div class="col-lg-12" style="margin-bottom: 10px;">
						        		<input type="text" style="width: 100%" placeholder="이메일"> 
					        		</div>
					        	</div>
					        	
					        	<hr>
					        	
                            	<h3><b>결제 정보</b></h3>
					        	<div class="row" style="padding: 0 20px;">
					        		<div class="col-lg-12" style="border-radius: 20px;background-color:#F7FAFD;min-height: 50px; display: flex; align-items: center;justify-content: center;">
					        			<p>37000 * 2일 = 74000원</p>
					        		</div>
					        	</div>
					        	
                            </div>

                            <div class="reset_btn" style="margin-top: 30px;">
                                <button class="boxed-btn4">예약하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

	new Vue({
		el:'.el-space',
		data:{
			activeTab: 0,
		    tabs: [
		      { title: "정보", content: "Content for Tab 1" },
		      { title: "유의사항", content: "Content for Tab 2" },
		      { title: "리뷰", content: "Content for Tab 3" },
		    ]
		},
		mounted:function(){
			
		},
		methods:{
			setActiveTab(index) {
		      	this.activeTab = index;
		    }
		}
	})
	

</script>
</body>
</html>