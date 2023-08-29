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
<div class="row">
	<div class="col-sm-12 text-center">
 		<h3>글 쓰기</h3>
 	</div>
 </div>	
 <section class="blog_area single-post-area section-padding" style="margin-top: -100px;background-color: #EADBC8;">
      <div class="container">
         <form @submit.prevent="InsertForm()">
                     <div class="row" >
                        <div class="col-sm-12">
                           <div class="form-group">
                              이름<input class="form-control" v-model="id" type="text" style="width: 100px;background-color: #DAC0A3;font-weight: bold;" readonly>
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              제목<input class="form-control" ref="subject" v-model="subject" type="text" style="width: 300px;background-color: #DAC0A3;font-weight: bold;">
                           </div>
                        </div>
                        <div class="col-sm-12">
                           <div class="form-group">
                              이미지<input ref="img" type="file" @change="getFileName($event.target.files)" style="background-color: #DAC0A3;font-weight: bold;">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                             내용<textarea class="form-control w-100" ref="content" v-model=content cols="30" rows="9" style="background-color: #DAC0A3;font-weight: bold;">
                              </textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group text-center">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn" style="background-color: #DAC0A3;border: 1px solid white">작성</button>
                     </div>
                  </form>
               </div>
               </section>
	<script>
	new Vue({
		 el:'.blog_area',
		 data:{
			 id:'${sessionScope.id}',
			 sno:${sno},
			 subject:'',
			 content:'',
			 filename:''
		 },
		 mounted:function(){
		 },
		 methods:{
			 InsertForm:function(){
				 
				 if(this.subject=="")
				   {
					   this.$refs.subject.focus();
					   return;
				   }
				   if(this.content=="")
				   {
					   this.$refs.content.focus();
					   return;
				   }
				   
				   let form=new FormData();
				   form.append("id",this.id);
				   form.append("subject",this.subject);
				   form.append("content",this.content);
				   form.append("sno",this.sno)
				   form.append("imagefile", this.fileName)
				   
				   axios.post('../camp/camp_review_insert_vue.do',form,{
						header:{
							'Content-Type':'multipart/form-data'
							}
						}).then(response=>{
						  console.log(response.data)
						  alert('등록이 완료되었습니다.')
						  window.close();
						  location.href='../camp/camp_detail.do?cno='+this.sno
					  }).catch(error=>{
						  console.log(error.response)
					  })
			 },
			getFileName(files) {
	        	  this.fileName = files[0]
	        }
		 }
	 }) 
	</script>
</body>
</html>