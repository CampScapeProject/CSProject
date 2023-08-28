<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <link rel="stylesheet" href="../layout/css/bootstrap.min.css">
    <link rel="stylesheet" href="../layout/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../layout/css/magnific-popup.css">
    <link rel="stylesheet" href="../layout/css/font-awesome.min.css">
    <link rel="stylesheet" href="../layout/css/themify-icons.css">
    <link rel="stylesheet" href="../layout/css/nice-select.css">
    <link rel="stylesheet" href="../layout/css/flaticon.css">
    <link rel="stylesheet" href="../layout/css/gijgo.css">
    <link rel="stylesheet" href="../layout/css/animate.css">
    <link rel="stylesheet" href="../layout/css/slick.css">
    <link rel="stylesheet" href="../layout/css/slicknav.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../layout/css/style.css">
</head>
<body>
	 	<h3>글 쓰기</h3>
 <section class="blog_area single-post-area section-padding" style="margin-top: -100px;background-color: #EEEEEE;">
      <div class="container">
         <form @submit.prevent="InsertForm()">
                     <div class="row" >
                        <div class="col-sm-12">
                           <div class="form-group">
                              이름<input class="form-control" ref="id" type="text" style="width: 100px">
                              <input type="hidden" ref="no" :value="update_data.no"> 
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              제목<input class="form-control" ref="date" type="text" style="width: 300px">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                             내용<textarea class="form-control w-100" ref=content v-model=content cols="30" rows="9">
                              </textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group text-center">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">작성</button>
                     </div>
                  </form>
               </div>
               </section>
	<script>
	/*  new Vue({
		 el:'.blog_area',
		 data:{
			 
		 },
		 mounted:function(){
		 },
	 }) */
	</script>
</body>
</html>