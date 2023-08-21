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
    <section class="blog_area section-padding">
    	<div class="container">
	    	<div class="row">
	    		
	    		<label class="form-label">공지사항</label>
	    		
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
						<th width=15% class="text-right success">첨부파일</th>
						<td width=85%>
							<table class="table">
								<tr>
									<td class="text-right">
										<input type=button value=추가 class="btn btn-xs btn-default" @click="addFile">
										<input type=button value=삭제 class="btn btn-xs btn-default" @click="removeFile">
									</td>
								</tr>
							</table>
							<table class="table" id="user-table">
								<tbody>
									
								</tbody>
							</table>
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
			title:'',
			content:'',
			filename:'',
			filesize:''
		},
		mounted:function(){
			
		},
		methods:{
			write:function(){
				
				if(this.filename==null)
				{
					
				}
				
				if(this.filesize==null)
				{
					
				}
				
				axios.post("../notice/notice_insert_ok_vue.do", null, {
					params:{
						title : this.title,
						content : this.content,
						filename : this.filename,
						filesize : this.filesize
					}
				}).then(res=>{
					console.log(res.data)
				}).error(catch=>{
					console.log(error.response)
				})
			},
			
			addFile:function()
			{
				$('#user-table > tbody').append(
						'<tr id="m'+(fileIndex)+'">'
						+'<td>첨부파일 '+(fileIndex+1)+'<input type=file size=20 name=files['+fileIndex+']></td>'
						+'</tr>'
					)
				fileIndex++;
			},
			removeFile:function()
			{
				if(fileIndex>0)
				{
					$('#m'+(fileIndex-1)).remove();
					fileIndex--;
				}
			}
		}
	})
</script>
</body>
</html>