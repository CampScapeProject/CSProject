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
	
	.col-lg-2::-webkit-scrollbar {
	    width: 7px;
	}
	.col-lg-2::-webkit-scrollbar-thumb {
	    background-color: rgb(180, 180, 180);
	    border-radius: 10px;
	}
	.col-lg-2::-webkit-scrollbar-track {
	    background-color: white;
	}
	.nice-select{
		height: 28px;
    	line-height: 28px;
	}
</style>
</head>
<body>
<div class="el">
	<div class=row style="padding-top: 40px;padding-left: 20px;margin-bottom: 30px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">예약 정보</span>
		</div>
	
		<div class="col-lg-12 text-left" style="margin-bottom: 10px;">
      			차량명 <input type="radio" name="type" v-model="type" value="1">&nbsp;
       			예약자명 <input type="radio" name="type" v-model="type" value="2">&nbsp;
				<input type="text" v-model="fd" @keyup.enter="findData()">
				<input type="button" value="검색" @click="findData()">
		</div>
	
		<div class="col-lg-2" style="padding-right: 0;height:750px;overflow: auto;">
		      <div class="thumbnail" :class=" activeReserve===index?'my-active':'' " 
		      	v-for="vo,index in reserve_list" @click="reserveClick(index, vo.fno)"
		      >
		        <a style="cursor: pointer;">
		          <img :src="vo.image" alt="Lights" style="width:100%">
		          <div class="caption" style="padding: 5px">
		            <p style="margin: 0">{{vo.car_name}}</p>
		          </div>
		        </a>
		      </div>
			      
		</div>
		
		<div class="col-lg-10" style="margin: 0 auto;">
				
            <div class="row" style="width: 100%;margin: 0">
                <div class="col-lg-12">
                
	                <div class="filter_result_wrap">
						<div class="filter_bordered" style="background-color: white; border-radius: 20px;padding: 35px;width: 100%">
							<div class="filter_inner" v-if="reserve_list[activeReserve]">
								
								<div class="row" style="margin: 0 auto;">
									<img :src="rent_detail.image" style="width: 40%;margin: auto;display: block;">                             	
								</div>
							
								<div style="margin: 40px 20px 0 20px;text-align: left;">
									<h3 style="margin-bottom: 3px;"><i class="fa-solid fa-car"></i>&nbsp;{{rent_detail.maker}}</h3>
									<h2 style="font-size: 1.4em;margin-top: 5px">{{rent_detail.car_name}}</h2>
								</div>
								
								<hr>
								
								<div class="row text-center">
									<div class="col-lg-4">
										대여일
										<p style="font-weight: bold;margin: 0">{{ reserve_list[activeReserve].dbsdate }}</p>
									</div>
									<div class="col-lg-4">
										대여기간
										<p style="font-weight: bold;margin: 0">{{period}}일</p>
									</div>
									<div class="col-lg-4">
										반납일
										<p style="font-weight: bold;margin: 0">{{ reserve_list[activeReserve].dbedate }}</p>
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
										      					{{reserve_list[activeReserve].name}}
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>휴대폰</b></h3>
										      					{{reserve_list[activeReserve].phone}}
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>이메일</b></h3>
										      					{{reserve_list[activeReserve].email}}
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>생년월일</b></h3>
										      					{{reserve_list[activeReserve].birth}}
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>가격</b></h3>
										      					{{reserve_list[activeReserve].price}}원
										      				</div>
										      				<div class="col-lg-4">
										      					<h3 style="margin-bottom: 10px;"><b>예약상태</b></h3>
										      					{{reserve_list[activeReserve].rstate}}
										      				</div>
										      			</div>
													</template>
										      		<template v-if="index == 1">
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
										    	</div>
										  	</div>
										</div>
									</div>
									
									<div class="col-lg-6 text-left" style="margin-top: 10px;">
										예약일 : {{reserve_list[activeReserve].dbdate}}
									</div>
									<div class="col-lg-6 text-right" style="margin-top: 10px;">
										<input type="button" value="예약취소" class="btn btn-sm btn-danger" 
											v-if="reserve_list[activeReserve].rstate=='취소 요청'" 
											@click="reserveDeleteBtn(reserve_list[activeReserve].rno)"
										>
										
										<input type="button" value="예약승인" class="btn btn-sm btn-success" 
											v-if="reserve_list[activeReserve].rstate=='대기'" 
											@click="reserveOkBtn(reserve_list[activeReserve].rno)"
										>
										
										<span v-if="reserve_list[activeReserve].reviewok!=0">리뷰 작성됨</span>
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
			fd:'',
			type:1,
			activeReserve:0,
			activeTab: 0,
		    tabs: [
		      { title: "예약정보", content: "Content for Tab 1" },
		      { title: "차량정보", content: "Content for Tab 2" },
		    ],
		    reserve_list:[],
		    rent_detail:{},
		    period:0,
		    option:[]
		}, 
		mounted:function(){
			this.listData(0)
		},
		methods:{
			listData(index){
				axios.get("../rent/admin_rent_reserve_list_vue.do", {
					params:{
						fd:this.fd,
						type:this.type
					}
				}).then(res=>{
					console.log(res.data)
					this.reserve_list=res.data
					this.reserveClick(index,this.reserve_list[index].fno);
				})
			},
			setActiveTab(index) {
		      	this.activeTab = index;
		    },
		    findData(){
				this.listData(0)
		    },
		    reserveClick(index, rno){
		    	this.activeReserve=index;
		    	axios.get('../rent/rentDetail_vue.do',{
		    		params:{
		    			rno:rno
		    		}
		    	}).then(res=>{
		    		console.log(res.data)
		    		this.rent_detail=res.data
			    	this.option=this.rent_detail.car_option.split(",")
		    	})
		    	
				let sDate = new Date(this.reserve_list[this.activeReserve].dbsdate);
				let eDate = new Date(this.reserve_list[this.activeReserve].dbedate);
				let diff = Math.abs(eDate.getTime() - sDate.getTime());
				diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
				console.log(diff);
				this.period=diff
		    },
		    //버튼
		    reserveDeleteBtn(rsno){
		    	axios.get('../rent/reserve_delete_vue.do',{
		    		params:{
		    			rsno:rsno
		    		}
		    	}).then(res=>{
		    		this.listData(this.activeReserve)
		    	})
		    },
		    reserveOkBtn(rsno){
		    	axios.get('../rent/reserve_ok_vue.do',{
		    		params:{
		    			rsno:rsno
		    		}
		    	}).then(res=>{
		    		this.listData(this.activeReserve)
		    	})
		    }
		}
	})
	
</script>
</body>
</html>