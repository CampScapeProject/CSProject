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
@charset "utf-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');



* {
  margin: 0;
  padding: 0;
  box-sizing: border-box; 
/*   border: 1px solid silver; */
}

body {
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 14px;
  line-height: 1.2rem;
  color: #11111;
  letter-spacing: -0.02rem;
}

h1 {
  font-size: 56px;
  font-weight: 600;
  line-height: 60px;
}

h2 {
  font-size: 40px;
  font-weight: 700;
  line-height: 51px;
}

h3 {
  font-size: 17px;
  font-weight: 500;
  line-height: 3rem;
  text-transform: uppercase;
}

h4 {
  font-size: 14px;
  font-weight: 700;
  line-height: 28px;
  text-transform: uppercase;
  font-family: 'Sen', sans-serif;
}

h5 {
  font-size: 32px;
  font-weight: bold;
  line-height: 24px;
  text-transform: uppercase;
  color: #545454;
  font-family: 'Sen', sans-serif;
}

h6 {
  font-size: 19px;
}

a:link {
  color: #292929;
  text-decoration: none;
}

a:visited {
  color: #292929;
}

a:hover {
  color: #292929;
}

a:active {
  color: #292929;
}

button {
  width: 122px;
  height: 42px;
  font-size: 14px;
  padding: 4px 4px;
  background: transparent;
  border: 1px solid black;
  transition: 0.8s;
  color: black;
  font-family: 'Noto Sans KR', sans-serif;
  cursor: pointer;
}

/* button:hover {
  background: white;
  border: 1px solid #ccc;
  color: #292929;
  cursor: pointer;
} */


input:focus {
  outline: none;
}



.event {
  background: black;
  color: white;
  width: 100%;
}

.event p {
  padding: 10px 5%;
  text-align: center;
}

main>img {
  width: 100%;
}

main section {
  padding: 0 5%;
}

main .product-info {
  padding: 16px 0;
  border-bottom: 2px solid black;
}

main .product-info>p {
  color: #979797;
}

main .product-info div {
  padding-top: 8px;
  display: flex;
  justify-content: space-between;
}

main .product-info div p:nth-child(2) {
  font-weight: 600;
}

main .price {
  padding: 16px 0;
  border-bottom: 1px solid #e5e5e5;
}

main .price ul li {
  list-style: none;
  display: flex;
}

main .price ul li:nth-child(1) {
  margin-bottom: 8px;
}

main .price ul li:nth-child(1) span:nth-child(1) {
  font-weight: 500;
  font-size: 12px;
  min-width: 90px;
}

main .price ul li:nth-child(1) span:nth-child(2) {
  text-decoration: line-through;
  color: #949494;
  padding-right: 10px;
}

main .price ul li:nth-child(1) span:nth-child(3) {
  font-weight: 700;
  font-size: 16px;
}

main .price ul li:nth-child(2) span:nth-child(1) {
  font-weight: 500;
  font-size: 12px;
  min-width: 90px;
}

main .option> :nth-child(1) {
  padding-top: 16px;
  display: flex;
}

main .option> :nth-child(1) span {
  width: 25%;
  line-height: 35px;
}

main .option> :nth-child(1) select {
  width: 100%;
  height: 35px;
  border: 1px solid #e5e5e5;
  background: none;
  color: #222;
  font-family: 'Noto Sans KR', sans-serif;
}

main .option> :nth-child(2) {
  width: 100%;
  background: #f6f6f6;
  border: 1px solid #e5e5e5;
  padding: 8px 24px;
  margin: 10px 0 16px 0;
  display: flex;
  justify-content: center;
  cursor: pointer;
  transition: 0.7s;
}

main .option> :nth-child(2):hover {
  background: #e5e5e5;
}

main .option> :nth-child(2) img {
  width: 30px;
  height: 30px;
}

main .option> :nth-child(2) span {
  line-height: 30px;
  padding-left: 10px;
  font-size: 500;
}

main .option> :nth-child(3) {
  border-top: 2px solid black;
  padding: 16px 0;
  display: flex;
  justify-content: space-between;
}

main .option> :nth-child(3)> :nth-child(1) {
  font-size: 12px;
  font-weight: 500;
  color: #333;
}

main .option> :nth-child(3)> :nth-child(2) span {
  font-size: 14px;
}

main .option> :nth-child(3)> :nth-child(2) strong {
  font-size: 24px;
  margin-right: 8px;
}

main .purchase> :nth-child(1) {
  display: flex;
  margin-bottom: 10px;
}

main .purchase> :nth-child(1) button {
  height: 50px;
  width: 50%;
  background: none;
  color: #111;
  font-weight: 500;
}

main .purchase> :nth-child(1) button:nth-child(1) {
  border-right: none;
}

main .purchase> :nth-child(2) {
  display: flex;
  padding-bottom: 16px;
  border-bottom: 2px solid black;
}

main .purchase> :nth-child(2) button:nth-child(1) {
  height: 50px;
  width: 100%;
  background: black;
  color: white;
}

main .purchase> :nth-child(2) button:nth-child(1) {
  border-right: none;
}

main .purchase> :nth-child(2) button:nth-child(2) {
  width: 50px;
  height: 50px;
  padding: 0;
}

main .purchase> :nth-child(2) img {
  width: 20px;
  height: 20px;
  margin: 15px;
}

main .purchase> :nth-child(3)>div {
  display: flex;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #e5e5e5;
}

main .purchase> :nth-child(3) div div {
  min-width: 100px;
  height: 46px;
  line-height: 0.8rem;
}

main .purchase> :nth-child(3) div div img {
  width: 50px;
  height: 10px;
  display: block;
  margin-bottom: 2px;
}

main .purchase> :nth-child(3) div div span {
  font-size: 11px;
}

main .purchase> :nth-child(3)>div> :nth-child(2) {
  background: #00c73c;
  height: 42px;
  color: white;
  padding: 0;
  width: 100%;
  margin-left: 10px;
  border: none;
  border-radius: 3px;
}

main .purchase> :nth-child(3)>div> :nth-child(2) img {
  width: 20px;
  height: 20px;
  vertical-align: middle;
  margin-right: 5px;
}

main .purchase> :nth-child(3)>div> :nth-child(3) {
  width: 42px;
  height: 42px;
  color: #00c73c;
  padding: 5px;
  margin-left: 10px;
  border: 1px solid #bfc4c7;
  border-radius: 3px;
}

main .purchase> :nth-child(3)> :nth-child(2) {
  display: block;
  margin: 8px 0;
  font-size: 10px;
}

main .purchase> :nth-child(3)> :nth-child(2) strong {
  color: #00c73c;
  margin-right: 2px;
}

.item {
  padding: 16px 5%;
}

.item> :nth-child(1) {
  padding-top: 20px;
  display: flex;
  justify-content: space-between;
}

.item> :nth-child(1) ul li {
  list-style: none;
  display: inline-block;
}

.item> :nth-child(1) ul button {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  border: none;
  background: black;
  padding: 0;
  margin: 0 2px;
}

.item> :nth-child(2) {
  padding: 14px 0;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-column-gap: 10px;
  overflow-x: auto;
}

.item > :nth-child(2)::-webkit-scrollbar {
  display: none;
}

/* 스크롤 이미지 2개만 보이게 하기 */
.item> :nth-child(2)>div {
  width: calc((100vw - 60px)/2);
  flex-shrink: 0;
}

.item> :nth-child(2) div a img {
  width: 20%;
}

.item> :nth-child(2) div a>p {
  margin: 10px 0;
  color: #222;
  display: block;
  white-space: nowrap;
  overflow: hidden;
}

.item> :nth-child(2) div div {
  display: flex;
  justify-content: space-between;
}

.item> :nth-child(2) div div p {
  font-weight: 700;
  font-size: 13px;
}

.item> :nth-child(2) div div span {
  color: #ef987f;
  font-size: 10px;
}

.membership {
  padding: 16px 5%;
}

.membership h4 {
  padding-bottom: 14px;
  border-bottom: 1px solid #e5e5e5;
}

.membership>div {
  padding: 20px 0;
  display: flex;
  justify-content: space-around;
  text-align: center;
}

.membership>div>div {
  margin-right: 4px;
}

.membership>div>div:nth-child(4) {
  margin-right: 0;
}

.membership>div>div img {
  width: 50%;
}

.membership>div>div p {
  font-size: 12px;
  font-weight: 500;
  margin-top: 5px;
}

.banner1 {
  margin: 26px 0 16px 0;
}

.banner1 img {
  width: 100%;
}

.banner2 {
  margin-bottom: 26px;
}

.banner2 img {
  width: 100%;
}

.info-bar {
  border-top: 1px solid #e6e6e6;
  border-bottom: 1px solid black;
}

.info-bar ul {
  display: flex;
  justify-content: space-between;
  text-align: center;
}

.info-bar ul a {
  color: black;
}

.info-bar ul li {
  list-style: none;
  width: 100%;
  border-right: 1px solid #e6e6e6;
  padding: 10px 0;
}

.info-bar ul li:nth-child(1) span {
  color: #ef987f;
  margin-left: 4px;
}

.info-bar ul li:nth-child(2) {
  border-bottom: 2px solid black;
}

.info-bar ul li:nth-child(4) {
  border-right: none;
}

.pro_detail img {
  width: 65%;
  display: flex;
  justify-content: center; /* 수평 가운데 정렬 */
  align-items: center; /* 수직 가운데 정렬 */
}

.plus {
  position: fixed;
  right: 20px;
  bottom: 120px;
}

.plus img {
  width: 40px;
  height: 40px;
}

.top {
  position: fixed;
  right: 20px;
  bottom: 70px;
}

.top img {
  width: 40px;
  height: 40px;
}

.purchase-bar {
  width: 100%;
  height: 50px;
  position: fixed;
  bottom: 0;
}

.purchase-bar div {
  display: flex;
  padding-bottom: 16px;
}

.purchase-bar button:nth-child(1) {
  height: 50px;
  width: 100%;
  background: black;
  color: white;
}

.purchase-bar button:nth-child(2) {
  width: 100px;
  height: 50px;
  padding: 0;
  border-right: none;
  background: white;
}

.purchase-bar div :nth-child(2) img {
  width: 20px;
  height: 20px;
  margin: 15px;
}

#shopMain {
	 width:500px;
	 margin: 0 auto;
}
@media screen and (min-width: 684px) {
  
  .item> :nth-child(2)>div {
  width: calc((100vw - 80px)/2);
  flex-shrink: 0;
	} 
}

#orderBtn {
	background-color: black;
	color:white;
}
</style>
 
</head>
<body>

	<div class="sb_detail" style="width:1200px;margin: 0 auto;">
	  <div id="totop" class="event">
	    <p>카카오 채널 추가 시 3천원 할인!</p>
	  </div>

	<div class="shop_detail">
	  <main>
	
	    <img :src="shopDetail.image" id="shopMain">

	    <section>
	      <div class="product-info">
	        <h3>{{shopDetail.name}}</h3>
	        <p>브랜드 : {{shopDetail.brand}}</p>
	        <div>
	          <p><a href="#">+ 추가혜택</a></p>
	        </div>
			</div>
	
	      <form>
	
	        <div class="price">
	          <ul>
	            <li>
	              <span>판매가</span>
	              <span>{{shopDetail.price.toLocaleString()}}</span>
	            </li>
	          </ul>
	        </div>
	
	        <div class="option">
	          <div>
	            <span>사이즈</span>
	            <select name="size" ref="amount">
					    <!-- <option v-for="i in 10" :key="i" :value="i">{{ i }}개</option> -->
					<option :value="1">1개</option>
					<option :value="2">2개</option>
					<option :value="3">3개</option>
					<option :value="4">4개</option>
					<option :value="5">5개</option>
	            </select>
	          </div>
	
	          <div>
	            <a href="../camp/camp_main.do"><span>캠프스케이프와 신나는 캠핑을 떠나보세요! (캠핑장 예약 바로가기)</span></a>
	          </div>
	
	          <div>
	            <span>총 합계</span>
	            <span><strong>{{ totalPrice.toLocaleString() }}</strong>원</span>
	          </div>
	        </div>
	
	
	        <div class="purchase">
	          <div>
	            <button type="button" value="찜하기" @click="basketGo">장바구니</button>
				<button type="button" value="찜하기" @click="buyNow" id="orderBtn">구매하기</button>
	          </div>

	          <div>
	            <span><a href="#"><strong>[충전결제혜택]</strong>최대3%적립 + 소득공제</a></span>
	          </div>
	        </div>
	      </form>
	    </section>
	  </main>
	
	  <article class="item">
	    <div>
	      <h4>비슷한 item</h4>
	    </div>
	
	    <div>
	      <div v-for="r in recomDetail">
	        <a :href="'../shop/shop_detail.do?sno='+r.sno">
	          <img :src="r.image" alt="1" style="size:30px">
	          <div style="font-size:12px">{{r.name}}</div>
	          <div>
	            <p>{{r.price.toLocaleString()}}원</p>
	          </div>
	        </a>
	      </div>
	    </div>
	  </article>
	
	
	  <article class="membership">
	    <h4>회원 혜택안내</h4>
	    <div>
	      <div>
	        <img src="https://xexymix.jpg3.kr/xexymix/2020/sub/member/log_icon_1.gif" alt="1">
	        <p><a href="#">카카오플친 <br> 3천원 즉시할인</a></p>
	      </div>
	
	      <div>
	        <img src="https://xexymix.jpg3.kr/xexymix/2020/sub/member/log_icon_2.gif" alt="1">
	        <p><a href="#">등급별 <br> 최대 15% 할인</a></p>
	      </div>
	
	      <div>
	        <img src="https://xexymix.jpg3.kr/xexymix/2020/sub/member/log_icon_3.gif" alt="1">
	        <p><a href="#">리뷰 작성시 <br> 적립금 지급</a></p>
	      </div>
	
	      <div>
	        <img src="https://xexymix.jpg3.kr/xexymix/2020/sub/member/log_icon_4.gif" alt="1">
	        <p><a href="#">전 상품 <br> 무료배송</a></p>
	      </div>
	    </div>
	  </article>
	
	  <article class="info-bar">
	    <ul>
	      <li><a href="#">상세정보</a></li>
	    </ul>
	  </article>
	  
	  <div class="pro_detail">
	  	<div v-for="imageUrl in imageUrls" :key="imageUrl">
			<img :src="imageUrl" style="width: 70%">
		</div>
	  </div>
	
	
	  <div class="plus">
	    <a href="#">
	      <img src="https://xexymix.jpg3.kr/xexymix/2020m/main/quick_btn_plus.png" alt="plus">
	    </a>
	  </div>
	
	
	  <div class="top">
	    <a href="#totop">
	      <img src="https://xexymix.jpg3.kr/xexymix/2020m/main/quick_btn_top.png" alt="top">
	    </a>
	  </div>
	</div>
	</div>
</body>

<script>

	new Vue({
		el:'.shop_detail',
		data:{
			sno:${sno},
			shopDetail:[],
			amount:1,
			imageUrls:[],
			recomDetail:[],
			id:'${sessionScope.id}',
			price:0,
			totalPrice:0
		},
 		methods: {
		    buyNow(event) {
		    	event.preventDefault();
		    	if(this.id==='') {
		    		alert('로그인이 필요합니다.')
		    	} else {
		    		const url='../shop/shop_pay.do?sno='+this.sno+'&amount='+this.$refs.amount.value;
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
			        			amount:this.$refs.amount.value,
			        			price:this.price
			        		}
			        	}).then(res=>{
			        		location.href="../mypage/shop_basket.do";
			        	})
			    	}
		        },
            calculateTotalPrice() {
		    	this.totalPrice = this.shopDetail.price * parseInt(this.$refs.amount.value, 10); 
        	}
		},
		computed: {
		    totalPrice() {
		        return this.shopDetail.price * this.$refs.amount.value;
		    }
		},
		mounted: function(){	
			axios.get('../shop/shop_recom_vue.do',{
				params:{
					sno:this.sno,  
					start:this.sno+1,
					end:this.sno+3
				}
			}).then(res=>{
				console.log(res.data)
				this.recomDetail=res.data.recomDetail;
			})
			
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