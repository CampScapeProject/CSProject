<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 문의하기</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
	
	.form-label {
		color : black;
		font-size: 32px;
		font-weight: bold;
		padding-left: 20px;
		margin-bottom: 10px;
	}
	
	.qna_nav {
		margin: 0px auto;
		padding: 80px 80px 80px 180px;
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
	
	pre {
		font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	    padding: 30px;
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
	
	<section class="blog_area">
    	<div class="container">
	    	<div class="row">
	    		
	    		<label class="form-label">1:1 문의</label>
	    		
	    		<table class="table">
	    			<tr>
	    				<th width=15% class="text-center">제목</th>
	    				<td width=85% colspan=3>{{title}}</td>
	    			</tr>
	    			<tr>
	    				<th width=10% class="text-center">작성자</th>
	    				<td width=40%><i class="fa-solid fa-user" style="color:#828282; margin-right: 10px;"></i>{{qna_data.id}}</td>
	    				<th width=10% class="text-center">작성일</th>
	    				<td width=40%>{{regdate}}</td>
	    			</tr>
	    			<tr>
	    				<td colspan=4>
	    					<pre class="notice_content">{{content}}</pre>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan=4 class="text-right">
	    				
	    					<c:if test="${sessionScope.admin=='y' }">
		    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="답글" @click="reply_insert()">
		    				</c:if>
		    				
	    					<input v-if="qna_data.id==sessionId" type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="수정" @click="update()">
	    					
	    					<c:if test="${sessionScope.admin=='y' }">
	    						<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="삭제" @click="del()">
    						</c:if>
	    					
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="목록" style="background-color: #787878" onclick="javascript:history.back()">
	    				</td>
	    			</tr>
	    		</table>
	    		
	    	</div>
    	</div>
  	</section>
	
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>

<script>
	new Vue({
		el:'.blog_area',
		data:{
			qna_data:{},
			qno:${qno},
			qcno:0,
			title:'',
			content:'',
			regdate:'',
			sessionId:'${id}',
			hit:0,
			open:''
		},
		mounted:function(){
			 
			axios.get('../qna/qna_detail_vue.do', {
				params:{
					qno:this.qno
				}
			}).then(res=>{
				console.log(res.data)
				this.qna_data = res.data
				
				this.qcno = this.qna_data.qcno
				this.title = this.qna_data.title
				this.content = this.qna_data.content
				this.regdate = this.qna_data.dbday
				this.hit = this.qna_data.hit
				this.open = this.qna_data.open
				
			}).catch(error=>{
				console.log(error.response)
			})
		},
		methods:{
			
			reply_insert:function(){
				
				axios.get('../qna/reply_insert.do', {
					params:{
						qno:this.qno
					}
				}).then(res=>{
					
					location.href="../qna/reply_insert.do?qno="+this.qno
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			del:function(){
				alert('삭제하시겠습니까?')
				
				axios.get('../qna/qna_delete_vue.do', {
					params:{
						qno:this.qno
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