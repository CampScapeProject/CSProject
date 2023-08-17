<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                    <li><a href="#"><i class="fa fa-comments"></i>03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    
                    	<aside class="single_sidebar_widget post_category_widget">
                        	<a href="../notice/notice_write.do"><input type=button class="boxed-btn4 text-white rounded-0 w-100 btn_1" value="공지사항 작성"></a>
                        </aside>
                    	
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
    <!--================Blog Area =================-->

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
</body>


</html>