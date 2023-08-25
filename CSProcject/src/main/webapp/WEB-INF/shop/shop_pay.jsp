<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape Order</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style type="text/css">
    .row1 {
        margin: 0px auto;
        width: 900px;
    }

    .table > th { 
        vertical-align: middle;
        text-align: center;
    }

    #order {
        padding-left: 740px;
    }

    .buyForm {
        clear: both;
        margin-top: 20px;
        in
    }
    .rowPay {
    
    }
    
</style>

</head>
<body>

<div style="height: 100px;"></div>

<div class="pay_container">
	<div class="rowPay" id="buy">
		<div class="row1" style="margin-top:50px; ;margin-bottom: 100px;">
			<h3 style="margin-bottom: 20px">주문 상품</h3>
			<table class="table">
				<tr class="success">
					<th width=30%></th>
					<th width=40% class="text-center">상품명</th>
					<th width=10% class="text-center">가격</th>
					<th width=10% class="text-center">수량</th>
					<th width=10% class="text-center">Total</th>
				</tr>
				<form>
					<tr style="padding: 10px;">
						<td width=30%>
							<img :src="buyDetail.image" style="width: 100px; height: 100px;" id="ono">
						</td>
						<td width=40% class="text-center" style="vertical-align: middle;">{{buyDetail.name}}</td>
						<td width=10% class="text-center" style="vertical-align: middle;" v-model="price">{{buyDetail.price.toLocaleString()}}</td>
						<td width=10% class="text-center" style="vertical-align: middle;">{{amount}}</td>
						<td width=10% class="text-center total" style="vertical-align: middle;" v-model="amount">{{ (amount * buyDetail.price).toLocaleString() }}</td>
						<input type="hidden" :value="sno">
					</tr>
				</form>	
			</table>
		</div>
	
		<div class="row1 buyForm" >
			<h3 style="margin-bottom: 20px">주문자 정보</h3>
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<th width=10% class="success text-center">이름</th>
					<td width=40%>
						<input type="text" class="form-control-sm" v-model="name" id=name :value="name">
					</td>
					<th width=10% class="success text-center">연락처</th>
					<td width=40%>
						<input type="text" class="form-control-sm" v-model="phone" id=phone placeholder=" -를 포함해서 입력하세요 " :value="phone">
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">우편번호</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="post" id=post style="margin-right: 10px;display: inline;" :value="post">
						<input type="button" class="btn btn-sm btn-default" value="우편번호 검색" id="postBtn" >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">주소</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="addr1" id=addr1 size=100 value="addr1">
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">상세주소</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="addr2" id=addr2 value="addr2">
					</td>
				</tr>
			</table>
		</div>
		<div class="row1" id="order" style="margin-bottom: 80px;">
			<table>
				<tr>
					<td colspan=2>
						<input type=submit class="btn btn-lg btn-success" value="결제하기" style="width: 150px;" id="buyBtn" @click="pay">
						<input type=hidden >
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<script>

	var vueApp=new Vue({
		el:'.pay_container',
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
		    buyDetail:{},
		    tAmount:1
		},
		mounted:function(){
		    const urlParams = new URLSearchParams(window.location.search);
		    this.sno = urlParams.get('sno');
		    this.amount = urlParams.get('amount');
			
	        axios.get('../shop/shop_pay_vue.do',{
	            params: {
	                sno:this.sno
	            }
	        }).then(res=>{
/* 	        	console.log(res.data) */
	        	this.buyDetail=res.data
	        }).catch(error=>{
	        	console.log(error)
	        })
		},
		methods: {
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
		
	   $('#postBtn').click(function(){
	     new daum.Postcode({
	        oncomplete:function(data) {
	           $('#post').val(data.zonecode)
	           $('#addr1').val(data.address)
	        }
	     }).open()
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

		            axios.post("../shop/shop_pay_ok.do", form, {
		                header:{
		                   'Content-Type':'multipart/form-data'
		                }
		             }).then(res=>{
		                
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

		            axios.post("../shop/shop_pay_ok.do", form, {
		                header:{
		                   'Content-Type':'multipart/form-data'
		                }
		             }).then(res=>{
		                
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