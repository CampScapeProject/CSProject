	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/d65519dfe2.js" crossorigin="anonymous"></script>
	
	<style type="text/css">
	.order_table{
		padding-top: 4.5rem;  
		margin-left:100px;
	}
	.order_table>p{
		font-size: 3rem;
		border-bottom: 2px solid #222;
		padding: 0 0 10px 40px;
	}
	.order_table .order_list{
		padding: 1rem;
		font-size: 14px;
		}
	.order_table .order_list li>div{
		display: inline-block;
	}
	.order_table .order_list li:first-of-type .del_btn{
		float: right;
		background:url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/icon_trash.svg) no-repeat 5px;
		border: 1px solid #222;
		margin-bottom: 1.5rem;
		padding: 2px 5px 2px 25px;
	}
	.order_table .order_list li{
		border-bottom: 1px solid #ccc;
		padding: 15px 0;
		position: relative
	}
	.order_table .order_list li>div.item_detail p{
		display: inline-block;
		font-size: 16px;
		width: 60%
	}
	.order_table .order_list li>div.item_detail .txt{
		margin-top: 1rem
	}
	.order_table .order_list li>div.opt_info{
		position: absolute; 
		right: 0; 
		top: 34%; 
		max-width: 39%; 
		width: 300px;
	}
	.order_table .order_list li>div.opt_info .price_btn input {
		font-size: 0; 
		margin-left: -1px; 
		cursor: pointer; 
		color: #ccc; 
		width: 30px; 
		height: 30px; 
		border: 0; 
		outline: 0; display: inline-block;
		text-align: center; 
		vertical-align: 
		top;background-size: cover !important;
	}
	.order_table .order_list li>div.opt_info .price_btn input.minus_btn{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/btn_minus.svg) no-repeat center;
	}
	.order_table .order_list li>div.opt_info .price_btn input.plus_btn{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/btn_plus.svg) no-repeat center;
	}
	.order_table .order_list li>div.opt_info .price_btn input.number{
		font-size: 18px; 
		background: #f5f5f5; 
		color: #666; 
		margin: 0 3px;
	}
	.order_table .order_list li>div.opt_info>div{
		display: inline-block
	}
	.order_table .order_list li>div.opt_info>div.total_p{
		font-size: 18px; 
		float: right;
	}
	.order_table .order_list li>div.opt_info>div.total_p strong{
		vertical-align: sub; margin-right: 6px;
	}
	.order_table .order_list li>div.opt_info>div.total_p span{
		width: 30px;
		display: inline-block;
	}
	.order_table .order_list li>div.item_detail{
		width: 90%;
	}
	.order_table .order_list li>div.item_detail img{
		max-width: 150px; 
		width: 25%; 
		margin: 0 5%; 
		float: left;
	}
	.order_table .order_total_area{
		padding:0 4rem; 
	}
	.order_table .order_total_area>p{
		font-size: 20px;
	}
	.order_table .order_total_area .order_total_price{
		border: 2px solid #707070; 
		padding: 2rem; 
		margin: 2rem auto; 
		text-align: center;
	}
	.order_table .order_total_area .order_total_price p{
		display: inline-block; 
		text-align: left;
	}
	.order_table .order_total_area .order_total_price p>span{
		width: 22px; 
		height: 22px; 
		display: inline-block; 
		vertical-align: middle; 
		margin: 0 20px; 
		background-size: cover !important;
	}
	.plus_ic{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/ic_plus_sqaure.svg);
	}
	.equal_ic{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/ic_equal_square.svg);
	}
	.order_table .order_total_area .order_total_price p>strong{
		display: inline-block; 
		margin-left: 10px; 
		margin: 0 5px 0 10px; 
		font-size: 20px; 
		vertical-align: unset;
	}
	.order_table .btn_box{
		padding: 4rem; 
		text-align: center;
	}
	.order_table .btn_box .btn{
		padding: 10px 0; 
		width: 24%; 
		margin: 0 1%;
	}
	.order_table .btn_box .black-btn{
		float: none;
	}
	
	</style>
	
	</head>
	<body>
	
	<div style="margin-left=100px;"></div>
	
		<div class="order_table">
		    <p>결제 내역</p>
		    <ul class="order_list">
		        <li v-for="(b,index) in orderList" :key="index">
		            <div class="checkbox">
		                {{index+1}}
		            </div>
		            <div class="item_detail">
		                <img :src="b.image" style="display: inline-block;">
		                <div class="name" style="display: inline-block;fnot-size:18px"><strong>{{b.name}}</strong></div>
		            </div>
		            <div class="opt_info">
		                <strong class="price_unit">{{ b.price.toLocaleString() }}</strong>원
		                <div class="price_btn">
		                    <input type="text" :value="b.amount" class="number"> 개
		                </div>
		                <div class="total_p">
		                    <strong class="price_amount">{{ (b.price * b.amount).toLocaleString() }}</strong>원
		                </div>
		            </div>
		        </li>
		    </ul>
		    <div class="order_total_area">
		        <p>결제 정보</p>
		        <div class="order_total_price">
		            <p>총 수량 <strong class="item_price">{{ totalAmount.toLocaleString() }}</strong>개</p>&nbsp;&nbsp;
		            <p>총 결제금액 <strong class="total_price color-red">{{ totalPrice.toLocaleString() }}</strong>원</p>
		        </div>
		    </div>
		    <div class="btn_box">
		        <button type="button" @click="goBack" class="btn wh-btn">계속 쇼핑하기</button>
		        <!-- <button type="button" class="btn black-btn">구매하기</button> -->
		    </div>
		</div>
	
	<script>
	
	    new Vue({
	        el: '.order_table',
	        data: {
	            id: '${sessionScope.id}',
	            orderList: [],
	            totalPrice:0,
	            totalAmount:0,
	            sno:0
	        },
	        mounted: function () {
               	axios.get('../mypage/order_detail_vue.do',{
               		params:{
               			id:this.id,
               		}
              	}).then(res=>{
              		console.log(res.data)
					this.orderList=res.data
	                this.calculateTotalPrice();
	                this.calculateTotalAmount();
              	})
              	
	        },
	        methods: {
	            goBack() { 
	        		location.href="../shop/shop_main.do";
	                /* 이전페이지 location.href = document.referrer; */
	            },
	            calculateTotalPrice() {
	                this.totalPrice = this.orderList.reduce((total, item) => total + (item.price * item.amount), 0);
	                // reduce 배열 내 각 요소 처리 후 누적 결과 계산하는 메서드
	                // total: 누적 값의 변수 초기값 0 / item: 배열 요소 값
	        	},
	            calculateTotalAmount() {
	        		this.totalAmount = this.orderList.reduce((total, item) => total + item.amount, 0); 
	        	}
	        }    
	    })
	
	</script>
	
	
	
	</body>
	</html>