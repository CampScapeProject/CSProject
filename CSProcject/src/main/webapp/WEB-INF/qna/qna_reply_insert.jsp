<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 문의사항</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
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
		padding: 80px 80px 80px 200px;
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

<div class="qna">

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
					<li>
						<a href="../qna/qna_main.do?qcno=1">전체</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=2">캠핑장 예약</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=3">렌터카 예약</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=4">상품 문의</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=5">기타 문의</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	
	<!--================ 문의사항 폼 시작 =================-->
    <section class="blog_area">
    	<div class="container">
	    	<div class="row">
	    		
	    		<label class="form-label">1:1 문의 답변 작성</label>
	    		
	    		<table class="table">
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
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="작성" v-on:click="write()">
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="취소" style="background-color: #787878" onclick="javascript:history.back()">
	    				</td>
	    			</tr>
	    		</table>
	    		
	    	</div>
    	</div>
  	</section>
  	
</div>

<script>
	new Vue({
		el:'.blog_area',
		data:{
			title:'',
			content:'',
			id:'${id}',
			name:'${name}',
			title:'',
			content:'',
			root:${qno}
		},
		mounted:function(){
			
		},
		methods:{
			 
			write:function(){
				
				axios.post('../qna/reply_insert_vue.do', null, {
					params:{
						root:this.root,
						title:this.title,
						content:this.content,
						user_id:this.id
					}
				}).then(res=>{
					
					location.href="../qna/qna_main.do?qcno=1"
					
				}).catch(error=>{
					console.log(error.response)
				})
			}
		}
		
	})
</script>
</body>
</html>