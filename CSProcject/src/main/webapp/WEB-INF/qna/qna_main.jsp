<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 문의사항</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	.row2 {
		margin: 0px auto;
		text-align: center;
	}
	.form_area, .blog_item_date {
		font-family: 'Jua', sans-serif;
	}
	.form_area span {
		font-size: 60px;
		color: black;
		font-weight: bold;
		display: block;
		margin: 0px auto;
	}
	.blog_item_img .blog_item_date {
   		background-color: #E86A33;
	}
	.notice_text {
		text-align: center;
	}
	.blog_right_sidebar .post_category_widget .cat-list li a {
		font-size: 14px;
		line-height: 20px;
		color: white;
	}
	.qna_nav {
		margin: 0px auto;
		padding: 80px;
	}
	.qna_nav > ul > li {
		float: left;
		margin-left: 30px;
		margin-right: 30px;
	}
	li > a:hover {
		color: #E86A33;
		font-weight: bold;
	}

</style>
</head>
<body>

	<div class="container" style="padding: 80px;">
	
		<div class="row2" style="text-align: center">
			<div class="form_area">
				<i class="fa-regular fa-comments fa-2xl" style="margin-bottom: 20px;"></i>
				<br>
				<span class="notice_text">문의사항</span>
			</div>
		</div>
		
		<div class="row2">
			<div class="qna_nav">
				<ul style="list-style: none">
					<li class="last">
						<a href="#">캠핑장 예약</a>
					</li>
					<li>
						<a href="#">렌터카 예약</a>
					</li>
					<li>
						<a href="#">상품 문의</a>
					</li>
					<li>
						<a href="#">기타 문의</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	
	<!--================ 문의사항 폼 시작 =================-->
    <section class="blog_area section-padding">
    	<div class="container">
	    	<div class="row">
	    	
	    		<div class="search_form" style="margin-bottom: 20px;">
	                    <input type=radio name=search value=name>    이름
	                    <input type=radio name=search value=subject>    제목 
	                    <input type=radio name=search value=content>    내용
	                    <input type=text class="input-sm" placeholder="검색어를 입력하세요." style="margin-left: 5px;"/>
	                    <a href="#"><i class="fa-solid fa-magnifying-glass fa-lg" style="color: #e86a33;margin-left: 5px;"></i></a>
	                    
	                    <a href="../qna/qna_insert.do"><input type=button class="boxed-btn4 text-white rounded-1 w-40 h-10 btn_1" value="1:1 문의하기" style="margin-left: 570px"></a>
	    		</div>
	    		
	    		<table class="table">
	    			<tr>
	    				<th width=10% class="text-center">NO.</th>
	    				<th width=40% class="text-center">CONTENT</th>
	    				<th width=15% class="text-center">NAME</th>
	    				<th width=20% class="text-center">DATE</th>
	    				<th width=15% class="text-center">HITS</th>
	    			</tr>
	    			<tr>
	    				<td width=10% class="text-center">번호</td>
	    				<td width=40%><i class="fa-solid fa-lock" style="color:#C8C8C8; margin-right: 10px;"></i>제목</td>
	    				<td width=15% class="text-center">사용자 이름</td>
	    				<td width=20% class="text-center">날짜</td>
	    				<td width=15% class="text-center">조회수</td>
	    			</tr>
	    		</table>
	    		
	    	</div>
    	</div>
  	</section>

<script>
	new Vue({
		el:'.container',
		data:{
			qna_list:[],
			page_info:[]
		},
		mounted:function(){
			
		},
		methods:{
			
		}
	})
</script>
</body>
</html>