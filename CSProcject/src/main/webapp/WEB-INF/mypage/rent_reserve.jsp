<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style type="text/css">
	.thumbnail{
		margin-bottom: 5px;
	}
	th{
		text-align: center;
	}
	td{
		text-align: left;
	}
	.my-active{
		border:5px solid #ddd;
	}
	.my-active p{
		font-weight: bold;
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
	.tab-content > div:nth-child(2) {
	  display: block;
	}
</style>
</head>
<body>
<div class="el">
	<div class=row style="padding-top: 40px;padding-left: 20px;">
		<div class="col-lg-2" style="padding-right: 0">
		      <div class="thumbnail" :class=" activeReserve===index?'my-active':'' " 
		      	v-for="vo,index in reserve_list" @click="reserveClick(index)"
		      >
		        <a href="#">
		          <img src="" alt="Lights" style="width:100%">
		          <div class="caption" style="padding: 5px">
		            <p style="margin: 0"></p>
		          </div>
		        </a>
		      </div>
			      
		</div>
		<div class="col-lg-10" style="margin: 0 auto;">
				
            <div class="row" style="width: 100%;margin: 0">
                <div class="col-lg-12">
                
	                <div class="filter_result_wrap">
						<div class="filter_bordered" style="background-color: white; border-radius: 20px;padding: 35px;width: 100%">
							<div class="filter_inner">
								
								<div class="row" style="margin: 0 auto;">
									<img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/%EA%B2%BD%EC%B0%A8/%EB%8D%94%EB%84%A5%EC%8A%A4%ED%8A%B8%EC%8A%A4%ED%8C%8C%ED%81%AC_1.jpg" style="width: 40%;margin: auto;display: block;">                             	
								</div>
							
								<div style="margin: 40px 20px 0 20px;text-align: left;">
									<h3 style="margin-bottom: 3px;"><i class="fa-solid fa-car"></i>&nbsp;쉐보레</h3>
									<h2 style="font-size: 1.4em;margin-top: 5px">더넥스트 스파크</h2>
								</div>
								
								<hr>
								
								<div class="row text-center">
									<div class="col-lg-4">
										대여일
										<p style="font-weight: bold;margin: 0">2023-08-23</p>
									</div>
									<div class="col-lg-4">
										대여기간
										<p style="font-weight: bold;margin: 0">1일</p>
									</div>
									<div class="col-lg-4">
										반납일
										<p style="font-weight: bold;margin: 0">2023-08-24</p>
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
											      class="col-lg-6"
											    >
											      {{ tab.title }}
											    </div>
											</div>
											<div style="height: 20px;"></div>
										  	<div class="tab-content text-left" style="padding:0 20px 0 20px;min-height: 200px;">
										    	<div v-for="(tab, index) in tabs" :key="index" v-show="activeTab === index">
										      		<template v-if="index == 0">
										      			<div class=row>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>예약자명</b></h3>
										      					한성전
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>휴대폰</b></h3>
										      					01022657377
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>이메일</b></h3>
										      					hsj304@daum.net
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>생년월일</b></h3>
										      					2023-08-22
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>가격</b></h3>
										      					84,900원
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>예약상태</b></h3>
										      					대기
										      				</div>
										      			</div>
													</template>
										      		<template v-if="index == 1">
										      			<h3 style="margin-bottom: 10px;"><b>차량 정보</b></h3>
											        	<i class="fa-solid fa-car-side"></i>&nbsp; 경차,소형차 &nbsp;&nbsp;&nbsp;
											      		<i class="fa-solid fa-droplet"></i>&nbsp; 휘발유 &nbsp;&nbsp;&nbsp;
											      		<i class="fa-solid fa-person"></i>&nbsp; 5 &nbsp;&nbsp;&nbsp;
											      		<i class="fa-solid fa-coins"></i>&nbsp; 26200
											      		
											      		<div style="height: 20px;"></div>
											      		
										      			<h3 style="margin-bottom: 10px;"><b>차량 옵션</b></h3>
										      			<div class="row">
										      				<div class="col-lg-3">
											      				· 가죽시트
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
            </div>
				
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'.el',
		data:{
			activeReserve:0,
			activeTab: 0,
		    tabs: [
		      { title: "예약정보", content: "Content for Tab 1" },
		      { title: "차량정보", content: "Content for Tab 2" },
		    ],
		    reserve_list:[],
		    reserve_detail:{}
		}, 
		mounted:function(){
			axios.get("../rent/rent_reserve_list_vue.do", {
				params:{
					id:'${sessionScope.id}'
				}
			}).then(res=>{
				console.log(res.data)
				this.reserve_list=res.data
			})
		},
		methods:{
			setActiveTab(index) {
		      	this.activeTab = index;
		    },
		    reserveClick(index){
		    	this.activeReserve=index;
		    }
		}
	})
</script>
</body>
</html>