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
	.cart_table{
		padding-top: 4.5rem;
		margin-left:100px;
	}
	.cart_table>p{
		font-size: 3rem;
		border-bottom: 2px solid #222;
		padding: 0 0 10px 40px;
	}
	.cart_table .cart_list{
		padding: 2rem;
		font-size: 14px;
		}
	.cart_table .cart_list li>div{
		display: inline-block;
	}
	.cart_table .cart_list li:first-of-type .del_btn{
		float: right;
		background:url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/icon_trash.svg) no-repeat 5px;
		border: 1px solid #222;
		margin-bottom: 1.5rem;
		padding: 2px 5px 2px 25px;
	}
	.cart_table .cart_list li{
		border-bottom: 1px solid #ccc;
		padding: 4px 0;
		position: relative
	}
	.cart_table .cart_list li>div.item_detail p{
		display: inline-block;
		font-size: 16px;
		width: 60%
	}
	.cart_table .cart_list li>div.item_detail .txt{
		margin-top: 1rem
	}
	.cart_table .cart_list li>div.opt_info{
		position: absolute; 
		right: 0; 
		top: 34%; 
		max-width: 39%; 
		width: 300px;
	}
	.cart_table .cart_list li>div.opt_info .price_btn input {
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
	.cart_table .cart_list li>div.opt_info .price_btn input.minus_btn{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/btn_minus.svg) no-repeat center;
	}
	.cart_table .cart_list li>div.opt_info .price_btn input.plus_btn{
		background: url(https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/btn_plus.svg) no-repeat center;
	}
	.cart_table .cart_list li>div.opt_info .price_btn input.number{
		font-size: 18px; 
		background: #f5f5f5; 
		color: #666; 
		margin: 0 3px;
	}
	.cart_table .cart_list li>div.opt_info>div{
		display: inline-block
	}
	.cart_table .cart_list li>div.opt_info>div.total_p{
		font-size: 18px; 
		float: right;
	}
	.cart_table .cart_list li>div.opt_info>div.total_p strong{
		vertical-align: sub; margin-right: 6px;
	}
	.cart_table .cart_list li>div.opt_info>div.total_p span{
		width: 30px;
		display: inline-block;
	}
	.cart_table .cart_list li>div.item_detail{
		width: 85%;
	}
	.cart_table .cart_list li>div.item_detail img{
		max-width: 150px; 
		width: 25%; 
		margin: 0 5%; 
		float: left;
	}
	.cart_table .cart_total_area{
		padding:0 4rem; 
	}
	.cart_table .cart_total_area>p{
		font-size: 20px;
	}
	.cart_table .cart_total_area .cart_total_price{
		border: 2px solid #707070; 
		padding: 2rem; 
		margin: 2rem auto; 
		text-align: center;
	}
	.cart_table .cart_total_area .cart_total_price p{
		display: inline-block; 
		text-align: left;
	}
	.cart_table .cart_total_area .cart_total_price p>span{
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
	.cart_table .cart_total_area .cart_total_price p>strong{
		display: inline-block; 
		margin-left: 10px; 
		margin: 0 5px 0 10px; 
		font-size: 20px; 
		vertical-align: unset;
	}
	.cart_table .btn_box{
		padding: 4rem; 
		text-align: center;
	}
	.cart_table .btn_box .btn{
		padding: 10px 0; 
		width: 24%; 
		margin: 0 1%;
	}
	.cart_table .btn_box .black-btn{
		float: none;
	}
	
	</style>
	
	</head>
	<body>
	
	<div style="margin-left=100px;"></div>
	
		<div class="cart_table">
		    <p>구매내역</p>
		    <ul class="cart_list">
		        <li>
		            <div class="checkbox">
		               
		            </div>
		            <div class="item_detail">
		                <img :src="b.image">
		                <p class="name"><strong></strong></p>
		                <p class="txt"></p>
		            </div>
		            <div class="opt_info">
		                <strong class="price_unit"></strong>원
		                <div class="price_btn">
		                    <input type="text" class="number"> 개
		                </div>
		                <div class="total_p">
		                    <strong class="price_amount"></strong>원
		                    <span class="del_li_btn"><a href="#"><img src="https://tictoc-web.s3.ap-northeast-2.amazonaws.com/web/img/icon/btn_del_circle.svg"></a></span>
		                </div>
		            </div>
		        </li>
		    </ul>

		    <div class="btn_box">
		        <button type="button" class="btn wh-btn">계속 쇼핑하기</button>
		        <!-- <button type="button" class="btn black-btn">구매하기</button> -->
		    </div>
		</div>
	
	<script>

	</script>
	
	
	
	</body>
	</html>