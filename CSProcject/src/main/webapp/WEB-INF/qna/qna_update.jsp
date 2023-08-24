<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	a:hover {
		text-decoration: none;
		font-weight: bold;
		color: #E86A33;
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
	
	<!--================ 문의사항 폼 시작 =================-->
    <section class="blog_area">
    	<div class="container">
	    	<div class="row">
	    		
	    		<label class="form-label">공지사항 수정</label>
	    		
	    		<form @submit.prevent="submitForm">
	    		<table class="table">
	    			<tr>
	    				<th width=15% class="text-center">제목</th>
	    				<td width=85% colspan=3>
	    					<input type=text class="input-sm form-control" name=title v-model="title" ref="title">
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=8% class="text-center">공개 여부</th>
	    				<td width=92%>
	    					<input type=radio name=secret v-model=fix value=1 >     고정      
	                   		<input type=radio name=secret v-model=fix value=0 style="margin-left: 10px;">     비고정      
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=15% class="text-center">내용</th>
	    				<td width=85% colspan=3>
	    					<textarea class="form-control" rows="10" cols="110" name=content v-model="content" ref="content"></textarea>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td colspan=4 class="text-right">
	    					<input type=submit class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="수정" @click="submitForm()">
	    					<input type=button class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="취소" style="background-color: #787878" onclick="javascript:history.back()">
	    				</td>
	    			</tr>
	    		</table>
	    		</form>
	    		
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
			update_data:{},
			title:'',
			content:'',
			open:'',
			qno:${param.qno}
		},
		mounted:function(){
			
			axios.get('../qna/qna_insert.do', {
				params:{
					qno:this.qno
				}
			}).then(res=>{
				console.log(res.data)
				this.update_date = res.data
				
				this.title = this.update_data.title
				this.content = this.update_data.content
				
			}).catch(error=>{
				console.log(error.response)
			})
			
		},
		methods:(){
			
			submitForm:function(){
				
				if(this.title==="")
				{
					this.$refs.title.focus()
					return;
				}
				
				if(this.content==="")
				{
					this.$refs.content.focus()
					return;
				}
				
				let form = new FormData();
				form.appebd("qno", this.qno)
				form.append("title", this.title)
				form.append("content", this.content)
				form.append("fix", this.fix)
				
				
				axios.post('../qna/qna_update_ok_vue.do', form).then(res=>{
					
					location.href="../qna/qna_detail.do?nno="+this.nno
					
				}).catch(error=>{
					console.log(error.response)
				})
			}
			
		}
	})
</script>
 
</body>
</html> 