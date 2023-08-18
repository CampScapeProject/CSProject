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
	
	textarea {
		resize: none;
	}
	
	.form-label {
		color : black;
		font-size: 32px;
		font-weight: bold;
		padding-left: 20px;
		margin-bottom: 10px;
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
	    		
	    		<label class="form-label">1:1 문의</label>
	    		
	    		<table class="table">
	    			<tr>
	    				<th width=15% class="text-center">카테고리</th>
	    				<td width=35%>
							<select v-model="category">
								<option selected value=0>   -- 카테고리를 선택해주세요 --    </option>
								<option value=1>   캠핑장 예약    </option>
								<option value=2>   렌터카 예약   </option>
								<option value=3>   상품 문의    </option>
								<option value=4>   기타 문의    </option>
							</select>
	    				</td>
	    				<th width=8% class="text-center">공개 여부</th>
	    				<td width=42%>
	    					<input type=radio name=secret v-model=secret value=y >     비밀      
	                   		<input type=radio name=secret v-model=secret value=n style="margin-left: 10px;">     공개      
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=15% class="text-center">제목</th>
	    				<td width=85% colspan=3>
	    					<input type=text class="input-sm form-control" name=title v-model="title">
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=15% class="text-center">내용</th>
	    				<td width=85% colspan=3>
	    					<textarea class="form-control" rows="10" cols="110" name=content v-model="content"></textarea>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan=4 class="text-right">
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="작성" @click="write()">
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="취소" style="background-color: #787878" onclick="javascript:history.back()">
	    				</td>
	    			</tr>
	    		</table>
	    		
	    	</div>
    	</div>
  	</section>

<script>
	new Vue({
		el:'.container',
		data:{
			title : '',
			content: '',
			secret: '',
			category : 0
		},
		mounted:function(){
			
		},
		methods:{
			
			categoryZero:function(){
				alert("카테고리 선택해 주세요");
			}
			
			,write:function(){
				
				if (this.category===0) {
		            this.categoryZero();
		            return;
		        }
				
				axios.post("http://localhost/web/qna/qna_insert_ok_vue.do", null, {
					params:{
						title : this.title,
						content : this.content,
						category : this.category
						secret : this.secret
					}
				}).then(res=>{
					console.log(res.data)
				}).error(catch=>{
					console.log(error.response)
				})
			}
		}
		
	})
</script>
</body>
</html>