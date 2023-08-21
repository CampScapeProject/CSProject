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
			<td width="50%"><span>{{shopDetail.priceFormatted}}</span></td>
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
					    <div class="text-right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 금액 : <span id="total">{{ shopDetail.price*amount }}</span>&nbsp;원</div>
					</div>
				</td>
			</tr>
			<tr class="text-center">
				<td width="60%">

							<input type=submit class="btn btn-default" style="width: 200px;" value="구매하기" id="orderBtn" @click="buyNow">
					<button class="btn btn-default" >장바구니</button>
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
			amount:1
		},
		methods: {
		    buyNow() {
		        axios.get('../shop/shop_pay.do', {
		            params: {
		                sno: this.sno,
		                amount: this.amount
		            }
		        })
		        .then(response => {
		            window.location.href = "../shop/shop_pay.do";
		        })
		        .catch(error => {
		            console.error(error);
		        });
		    }
		},
		computed: {
		    totalPrice() {
		        console.log(this.amount);
		        console.log(this.shopDetail.price);
		        return this.shopDetail.price * this.amount;
		    },
		    totalPriceFormatted() {
		        return this.totalPrice.toLocaleString();
		    }
		},
		mounted: function(){	
			axios.get('../shop/shop_detail_vue.do',{
				params:{
					sno:this.sno
				}
			}).then(res=>{
				console.log(res.data)
				this.shopDetail=res.data.shopDetail;
				this.imageUrls=res.data.imageUrls;
			    if (typeof this.shopDetail.price === 'number') {
			        this.shopDetail.priceFormatted = this.shopDetail.price.toLocaleString();
			    }
			}).catch(error=>{
				console.error(error);
			})
		}
	})

</script>

</body>
</html>