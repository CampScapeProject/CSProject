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
	 
	.row .steps{
		color: gray;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 0;
	}
	.row .cSteps{
		color: white;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		margin: 0;
	}
	.row .prevStep:hover{
	    color: white;
	    cursor: pointer;
	    font-weight: bold;
	    font-family: 'Noto Sans KR', sans-serif;
	    margin: 0;
	}
	.page{
		cursor: pointer;
	}
	.activePage{
		font-weight: bold;
	}
</style>

</head>
<body>
<div class="el-space" style="background-color: #F7FAFD;">

		<!-- where_togo_area_start  -->
	    <div class="where_togo_area" style="padding: 30px;">
	        <div class="container" style="margin: 0 auto;">
	        	<div class=row>
		            <div class="col-lg-4 text-left">
		                <div class="form_area">
		                    <h1 style="color: white;text-align: left;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">예약정보</h1>
		                </div>
		            </div>
		            <div class="col-lg-4" style="display: flex; align-items: center; justify-content: center;">
		                <div class="row">
		                	<h4 style="margin: 0"><a href="../rent/rent_main.do" class="prevStep steps">차량조회</a></h4>&nbsp;&nbsp;
		                    <h4 class="steps" >&gt;</h4>&nbsp;&nbsp;
		                    <h4 class="cSteps" >예약정보</h4>&nbsp;&nbsp;
		                    <h4 class="steps" >&gt;</h4>&nbsp;&nbsp;
		                    <h4 class="steps" >결제</h4>
		                </div>
		            </div>
		            <div class="col-lg-4" style="display: flex; align-items: center; justify-content: center;">
		                <div class="row">

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
									<img :src="rent_detail.image" style="width: 40%;margin: auto;display: block;">                             	
								</div>
								
								<div style="height: 20px;"></div>
								
								<div style="margin:30px;">
									<h3 style="margin-bottom: 3px;"><i class="fa-solid fa-car"></i>&nbsp;{{rent_detail.maker}}</h3>
									<h2 style="font-size: 1.4em;">{{rent_detail.car_name}}</h2>
								</div>
								
								<hr>
								
								<div class="row text-center">
									<div class="col-lg-4">
										대여일
										<p style="font-weight: bold;">{{sDate}}</p>
									</div>
									<div class="col-lg-4">
										대여기간
										<p style="font-weight: bold;">{{period}}일</p>
									</div>
									<div class="col-lg-4">
										반납일
										<p style="font-weight: bold;">{{eDate}}</p>
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
										        	<i class="fa-solid fa-car-side"></i>&nbsp; {{rent_detail.car_type}} &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-droplet"></i>&nbsp; {{rent_detail.fuel}} &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-person"></i>&nbsp; {{rent_detail.inwon}} &nbsp;&nbsp;&nbsp;
										      		<i class="fa-solid fa-coins"></i>&nbsp; {{rent_detail.price}}
										      		
										      		<div style="height: 20px;"></div>
										      		
									      			<h3 style="margin-bottom: 10px;"><b>차량 옵션</b></h3>
									      			<div class="row">
									      				<div class="col-lg-3" v-for="o in option">
										      				· {{o}}
									      				</div>
									      			</div>
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
										        			최신순 <input type="radio" name="review" v-model="selected" @change="changed()" checked value="최신순">&nbsp;
										        			평점 높은 순 <input type="radio" name="review" v-model="selected" @change="changed()" value="평점 높은 순">&nbsp;
										        			평점 낮은 순 <input type="radio" name="review" v-model="selected" @change="changed()" value="평점 낮은 순">
										        		</div>
										        		
										        		<div class="col-lg-4 text-left">
										        			Review({{reviewTotal.tcount}})
										        		</div>
										        		<div class="col-lg-8 text-right">
										        			<i class="fa-solid fa-star" style="color: #FDAE5C"></i> {{reviewTotal.trating}}
										        		</div>
										        		
										        		<div class="col-lg-12">
										        			<hr>
										        		</div>
										        		
										        		<div class="col-lg-12" v-for="vo in review_list"
										        			style="min-height:100px;background-color: #F7FAFD;border-radius: 30px;padding: 10px 20px;margin-bottom: 5px;"
										        		>
										        			<div class="row">
											        			<div class="col-lg-6 text-left">{{vo.id}}</div>
											        			<div class="col-lg-6 text-right">
											        				<i class="fa-solid fa-star" style="color: #FDAE5C"></i> {{vo.rating}}
											        			</div>
											        			<div class="col-lg-12" style="margin: 5px 0;">
											        				{{vo.content}} 
											        			</div>
											        			<div class="col-lg-12">
											        				<span style="font-size: 15px;">{{vo.dbday}}</span> 
											        			</div>
										        			</div>
										        		</div>
										        		
										        		
										        		<div class="col-lg-12 text-center" style="color: #E86A33;margin-top: 10px;font-size: 18px;">
										        			<span class="page" @click="prev()" v-if="startpage>1">&lt;</span>&nbsp;
										        			<span class="page" 
										        				:class="curpage==(startpage+i-1)?'activePage':''" 
										        				v-for="i in (endpage-startpage+1)"
										        				@click="pageSelect((startpage+i-1))"
										        			>
										        				{{startpage+i-1}}&nbsp;
										        			</span>
										        			<span class="page" @click="next()" v-if="totalpage>endpage">&gt;</span>&nbsp;
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
					        	
                            	<h3><b>결제 정보</b></h3>
					        	<div class="row" style="padding: 0 20px;">
					        		<div class="col-lg-6" style="padding: 0 10px;">
					        			<p>요금 상세 &nbsp;<i :class="'fa-solid fa-caret-'+(detail?'up':'down')" @click="setDetail()" style="cursor: pointer;"></i></p>
					        		</div>
					        		<div class="col-lg-6 text-right" style="padding: 0 10px;">
					        			<p style="font-weight: bold;">{{rent_detail.price*period}}원</p>
					        		</div>
					        		<div v-if="detail" class="col-lg-12" style="border-radius: 10px;background-color:#F7FAFD;min-height: 50px;padding: 5px 10px">
					        			<div class="row">
					        				<div class="col-lg-6 text-left" style="font-size: 13px;">
					        					대여 요금
					        				</div>
					        				<div class="col-lg-6 text-right" style="font-size: 13px;">
					        					{{rent_detail.price}}원
					        				</div>
					        			</div>
					        			<div class="row">
					        				<div class="col-lg-6 text-left" style="font-size: 13px;">
					        					대여 기간
					        				</div>
					        				<div class="col-lg-6 text-right" style="font-size: 13px;">
					        					{{period}}일
					        				</div>
					        			</div>
					        			<div class="row">
					        				<div class="col-lg-4 text-left" style="font-size: 13px;">
					        					총 금액
					        				</div>
					        				<div class="col-lg-8 text-right" style="font-size: 13px;">
					        					{{rent_detail.price}}원 X {{period}}일 = {{rent_detail.price*period}}원
					        				</div>
					        			</div>
					        		</div>
					        	</div>
					        	
                            </div>

                            <div class="reset_btn" style="margin-top: 30px;" v-if="${sessionScope.id!=null }">
                                <a class="boxed-btn4" style="width: 100%;color: white;font-weight: bold;"
                                :href="'../rent/rent_payment.do?rno=' + rno + '&sDate=' + sDate + '&eDate=' + eDate">
                                	예약하기
                                </a>
                            </div>
                            <div class="reset_btn text-center" style="margin-top: 30px;" v-if="${sessionScope.id==null }">
                            	<span style="color: red">로그인 후에 예약하실 수 있습니다</span>
                                <a class="boxed-btn4" style="width: 100%;color: white;font-weight: bold;"
                                href="../member/login.do">
                                	로그인
                                </a>
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
		    ],
		    detail:true,
		    sDate:'${sDate}',
		    eDate:'${eDate}',
		    rno:${rno},
		    rent_detail:{},
		    option:[],
		    period:0,
		    reviewTotal:{},
			curpage:1,
			review_list:[],
			startpage:0,
			endpage:0,
			totalpage:0,
			selected:"최신순"
		},
		mounted:function(){
			axios.get('../rent/rentDetail_vue.do',{
				params:{
					rno:this.rno
				}
			}).then(res=>{
				console.log(res.data)
				this.rent_detail=res.data
				this.option=this.rent_detail.car_option.split(',')
				
				let sDate = new Date(this.sDate);
				let eDate = new Date(this.eDate);
				let diff = Math.abs(eDate.getTime() - sDate.getTime());
				diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
				console.log(diff);
				this.period=diff
				
			})
			//리뷰 평균, 갯수
			axios.get('../rent/reviewTotal_vue.do',{
				params:{
					rno:this.rno
				}
			}).then(res=>{
				console.log(res.data)
				this.reviewTotal=res.data
			})
			
			this.reviewData()
		},
		methods:{
			setActiveTab(index) {
		      	this.activeTab = index;
		    },
		    setDetail(){
		    	if(this.detail){
		    		this.detail=false
		    	} else {
		    		this.detail=true
		    	}
		    },
		    reviewData(){
				//페이지
				axios.get('../rent/review_page_vue.do',{
					params:{
						rno:this.rno,
						curpage:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					this.startpage=res.data.startpage;
					this.endpage=res.data.endpage;
					this.curpage=res.data.curpage;
					this.totalpage=res.data.totalpage;
				})
		    	// 리뷰 리스트
				axios.get('../rent/review_vue.do',{
					params:{
						rno:this.rno,
						curpage:this.curpage,
						selected:this.selected
					}
				}).then(res=>{
					console.log(res.data)
					this.review_list=res.data
				})
		    },
		    pageSelect(page){
		    	this.curpage=page
		    	this.reviewData()
		    },
		    prev(){
		    	this.curpage=this.startpage-1
		    	this.reviewData()
		    },
		    next(){
		    	this.curpage=this.endpage+1
		    	this.reviewData()
		    },
		    changed(){
		    	this.curpage=1
		    	this.reviewData()
		    }
		}
	})
	

</script>
</body>
</html>