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
		                    <h1 style="color: white;text-align: left;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">결제</h1>
		                </div>
		            </div>
		            <div class="col-lg-4" style="display: flex; align-items: center; justify-content: center;">
		                <div class="row">
		                	<h4 style="margin: 0"><a href="../rent/rent_main.do" class="prevStep steps">차량조회</a></h4>&nbsp;&nbsp;
		                    <h4 class="steps" >&gt;</h4>&nbsp;&nbsp;
		                    <h4 class="steps" ><a :href="'../rent/rent_detail.do?rno='+rno+'&date='+date" class="prevStep steps">예약정보</a></h4>&nbsp;&nbsp;
		                    <h4 class="steps" >&gt;</h4>&nbsp;&nbsp;
		                    <h4 class="cSteps" >결제</h4>
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
						<div class="filter_bordered" style="background-color: white; border-radius: 20px;padding: 35px">
							<div class="filter_inner">
							
								<div style="margin-top: 10px;">
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
										<h3 style="margin-bottom: 10px;"><b>차량 정보</b></h3>
							        	<i class="fa-solid fa-car-side"></i>&nbsp; RV/SUV &nbsp;&nbsp;&nbsp;
							      		<i class="fa-solid fa-droplet"></i>&nbsp; 경유 &nbsp;&nbsp;&nbsp;
							      		<i class="fa-solid fa-person"></i>&nbsp; 6인 &nbsp;&nbsp;&nbsp;
							      		<i class="fa-solid fa-coins"></i>&nbsp; 37000
							      		
							      		<div style="height: 20px;"></div>
							      		
						      			<h3 style="margin-bottom: 10px;"><b>차량 옵션</b></h3>
						      			<div class="row" style="margin-bottom: 20px;">
						      				<div class="col-lg-3" v-for="o in option">
							      				· {{o}}
						      				</div>
						      			</div>
							      		
   		                            	<h3 style="margin-bottom: 10px"><b>운전자 정보</b></h3>
							        	<div class="row">
							        		<div class="col-lg-12">
							        			이름
							        		</div>
							        		<div class="col-lg-12" style="margin-bottom: 10px;">
								        		<input type="text" style="width: 80%" placeholder="성명"> 
							        		</div>
							        		
							        		<div class="col-lg-12">
							        			생년월일
							        		</div>
							        		<div class="col-lg-12" style="margin-bottom: 10px;">
								        		<input type="text" style="width: 80%" placeholder="생년월일 ex)20030101"> 
							        		</div>
							        		
							        		<div class="col-lg-12">
							        			휴대폰 번호
							        		</div>
							        		<div class="col-lg-12" style="margin-bottom: 10px;">
								        		<input type="text" style="width: 80%" placeholder="휴대폰 번호 (- 빼고)"> 
							        		</div>
							        		
							        		<div class="col-lg-12">
							        			이메일
							        		</div>
							        		<div class="col-lg-12" style="margin-bottom: 10px;">
								        		<input type="text" style="width: 80%" placeholder="예약 완료시 이메일로 알려드립니다."> 
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

                            <div class="reset_btn" style="margin-top: 30px;">
                                <a class="boxed-btn4" style="width: 100%;color: white;font-weight: bold;" 
                                :href="'../rent/rent_payment.do?rno=' + rno + '&sDate=' + sDate + '&eDate=' + eDate">
                                	{{rent_detail.price*period}}원 결제
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
		    detail:true,
		    date:'',
		    sDate:'${sDate}',
		    eDate:'${eDate}',
		    rno:${rno},
		    rent_detail:{},
		    option:[],
		    period:0
		},
		mounted:function(){
			this.date=this.sDate + " - " + this.eDate
			
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
		},
		methods:{
		    setDetail(){
		    	if(this.detail){
		    		this.detail=false
		    	} else {
		    		this.detail=true
		    	}
		    }
		}
	})
	

</script>
</body>
</html>