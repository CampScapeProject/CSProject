<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    		
	    		<label class="form-label">공지사항 작성</label>
	    		
	    		<form @submit.prevent="submitForm">
	    		<table class="table">
	    			<tr>
	    				<th width=15% class="text-center">제목</th>
	    				<td width=85% colspan=3>
	    					<input type=text class="input-sm form-control" name=title v-model="title" ref="title">
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=8% class="text-center">고정 여부</th>
	    				<td width=92%>
	    					<input type=radio name=secret v-model=fix value=1 >     고정      
	                   		<input type=radio name=secret v-model=fix value=0 style="margin-left: 10px;" checked>     비고정      
	    				</td>
	    			</tr>
	    			<tr>
	    				<th width=15% class="text-center">첨부파일</th>
	    				<td width=85%>
	    					<input type=file ref="images" @change="fileUpload" multiple accept="upload/*">
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
	    					<input type=submit class="boxed-btn4 text-white rounded-1 w-40 btn_1" value="작성">
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
			title:'',
			content:'',
			fix:0,
			sessionId:"${id}",
			images:''
			
		},
		
		methods:{
			
			fileUpload:function(){

				 this.images = event.target.files
			},
			
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
				form.append("id", this.sessionId)
				form.append("title", this.title)
				form.append("content", this.content)
				form.append("fix", this.fix)
				
				let leng = this.$refs.images.files.length;
				if(leng>0)
				{
					for(let i=0;i<this.$refs.images.files.length;i++)
					{
						form.append("images["+i+"]", this.$refs.images.files[i])
					}
				}
				
				axios.post("../notice/notice_insert_vue.do", form, {
					header:{
						'Content-Type':'multipart/form-data'
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