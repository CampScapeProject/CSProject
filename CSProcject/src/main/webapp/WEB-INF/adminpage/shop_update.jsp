<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Update</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<style type="text/css">
#U-body{
  color: #333;
  font-family: "Roboto", Helvetica, Arial, Verdana, sans-serif;
  background: #fff;
  margin: 0;
  paddign: 0;
}

/* Style for text
* --------------------------------------- */
p{
  color: #333;
}

/* Common styles
* --------------------------------------- */
*{
  box-sizing: border-box;
}
textarea {
  font-family: "Roboto", Helvetica, Arial, sans-serif;
}
.wrap{
  width: 100%;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
  position: relative;
}
.box{
  font-size: 1.2em;
  line-height: 1.6em;
  text-align: center;
}
/*screen resolutions lower than 620px*/
@media all and (max-width: 1180px){
  .wrap{
  width: 100%;
  height: 100%;
  margin-left: auto;
  margin-right: auto;
  position: relative;
  }
}


#section h2{
  margin-bottom: 50px;
  position: relative;
  display: block;
}
#section p a{
  color: #00B16A;
  text-decoration: none;
}
#section .wrap {
  text-align: center;
  width: 100%;
}
#section .box{
  text-align: center;
  margin: 5% 0 0 0;
  width: 100%;
}

.contact-form {
  height:800px;
  width: 60%;	
  margin: 0 auto;
  padding: 40px;
}
.contact-form .input-block {
  background-color: transparent;
  border: none;
  width: 100%;
  height: 60px;
  border-bottom: 2px solid #00b16a;
  margin: 0;
  position: relative;
  margin-bottom: 20px;
  -moz-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  -webkit-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.contact-form .input-block.focus {
  
}
.contact-form .input-block.textarea {
  height: auto;
}
.contact-form .input-block.textarea .form-control {
  height: auto;
  resize: none;
}
.contact-form .input-block label {
  position: absolute;
  left: 10px;
  top: 25px;
  display: block;
  margin: 0;
  font-weight: 400;
  z-index: 1;
  color: #aaa;
  font-size: 18px;
  line-height: 10px;
}
.contact-form .input-block .form-control {
  background-color: transparent;
  margin: 0;
  outline: none;
  border: none;
  -moz-border-radius: 0;
  -webkit-border-radius: 0;
  border-radius: 0;
  -moz-box-shadow: none;
  -webkit-box-shadow: none;
  box-shadow: none;
  height: auto;
    padding: 30px 10px;
  width: 100%;
  position: relative;
  z-index: 2;
  font-size: 18px;
  color: #333;
}
.contact-form .input-block .form-control:focus label {
  top: 0;
}
.contact-form .square-button {
  background-color: #00B16A;
  color: #fff;
  font-size: 26px;
  text-transform: uppercase;
  font-weight: 700;
  text-align: center;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  -webkit-transition: all 0.3s ease;
  transition: all 0.3s ease;
  padding: 0 60px;
  height: 60px;
  cursor: pointer;
  outline: none;
  border: none;
  width: 100%;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  -webkit-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.contact-form .square-button:hover, .contact-form .square-button:focus {
  background-color: #66CC99;
  box-shadow: 0px 10px 30px rgba(0,0,0,0.1);
  transform: translateY(-4px);
}

@media (min-width: 768px) {
  .U-contact-wrap {
    margin: auto;
  }
}
@media (max-width: 868px) {
  .contact-form {
    width: 100%;
    padding: 40px;
  }
}
@media (max-width: 568px) {
  .contact-form {
    padding: 10px;
  }
}
/*----page styles---*/

.U-contact-wrap {
  padding: 15px;
}
.U-contact-wrap h1 {
  background-color: white;
 }
 
 #detailImgReal{
 	width: 70%;
    height: 100%;
 }
 #detailImg{ellow;
 	height:240px;
 }
 
</style>

<body id="U-body">

<div id="section">
	<section class="U-contact-wrap">
		<form class="contact-form" @submit.prevent="productUpdate">
			<div id="detailImg">
				<img :src="image" id="detailImgReal">
			</div>
			<div class="col-sm-12">
				<div class="input-block">
					<label for="">이름</label>
					<input type="text" class="form-control" v-model="name">
				</div>
			</div>
			<div class="col-sm-12">
				<div class="input-block">
					<label for="">브랜드명</label>
					<input type="text" class="form-control" v-model="brand">
				</div>
			</div>
			<div class="col-sm-12">
				<div class="input-block">
					<label for="">가격</label>
					<input type="text" class="form-control" v-model="price">
				</div>
			</div>
			<div class="col-sm-12">
				<div class="input-block textarea">
					<label for="">Memo</label>
					<textarea rows="3" type="text" class="form-control"></textarea>
				</div>
			</div>
			<div class="col-sm-12">
				<input type=submit class="square-button" value="Update">
				<!-- <button  @click="productUpdate">Update</button> -->
			</div>
		</form>
	</section>
</div>

<script>
$(document).ready(function(){

	  //material contact form
	  $('.contact-form').find('.form-control').each(function() {
	    var targetItem = $(this).parent();
	    if ($(this).val()) {
	    $(targetItem).find('label').css({
	      'top': '10px',
	      'fontSize': '14px'
	    });
	    }
	  })
	  $('.contact-form').find('.form-control').focus(function() {
	    $(this).parent('.input-block').addClass('focus');
	    $(this).parent().find('label').animate({
	    'top': '10px',
	    'fontSize': '14px'
	    }, 300);
	  })
	  $('.contact-form').find('.form-control').blur(function() {
	    if ($(this).val().length == 0) {
	    $(this).parent('.input-block').removeClass('focus');
	    $(this).parent().find('label').animate({
	      'top': '25px',
	      'fontSize': '18px'
	    }, 300);
	    }
	  })
	  
	});
	
	
	new Vue({
		el:'#section',
		data:{
			sno:${sno},
			name:'',
			brand:'',
			price:0,
			image:''
		},
		mounted:function(){
			axios.get('../adminpage/shop_updateDetail_vue.do',{
				params:{
					sno:this.sno
				}
			}).then(res=>{
				this.name=res.data.name
				this.brand=res.data.brand
				this.price=res.data.price
				this.image=res.data.image
			}).catch(error=>{
				console.log(error)
			})	
		},
		methods:{
			productUpdate(){
				
				console.log("이름 : ", this.name)
				console.log("브랜드 : ", this.brand)
				console.log("가격 : ", this.price)
				console.log("sno : ", this.sno)
				
				axios.post('../adminpage/product_update_vue.do', null, {
					params:{
						name:this.name,
						brand:this.brand,
						price:this.price,
						sno:this.sno
					}
				}).then(res=>{
					console.log(res.data)
					alert(this.sno)
					
				}).catch(error=>{
					console.log(error)
					alert(this.sno)
				})	
			}
		}		
	})
	
</script>

</body>
</html>