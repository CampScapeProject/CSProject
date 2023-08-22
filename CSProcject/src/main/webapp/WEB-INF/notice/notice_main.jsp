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
            
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="../layout/img/blog/single_blog_1.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="#">
                                    <h2>공지사항 제목</h2>
                                </a>
                                <p>공지사항 내용</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fa fa-user"></i>관리자</a></li>
                                    <li><a href="#"><i class="fa-solid fa-eye"></i>196 Hits</a></li>
                                </ul>
                            </div>
                        </article>

                        <div class="row2">
				    		<nav class="blog-pagination justify-content-center d-flex">
			                    <ul class="pagination">
			                        <li class="page-item" v-if="startPage>1">
			                            <a href="#" class="page-link" aria-label="Previous" @click="prev()">
			                                <i class="ti-angle-left"></i>
			                            </a>
			                        </li>
			                        
			                        <li v-for="i in range(startPage,endPage)" :class="i==curpage?'page-item active':'page-item'">
			                            <a href="#" class="page-link" @click="pageChange(i)">{{i}}</a>
			                        </li>
			                        
			                        <li class="page-item" v-if="endPage<totalpage">
			                            <a href="#" class="page-link" aria-label="Next" @click="next()">
			                                <i class="ti-angle-right"></i>
			                            </a>
			                        </li>
			                    </ul>
			                </nav>
			    		</div>
                        
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    	
                    	<c:if test="${sessionScope.admin=='y' }">
	                    	<aside class="single_sidebar_widget post_category_widget">
	                        	<a href="../notice/notice_write.do"><input type=button class="boxed-btn4 text-white rounded-0 w-100 btn_1" value="공지사항 작성"></a>
	                        </aside>
                        </c:if>
                    	
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='검색어를 입력하세요.'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = '검색어를 입력하세요.'">
                                    </div>
                                </div>
                                <input type=button class="boxed-btn4 text-white rounded-0 w-100 btn_1" value="검색">
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                        </aside>

                    </div>
                </div>
            </div>
        </div>
    </section>

  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
  
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