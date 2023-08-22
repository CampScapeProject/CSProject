<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 문의사항</title>
<!-- CSS here -->
<link rel="stylesheet" href="../layout/css/bootstrap.min.css">
<link rel="stylesheet" href="../layout/css/owl.carousel.min.css">
<link rel="stylesheet" href="../layout/css/magnific-popup.css">
<link rel="stylesheet" href="../layout/css/font-awesome.min.css">
<link rel="stylesheet" href="../layout/css/themify-icons.css">
<link rel="stylesheet" href="../layout/css/nice-select.css">
<link rel="stylesheet" href="../layout/css/flaticon.css">
<link rel="stylesheet" href="../layout/css/gijgo.css">
<link rel="stylesheet" href="../layout/css/animate.css">
<link rel="stylesheet" href="../layout/css/slicknav.css">
<link rel="stylesheet" href="../layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
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

    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
    	<div class="container">
	    	<div class="row">
	    	
	    		<div class="search_form" style="margin-bottom: 20px;">
	                    <input type=radio name=search value=name checked>    이름
	                    <input type=radio name=search value=subject>    제목 
	                    <input type=radio name=search value=content>    내용
	                    <input type=text class="input-sm" placeholder="검색어를 입력하세요." style="margin-left: 5px;"/>
	                    <a href="#"><i class="fa-solid fa-magnifying-glass fa-lg" style="color: #e86a33;margin-left: 5px;"></i></a>
	                    
	                    <c:if test="${sessionScope.admin=='y' }">
	                    <a href="../qna/qna_insert.do"><input type=button class="boxed-btn4 text-white rounded-1 w-40 h-10 btn_1" value="공지사항 작성" style="margin-left: 570px"></a>
	                    </c:if>
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
	    				<td width=40%><i class="fa-solid fa-microphone" style="color:#C8C8C8; margin-right: 10px;"></i>제목</td>
	    				<td width=15% class="text-center">관리자</td>
	    				<td width=20% class="text-center">날짜</td>
	    				<td width=15% class="text-center">조회수</td>
	    			</tr>
	    		</table>
	    		
	    		<div class="row2">
		    		<nav class="blog-pagination justify-content-center d-flex">
	                    <ul class="pagination">
	                        <li class="page-item" v-if="startpage>1">
	                            <a href="#" class="page-link" aria-label="Previous" @click="prev()">
	                                <i class="ti-angle-left"></i>
	                            </a>
	                        </li>
	                        
	                        <li v-for="i in range(startpage,endpage)" :class="i==curpage?'page-item active':'page-item'">
	                            <a href="#" class="page-link" @click="pageChange(i)">{{i}}</a>
	                        </li>
	                        
	                        <li class="page-item" v-if="endpage<totalpage">
	                            <a href="#" class="page-link" aria-label="Next" @click="next()">
	                                <i class="ti-angle-right"></i>
	                            </a>
	                        </li>
	                    </ul>
	                </nav>
	    		</div>
	    		
	    	</div>
    	</div>
  	</section>

<script>
	new Vue({
		el:'.blog_area',
		data:{
			notice_list:[],
			page_info:[],
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		},
		mounted:function(){
			
		},
		methods:{
			
			dataRecive:function(){
				axios.get('../notice/notice_list_vue.do', {
					params:{
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					this.notice_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
			}
			
			range:function(start,end){
				let arr = [];
				let length = end-start;
				for(let i=0;i<=length;i++)
				{
					arr[i] = start;
					start++;
				}
				return arr;
			},
			prev:function(){
				this.curpage = this.startPage-1;
				this.dataRecive();
			},
			next:function(){
				this.curpage = this.endPage+1;
				this.dataRecive();
			},
			pageChange:function(page){
				this.curpage = page;
				this.dataRecive();
			}
		}
	})
</script>
  
</body>


</html>