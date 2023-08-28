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
</head>

<style type="text/css">
* {
  box-sizing: border-box;
}

#Bbody {
  margin: 20px 0;
  padding: 0;
  font-family: arial, sans-serif;
  overflow: scroll;
}

#Bimg {
  max-width: 60%;
  vertical-align: middle;
  border-radius: 4px;
}

#B-a {
  text-decoration: none;
  color: #333333;
}

#B-a:hover {
  color: #f58551;
}

button {
  background-color: #16cc9b;
  border: 2px solid #16cc9b;
  color: #ffffff;
  transition: all 0.25s linear;
  cursor: pointer;
}

button::after {
  position: relative;
  right: 0;
  content: " \276f";
  transition: all 0.15s linear;
}

button:hover {
  background-color: #f58551;
  border-color: #f58551;
}

button:hover::after {
  right: -5px;
}

button:focus {
  outline: none;
}

ul {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

input {
  transition: all 0.25s linear;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}

input {
  outline: none;
}

.container {
  width: 90%;
  margin: 0 auto;
  overflow: auto;
}

/* --- HEADER --- */
#Bheader .container {
  margin-bottom: 1.5rem;
}

#Bheader .breadcrumb {
  color: #7d7d7d;
}

#Bheader .breadcrumb li {
  float: left;
  padding: 0 6px;
  height: 20px;
  line-height: 20px;
}

#Bheader .breadcrumb li:first-child {
  padding-left: 2px;
}

#Bheader .breadcrumb li:not(:last-child)::after {
  content: " \276f";
  padding-left: 8px;
}

#Bheader .count {
  float: right;
  color: #333333;
  height: 20px;
  line-height: 20px;
}

/* --- PRODUCT LIST --- */
.products {
  border-top: 1px solid #ddd;
}

.products > li {
  padding: 1rem 0;
  border-bottom: 1px solid #ddd;
}

.row {
  position: relative;
  width: 100%;
}

.Bcol,
.quantity,
.remove {
  float: left;
}

.Bcol.left {
  width: 70%;
}

.Bcol.right {
  width: 30%;
  position: absolute;
  right: 0;
  top: calc(50% - 30px);
}

.detail {
  padding: 0 0.5rem;
  line-height: 2.2rem;
}

.detail .name {
  font-size: 1.2rem;
}

.detail .description {
  color: #7d7d7d;
  font-size: 1rem;
}

.detail .price {
  font-size: 1.5rem;
}

.quantity,
.remove {
  width: 50%;
  text-align: center;
}

.remove svg {
  width: 60px;
  height: 60px;
}

.quantity > input {
  display: inline-block;
  width: 60px;
  height: 60px;
  position: relative;
  left: calc(50% - 30px);
  background: #fff;
  border: 2px solid #ddd;
  color: #7f7f7f;
  text-align: center;
  font: 600 1.5rem Helvetica, Arial, sans-serif;
}

.quantity > input:hover,
.quantity > input:focus {
  border-color: #f58551;
}

.close {
  fill: #7d7d7d;
  transition: color 150ms linear, background-color 150ms linear,
    fill 150ms linear, 150ms opacity linear;
  cursor: pointer;
}

.close:hover {
  fill: #f58551;
}

/* --- SUMMARY --- */
.promotion,
.summary,
.checkout {
  float: left;
  width: 100%;
  margin-top: 1.5rem;
}

.promotion > label {
  float: left;
  width: 100%;
  margin-bottom: 1rem;
}

.promotion > input {
  float: left;
  width: 80%;
  font-size: 1rem;
  padding: 0.5rem 0 0.5rem 1.8rem;
  border: 2px solid #16cc9b;
  border-radius: 2rem 0 0 2rem;
}

.promotion:hover > input {
  border-color: #f58551;
}

.promotion > button {
  float: left;
  width: 20%;
  height: 2.4rem;
  border-radius: 0 2rem 2rem 0;
}

.promotion:hover > button {
  border-color: #f58551;
  background-color: #f58551;
}

.promotion > button::after {
  content: "\276f";
  font-size: 1rem;
}

.summary {
  font-size: 1.2rem;
  text-align: right;
}

.summary ul li {
  padding: 0.5rem 0;
}

.summary ul li span {
  display: inline-block;
  width: 30%;
}

.summary ul li.total {
  font-weight: bold;
}

.checkout {
  text-align: right;
}

.checkout > button {
  font-size: 1.2rem;
  padding: 0.8rem 2.8rem;
  border-radius: 1.5rem;
}

.empty-product {
  text-align: center;
}

.empty-product > button {
  font-size: 1.3rem;
  padding: 10px 30px;
  border-radius: 5px;
}

/* --- SMALL SCREEN --- */
@media all and (max-width: 599px) {
  .B-thumbnail #Bimg {
    display: none;
  }

  .quantity > input {
    width: 40px;
    height: 40px;
    left: calc(50% - 20px);
  }

  .remove svg {
    width: 40px;
    height: 40px;
  }
}

/* --- MEDIUM & LARGE SCREEN --- */
@media all and (min-width: 600px) {
  html {
    font-size: 14px;
  }

  .container {
    width: 75%;
    max-width: 960px;
  }

  .B-thumbnail,
  .detail {
    float: left;
  }

  .B-thumbnail {
    width: 30%;
  }

  .detail {
    width: 65%;
  }

  .promotion,
  .summary {
    width: 50%;
  }

  .checkout {
    width: 100%;
  }

  .checkout,
  .summary {
    text-align: right;
  }
}

#B-app{
	font-size: 10px;
}

/* --- LARGE SCREEN --- */
@media all and (min-width: 992px) {
  html {
    font-size: 12px;
  }
}

</style>
</head>

<body id="Bbody">

	<div id="B-app" >
	  <!-- Header -->
	  <header id="Bheader" class="container">
	    <h1>Order List</h1>
	    <ul class="breadcrumb">
	      <li>MyPage</li>
	      <li>Order List</li>
	    </ul>
	    <span class="count"> items in the bag</span>
	  </header>
	  <!-- End Header -->
	
	  <!-- Product List -->
	  <section class="container">
	    <div>
	      <ul class="products">
	      <li class="row" v-for="(b,index) in orderList" :key="index">
	        <div class="Bcol left">
	          <div class="B-thumbnail">
	            <a href="#" id="B-a">
	              <img :src="b.image" id="Bimg" style="width: 90px"/>
	            </a>
	          </div>
	          <div class="detail">
	            <div class="name"><a href="#" id="B-a">{{b.name}}</a></div>
	            <div class="description">{{b.brand}}</div>
	            <div class="price">{{ b.price.toLocaleString() }}</div>
	          </div>
	        </div>
	
	        <div class="Bcol right">
	          <div class="quantity">	
	            <input type="number" class="quantity" :value="b.amount" />
	          </div>
	          
	          <div class="remove">
	          <div>구매일자 : </div>
	          	{{ b.dbday }}
	          </div>
	          
	        </div>
	      </li>
	    </ul>
	    </div>
	    <div>
	<!--       <h3>There are no products in your cart.</h3> -->
	      <button type="button" @click="goBack" >Shopping now</button>
	    </div>
	  </section>
	  <!-- End Product List -->
	  
	  <!-- Summary -->
	  <section class="container">
	    <div class="promotion">
	      <label for="promo-code">Have A Promo Code?</label>
	      <input type="text" id="promo-code"/> <button type="button"></button>
	    </div>
	
	    <div class="summary">
	      <ul>
	        <li>Amount <span>{{ totalAmount.toLocaleString() }}</span></li>
	        <li class="total">Total <span>{{ totalPrice.toLocaleString() }}</span></li>
	      </ul>
	    </div>
	
	    <div class="checkout">
	      <button type="button">Check Out</button>
	    </div>
	  </section>
	  <!-- End Summary -->
	</div>

	<script>
	
	    new Vue({
	        el: '#B-app',
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