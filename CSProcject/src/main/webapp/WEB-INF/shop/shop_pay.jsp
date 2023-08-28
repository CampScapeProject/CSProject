<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape pay</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<style type="text/css">

* {
  box-sizing: border-box;
  /*font-family: 'Montserrat', sans-serif;
  font-family: 'Roboto', sans-serif;
  font-family: 'Open Sans', sans-serif;
  font-family: 'Source Sans Pro', sans-serif;
  font-family: 'Raleway', sans-serif;
  font-family: 'Muli', sans-serif;
  font-family: 'Josefin Sans', sans-serif;
  font-family: 'Quicksand', sans-serif;

*/
  font-family: 'Roboto'
}


/*** Start Parent & Son ***/

.parent {
  margin: 0 auto;
  width: 800px;
  padding: 30px 0;
  border-radius: 5px;
  height: 100vh;
  min-height: 670px

}

.parent .son {
  width: 100%;
  max-width: 900px;
  height: 100%;
  padding: 35px 0 55px 0;
  margin: 0 auto;
/*   background-image: linear-gradient(to right, #2c73d2, #6d6fd2, #9869cc, #ba63c1, #d65db1); */
  overflow: hidden;
  border-radius: 5px;
/*   box-shadow:  0px 1px 25px 0px rgba(50, 50, 50, 0.91); */

}

.parent .son .container {
  display: flex; /* 추가: 요소를 가로로 나란히 배치 */
  justify-content: space-between; /* 추가: 왼쪽과 오른쪽 요소 사이의 간격을 벌림 */
  align-items: flex-start; /* 추가: 위쪽 정렬 */
  height: 100%;
  position: relative;
  right: -30px;
  margin: 0 auto;
  max-width: 750px;
}


/*** End Parent & Son ****/

/*** Start Left ****/

.parent .son #left,
.parent .son .right {
  display: inline-block
}

.parent .son #left {
  width: 310px;
  height: 370px;
  overflow: hidden;
  position: relative;
  z-index: 333;
  border-radius: 5px;
  box-shadow: 0px 1px 22px 0px rgba(50, 50, 50, 0.65);
  margin-top: 20px; 
}

.parent .son #left .img {
  background-size: cover;
  width: 100%;
  height: 62%;
}

.parent .son #left .info {
  width: 100%;
  height: 38%;
  overflow: hidden;
  background-image: linear-gradient(to right, #845ec2, #7464c8, #6169cd, #4b6ed0, #2c73d2);
}

.parent .son #left .info ul:first-of-type {
  float: left;
  width: 50%;
  height: 100%;
  color: white;
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  padding-top: 40px;
  padding-left: 30px
}

.parent .son #left .info ul:first-of-type li:last-of-type {
  font-size: 28px;
  margin-top: 20px
}

.parent .son #left .info ul:last-of-type {
  float: right;
  width: 50%;
  height: 100%;
  color: white;
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  padding-top: 35px;
  padding-right: 30px;
  text-align: right
}

#left .info ul:last-of-type li:nth-of-type(2) {
  margin-bottom: 20px;
}

#left .info ul:last-of-type li:nth-of-type(2),
#left .info ul:last-of-type li:last-of-type {
  font-size: 12px
}

#left .info ul:last-of-type li:nth-of-type(3),
#left .info ul:last-of-type li:first-of-type {
  color: #95a5a6;
  margin-bottom: 4px
}

#left .circle1 {
  width: 81px;
  height: 81px;
  position: absolute;
  top: 147px;
  right: 50%;
  transform: translate(50%, 50%);
  background-color: #55338D;
  border-radius: 50%;
  font-size: 12px;
  margin: 0 auto;
  text-align: center;
  padding-top: 5px;
  box-shadow: 0px 1px 25px 0px rgba(50, 50, 50, 0.51);
}

#left .circle1 .circle {
  border-right: 3px solid #0081CF;
  border-top: 3px solid #0081CF;
  border-left: 3px solid #fff;
  border-bottom: 3px solid #fff;
  width: 69px;
  height: 70px;
  border-radius: 50%;
  margin: 0 auto;
  padding-top: 16px;
  position: relative;
  top: 0;
  right: 0px
}

#left .circle1 .circle span {
  display: block;
  font-size: 7.5px;
  text-transform: uppercase;
  font-weight: bold
}

#left .circle1 .circle span:first-child {
  color: #95a5a6
}

#left .circle1 .circle span:last-child {
  color: #fff;
  font-size: 14.5px;
  padding: 3px
}


/*** End Left ***/

/*== Start Right ==*/

.parent .son .right {
  height: auto;
  width: 380px;
  position: relative;
  top: -12px;
  right: 55px;
  /*position: absolute;
  top: 40px;
  right: 140px;*/
  background-color: #fff;
  border-radius: 5px;
  box-shadow:  0px 1px 25px 0px rgba(50, 50, 50, 0.91);

}

.parent .son .right .up {
  width: 100%;
  height: 43%;
  background-image: linear-gradient(to right top, #ecf0f1, #e7f5f4, #e6faf1, #eefde8, #fefedf);
  padding: 40px 40px 0 80px;
  border-radius: 5px 5px 0 0
}

.son .right .up ul:first-of-type li:first-of-type{
  margin-bottom: 15px;
  color: #2A3350;
  font-weight: bold;
  font-size: 23px;
}

.son .right .up ul:first-of-type li:not(:first-of-type) {
  color: #34495e;
  font-size: 12.5px;
  letter-spacing: .5px;
  line-height: 20px
}

.son .right .up ul:last-of-type li {
  display: inline-block;
  color: #bdc3c7;
  text-transform: uppercase;
  font-size: 11px;
  font-weight: bold;
  padding: 8px 25px;
  transition: all .3s ease-in-out;
  border-bottom: 2px solid transparent;
}

.son .right .up ul:last-of-type li + li {
  margin-left: 44px;
  margin-top: 29px;
}

.son .right .up ul:last-of-type li:hover,
.son .right .up ul:last-of-type .activecr {
  border-bottom: 2px solid #2C73D2;
  color: #2c3e50;
}

.son .right .down {
  width: 100%;
  height: calc(100% - 43%);
  padding: 30px 0 40px 80px;
}

.son .right .down .payment label {
  display: block;
  color: #bdc3c7;
  font-size: 11px;
  font-weight: bold;
  text-transform: uppercase;
  margin-bottom: 7px
}

.son .right .down .payment input {
  border: 1px solid transparent;
  box-shadow: 0px 0px 17px 0px rgba(50, 50, 50, 0.12);
  padding: 7px;
  margin-bottom: 3px;
  color: #34495e;
  border: 1px solid #ecf0f1;
  border-radius: 3px
}

.son .right .down .payment label {
  transition: all .3s ease-in-out
}

.son .right .down .payment .form-group:hover label/*******,
.son .right .down .payment form .form-group .cardNumber *******/ {
  color: #2c3e50
}

.son .right .down .payment .form-control1 {
  width: 257px
}

.son .right .down .payment select {
  border: none;
  border-bottom: 1.5px solid #bdc3c7;
  color: #bdc3c7;
  margin-right: 20px;
  font-size: 11px;
  margin-bottom: 20px;
  box-shadow:  0px 0px 22px 0px rgba(50, 50, 50, 0.09);
  padding: 5px
}

.son .right .down .payment .lab {
  width: 190px;
}

.son .right .down .payment .lab,
.son .right .down .payment .lab select {
  transition: all .3s ease-in-out
}


.son .right .down .payment .lab:hover label{
  color: #2c3e50;
}

.son .right .down .payment .lab:hover select,
.son .right .down .payment .CVV input:hover {
  color: #2c3e50;
  border-bottom: 1.5px solid #2c3e50
}

.son .right .down .payment .form-group1 {
  position: relative
}

.son .right .down .payment .CVV {
  width: 75px;
  position: absolute;
  top: 0px;
  right: 40px;
  height: 100%;
}

.son .right .down .payment .CVV input {
  width: 70px;
  padding: 4px;
  margin-bottom: 0;
  transition: all .3s ease-in-out;
  border-bottom: 1.5px solid transparent
}

.btn {
  margin-top: 5px
}
.son .right .down .payment button {
  background-image: linear-gradient(to left, #845ec2, #7464c8, #6169cd, #4b6ed0, #2c73d2);
  border: none;
  padding: 13px;
  width: 256px;
  color: #fff;
  font-size: 18px;
  box-shadow:  0px 0px 22px 0px rgba(50, 50, 50, .4);
  border-radius: 5px;
  cursor: pointer;
  position: relative
}

.right .down .payment button:after {
  content:'Donate Now!';
  display: inline-block;
  color: #fff;
  font-size: 18px;
  line-height: 49px;
  width: 256px;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  background-image: linear-gradient(to left bottom, #2c73d2, #6d6fd2, #9869cc, #ba63c1, #d65db1);
  opacity: 0;
  border-radius: 5px;
  cursor: pointer;
  transition: opacity .2s ease-in-out
}

.right .down .payment button:hover:after {
  opacity: 1
}

/*== End Right ==*/

/*== Start Media ==*/

@media (max-width: 710px) {
  
  .parent {
    padding: 0;
    min-height: 1020px
  }
  
  .parent .son .container {
    right: 0
  }
  .son .container #left,
  .son .container .right {
    display: block;
    margin: 0 auto
  }
  
  .son .container .right {
    top: 0;
    right: 0;
    margin-top: 50px;
  }
  .son .container .right .up {
    padding: 40px 0 0 0;
    text-align: center
  }
  
  .son .container .right .down {
    padding: 40px 0px 40px 40px
  }
  
  .son .right .down .payment button,
  .right .down .payment button:after {
    width: 296px
  }
  
  .son .right .down .payment .form-control1 {
    width: 295px;
  }
}

@media (max-width: 415px) {
  .son .container #left,
  .son .container .right {
    width: 97%;
  }
  
  
  .son .right .up ul:first-of-type li:not(:first-of-type) {
    margin: 0 20px
  }
  
  .son .right .up ul:last-of-type li {
    display: inline-block;
  } 
  
  .btn {
    text-align: center;
    margin-right: 25px;
  }
  .son .right .down .payment button,
  .right .down .payment button:after {
    width: 200px;
  }
}

@media (max-width: 370px) {
  .son .right .down .payment .form-control1 {
    width: 200px;
  }
  
  .son .right .down .payment .CVV {
    width: 90px;
    position: static;
    top: 0;
    right: 0;
    margin-bottom: 20px
  }
  
  .son .right .down .payment .CVV input {
    width:  90px
  }
}
#detailImg {
	width:310px;
	height:230px;
}

</style>

<body>

	<div class="parent">
		<div class="son">
		    <div class="container">
			  	<form>
				    <div class="left" id="left">
					      <div class="img"><img :src="buyDetail.image" id="detailImg"></div>
					      <div class="info">
					        <ul>
					          <li>{{buyDetail.name}}</li>
					          <li v-model="amount" style="font-size:20px">{{ (amount * buyDetail.price).toLocaleString() }}원</li>
					        </ul>
					        <ul>
					          <li>수량</li>
					          <li>{{amount}}</li>
					          <li>가격</li>
					          <li>{{buyDetail.price.toLocaleString()}}</li>
					        </ul>
					      </div>
				    </div>
				</form>		    
			    <div class="right" style="font-size:15px">
				    <div class="up">
				        <ul>
				          <li><h3>It's almost done!</h3></li>
				        </ul>
				    </div>
			        <div class="down">
				        <div class="payment">
				     		<input type="hidden" :value="sno">
				            <div class="form-group1">
					            <div class="lab">
						            <label>이름</label>
									<input type="text" class="form-control1" v-model="name" id=name :value="name">
					            </div>
				            </div>
				            <div class="form-group1">
				                <label for="cvv">연락처</label>
				                <input type="text" class="form-control1" v-model="phone" id=phone placeholder=" -를 포함해서 입력하세요 " :value="phone">
				            </div>
				          	<div class="form-group1">
				                <label class="cardNumber">우편번호</label>
				                <input type="text" class="form-control1" v-model="post" id=post :value="post">
				                <input type="button" class="btn btn-sm btn-default" value="우편번호 검색" id="postBtn" @click="openPost">	
				          	</div>
				          	<div class="form-group1">
				                <label class="cardNumber">주소</label>
				                <input type="text" class="form-control1" v-model="addr1" id=addr1 value="addr1">
				         	</div>
				         	<div class="form-group1">
				                <label class="cardNumber">상세주소</label>
				                <input type="text" class="form-control1" v-model="addr2" id=addr2 value="addr2">
				          	</div>
				         	<div class="form-group1 btn" id="pay-now">
				                <input type=submit class="btn btn-default" id="confirm-purchase" id="buyBtn" value="결제하기" @click="pay">
				          	</div>
				    	</div>      
			   		</div>
				</div>          
			</div>
		</div>
	</div>
	
	<script>
	
		var vueApp=new Vue({
			el:'.parent',
			data:{
				sno:${sno},
			    amount:${amount},
			    price: 1,
			    name: '${sessionScope.name}',
			    phone:'${sessionScope.phone}',
			    post:'${sessionScope.post}',
			    addr1:'${sessionScope.addr1}',
			    addr2:'${sessionScope.addr2}',
			    id:'${sessionScope.id}',
			    cno: 0,
			    buyDetail:{},
			    tAmount:1
			},
			mounted:function(){
			    const urlParams = new URLSearchParams(window.location.search);
			    this.sno = urlParams.get('sno');
			    this.amount = urlParams.get('amount');
			    this.cno = urlParams.get('cno') || 0;
			    
		        axios.get('../shop/shop_pay_vue.do',{
		            params: {
		                sno:this.sno
		            }
		        }).then(res=>{
		        	console.log(res.data)
		        	this.buyDetail=res.data
		        	this.price=res.data.price
	
		        }).catch(error=>{
		        	console.log(error)
		        })
	
			},
			methods: {
			   openPost() {
				   const _this = this
				   new daum.Postcode({
				         oncomplete:function(data) {
				            /* $('#post').val(data.zonecode)
				            $('#addr1').val(data.address) */
				            console.log(_this)
				            _this.post = data.zonecode
				            _this.addr1 = data.address
				         }
				      }).open()
			   },
			    isEmpty(value) {
			        return value.trim() === '';
			    },
			    pay() {
			        if (this.isEmpty(this.addr2) || this.isEmpty(this.addr1) || this.isEmpty(this.post) || this.isEmpty(this.name) || this.isEmpty(this.phone)) {
			            alert('상세 정보를 입력해주세요!');
			            return;
			        }
				requestPay.call(this)
			    }
			}
		})
		
		
		$(function() {
			$('#buyBtn').click(function() {
			vueApp.pay();
			})
		}) 
	
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp37752386"); // 예: imp00000000
	
		function requestPay() {
			 // IMP.request_pay(param, callback) 결제창 호출
				IMP.request_pay({
				    pg : 'html5_inicis', // version 1.1.0부터 지원.
				    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트',
				    amount : 14000,
				    buyer_email : 'iamport@siot.do',
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678',
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456',
				    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
				}, function(rsp) {  
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        
			            let form = new FormData();
			            form.append("sno", vueApp.sno)
			            form.append("id", vueApp.id)
			            form.append("amount", vueApp.amount)
			            form.append("price", vueApp.price)
	
			            if(this.cno!==0) {
			            	form.append("cno",vueApp.cno)
			            }
	
			            axios.post("../shop/shop_pay_ok.do", form).
			            then(res=>{
			                
			                location.href="../mypage/shop_order.do"
			                
			             }).catch(error=>{
			                console.log(error.response)
			             })
	
				        
				    } else {
			            let form = new FormData();
			            form.append("sno", vueApp.sno)
			            form.append("id", vueApp.id)
			            form.append("amount", vueApp.amount)
			            form.append("price", vueApp.price)
			            
			            if(this.cno!==0) {
			            	form.append("cno",vueApp.cno)
			            }
	
			            axios.post("../shop/shop_pay_ok.do", form).
			            then(res=>{
			                
			                location.href="../mypage/shop_order.do"
			                
			             }).catch(error=>{
			                console.log(error.response)
			             })
				    }
				});
		}
		
	</script>

</body>
</html>