<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	.form-label {
		color : black;
		font-size: 32px;
		font-weight: bold;
		padding-left: 20px;
		margin-bottom: 10px;
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

	<div class="container" style="padding: 80px; background-color: ">
		<div class="row2" style="text-align: center">
			<div class="form_area">
				<i class="fa-solid fa-bullhorn fa-2xl" style="margin-bottom: 20px;"></i>
				<br>
				<span class="notice_text">공지사항</span>
			</div>
		</div>
	</div>
	
	<!--================ 문의사항 폼 시작 =================-->
    <section class="blog_area">
    	<div class="container">
	    	<div class="row">
	    		
	    		<label class="form-label">공지사항</label>
	    		
	    		<table class="table">
	    			<tr>
	    				<th width=15% class="text-center">제목</th>
	    				<td width=85% colspan=3>
	    					{{title}}
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=10% class="text-center">작성자</th>
	    				<td width=40%><i class="fa-solid fa-user" style="color:#828282; margin-right: 10px;"></i>관리자</td>
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
	    					<a :href="'../notice/notice_update.do?nno='+notice_data.nno"><input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="수정"></a>
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
			notice_data:{},
			nno:${nno},
			title:'',
			content:'',
			regdate:'',
			hit:0
		},
		mounted:function(){
			axios.get('../notice/notice_detail_vue.do', {
				params:{
					nno:this.nno
				}
			}).then(res=>{
				console.log(res.data)
				this.notice_data = res.data
				
				this.title = this.notice_data.title
				this.content = this.notice_data.content
				this.regdate = this.notice_data.dbday
				this.hit = this.notice_data.hit
				
			}).catch(error=>{
				console.log(error.response)
			})
		},
		methods:{
			
			del:function(){
				
				alert('삭제하시겠습니까?')
				
				axios.get('../notice/notice_delete_vue.do', {
					params:{
						nno:this.nno
					}
				}).then(res=>{
					location.href="../notice/notice_main.do"
				}).catch(error=>{
					console.log(error.response)
				})
			}

		}
	})
</script>
</body>
</html>