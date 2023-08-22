<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape Shopping</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 

<style type="text/css">
	#menu {
		margin: 0px auto;
		background-color: #538053;
		border-radius: 30px;
	}
	
	#navbar {
		text-align: center;
		margin-top: 25px;
		margin-left: 90px;
	}
	
	.nav-item {
		margin-left: 20px;
		margin-right: 20px;
	}
	
	.nav-link {
		font-size : 15px;
		color : white;
	}
	
	h3 {
		font-size: 24px;
	}
	
	.detail-data {
		margin-left: 50px;
		color: #3C3C3C;
	}
	
	#goods_image {
		padding: 30px;
	}
	
	.selected-goods {
		width: 100%;
		padding: 10px 20px 10px 20px;
		background-color: #f5f5f5;
		font-weight: 600;
	}
	
	.goods_detail_image {
		text-align: center;
		margin-top: 70px;
	}
	
	form {
		display: inline;
	}
 	#detailImages {
	/* 	width:900px; */
		text-align: center;
	} 
	
	.wrap {
	  height: 100%;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.buttonGo {
	  width: 160px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 11px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  }
	
	.buttonGo:hover {
	  background-color: #2EE59D;
	  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	  color: #fff;
	  transform: translateY(-7px);
	}
	.button-container {
	  display: flex;
	  justify-content: space-between;
	  width: 100%;
	  padding-left: 70px;
	  padding-right:70px;
	}
</style>
 
</head>
<body>

<div class="shop_detail">
	<table class="detail-data" style="margin-bottom: 30px;">
		<tbody>
		<tr>
			<td width="50%" rowspan=7 id="goods_image">
				<img :src="shopDetail.image" style="width: 100%">
			</td>
			<td width="50%"><h3>{{shopDetail.brand}}</h3></td>
		</tr>
		<tr>
			<td width="50%">{{shopDetail.name}}</td>
		</tr>
		<tr>
			<td width="50%"><span>{{shopDetail.price.toLocaleString()}}</span>원</td>
		</tr>
		<tr>
			<td width="50%">배송비 : <span id="price">3,000</span>원</td>
		</tr>
		<tr>
			<td width="50%">수량&nbsp;&nbsp;
			<select class="form-select" style="width: 80px;" v-model="amount" name="amount">
				    <option v-for="i in 10" :key="i" :value="i">{{ i }}개</option>
				</select>
				</td>
			</tr>
			<tr>
			    <td>
			        <div class="selected-goods">
			            <br>
			            <div class="text-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 금액 : <span id="total">{{ totalPrice.toLocaleString() }}원</span></div>
			        </div>
			    </td>
			</tr>
			<tr class="text-center">
				<td width="60%" class="button-container">
					<div class="wrap">
					  <button class="buttonGo" value="구매하기" id="orderBtn" @click="buyNow">구매하기</button>
					</div>
					<div class="wrap">
					  <button class="buttonGo" value="찜하기" @click="basketGo">찜하기</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table> 
	<div id="detailImages">
		<div v-for="imageUrl in imageUrls" :key="imageUrl">
		    <img :src="imageUrl" style="width: 70%">
		</div>
	</div>
</div>

<script>

	new Vue({
		el:'.shop_detail',
		data:{
			sno:${sno},
			shopDetail:[],
			amount:1,
			imageUrls:[],
			id:'${sessionScope.id}',
			price:0,
			totalPrice:0
		},
 		methods: {
		    buyNow() {
		    	if(this.id==='') {
		    		alert('로그인이 필요합니다.')
		    	} else {
		    		const url='../shop/shop_pay.do?sno='+this.sno+'&amount='+this.amount;
		            window.location.href = url;
		    	}

		    },
		    basketGo() {
			    	if(this.id==='') {
			    		alert('로그인이 필요합니다.')
			    	} else {
			    		alert('찜했습니다!')
			        	axios.get('../shop/shop_basketInsert_vue.do',{
			        		params:{
			        			sno:this.sno,
			        			id:this.id,
			        			amount:this.amount,
			        			price:this.price
			        		}
			        	}).then(res=>{
			        		location.href="../mypage/shop_basket.do";
			        	})
			    	}
		        },
            calculateTotalPrice() {
		    	this.totalPrice = this.shopDetail.price * this.amount; 
        	}
		},
		computed: {
		    totalPrice() {
		        return this.shopDetail.price * this.amount;
		    }
		},
		mounted: function(){	
			axios.get('../shop/shop_detail_vue.do',{
				params:{
					sno:this.sno
				}
			}).then(res=>{
				this.shopDetail=res.data.shopDetail;
				this.imageUrls=res.data.imageUrls;
				 this.calculateTotalPrice();
	
			}).catch(error=>{
				console.error(error);
			})
		}
	})

</script>

</body>
</html>