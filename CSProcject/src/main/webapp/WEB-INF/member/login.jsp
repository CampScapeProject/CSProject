<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 
<style>
@import url("https://fonts.googleapis.com/css?family=Fira+Sans");

/* html,body {
	position: relative;
	min-height: 100vh;
	background-color: #E1E8EE;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: "Fira Sans", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
} */

.form-structor {
	border-radius: 15px;
	height: 550px;
	position: absolute;
	overflow: hidden; 
	
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 25%;
	
	&::after {
		content: '';
		opacity: .8;
		position: absolute;
		top: 0;right:0;bottom:0;left:0;
		background-repeat: no-repeat;
		background-position: left bottom;
		background-size: 500px;
		background-image: url('https://cdn.pixabay.com/photo/2020/08/08/16/05/camping-5473343_1280.jpg');
		<!--  -->
	}
	
	.signup {
		position: absolute;
		top: 50%;
		left: 50%;
		-webkit-transform: translate(-50%, -50%);
		width: 65%;
		z-index: 5;
		-webkit-transition: all .3s ease;
		
		
		&.slide-up {
			top: 5%;
			-webkit-transform: translate(-50%, 0%);
			-webkit-transition: all .3s ease;
		}
		
		&.slide-up .form-holder,
		&.slide-up .submit-btn {
			opacity: 0;
			visibility: hidden;
		}
		
		&.slide-up .form-title {
			font-size: 1em;
			cursor: pointer;
		}
		
		&.slide-up .form-title span {
			margin-right: 5px;
			opacity: 1;
			visibility: visible;
			-webkit-transition: all .3s ease;
		}
		
		.form-title {
			color: #fff;
			font-size: 1.7em;
			text-align: center;
			
			span {
				color: rgba(0,0,0,0.4);
				opacity: 0;
				visibility: hidden;
				-webkit-transition: all .3s ease;
			}
		}
		
		.form-holder {
			border-radius: 15px;
			background-color: #fff;
			overflow: hidden;
			margin-top: 50px;
			opacity: 1;
			visibility: visible;
			-webkit-transition: all .3s ease;
			
			.input {
				border: 0;
				outline: none;
				box-shadow: none;
				display: block;
				height: 30px;
				line-height: 30px;
				padding: 8px 15px;
				border-bottom: 1px solid #eee;
				width: 100%;
				font-size: 12px;
				
				&:last-child {
					border-bottom: 0;
				}
				&::-webkit-input-placeholder {
					color: rgba(0,0,0,0.4);
				}
			}
		}
		
		.submit-btn {
			background-color: rgba(0,0,0,0.4);
			color: rgba(256,256,256,0.7);
			border:0;
			border-radius: 15px;
			display: block;
			margin: 15px auto; 
			padding: 15px 45px;
			width: 100%;
			font-size: 13px;
			font-weight: bold;
			cursor: pointer;
			opacity: 1;
			visibility: visible;
			-webkit-transition: all .3s ease;
			
			&:hover {
				transition: all .3s ease;
				background-color: rgba(0,0,0,0.8);
			}
		}
	}
	
	.login {
		position: absolute;
		top: 20%;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: #fff;
		z-index: 5;
		-webkit-transition: all .3s ease;
		
		&::before {
			content: '';
			position: absolute;
			left: 50%;
			top: -20px;
			-webkit-transform: translate(-50%, 0);
			background-color: #fff;
			width: 200%;
			height: 250px;
			border-radius: 50%;
			z-index: 4;
			-webkit-transition: all .3s ease;
		}
		
		.center {
			position: absolute;
			top: calc(50% - 10%);
			left: 50%;
			-webkit-transform: translate(-50%, -50%);
			width: 65%;
			z-index: 5;
			-webkit-transition: all .3s ease;
			
			.form-title {
				color: #000;
				font-size: 1.7em;
				text-align: center;

				span {
					color: rgba(0,0,0,0.4);
					opacity: 0;
			    visibility: hidden;
				  -webkit-transition: all .3s ease;
				}
			}

			.form-holder {
				border-radius: 15px;
				background-color: #fff;
				border: 1px solid #eee;
				overflow: hidden;
				margin-top: 50px;
				opacity: 1;
				visibility: visible;
				-webkit-transition: all .3s ease;

				.input {
					border: 0;
					outline: none;
					box-shadow: none;
					display: block;
					height: 30px;
					line-height: 30px;
					padding: 8px 15px;
					border-bottom: 1px solid #eee;
					width: 100%;
					font-size: 12px;

					&:last-child {
						border-bottom: 0;
					}
					&::-webkit-input-placeholder {
						color: rgba(0,0,0,0.4);
					}
				}
			}

			.submit-btn {
				background-color: #6B92A4;
				color: rgba(256,256,256,0.7);
				border:0;
				border-radius: 15px;
				display: block;
				margin: 15px auto; 
				padding: 15px 45px;
				width: 100%;
				font-size: 13px;
				font-weight: bold;
				cursor: pointer;
				opacity: 1;
				visibility: visible;
				-webkit-transition: all .3s ease;

				&:hover {
					transition: all .3s ease;
					background-color: rgba(0,0,0,0.8);
				}
			}
		}
		
		&.slide-up {
			top: 90%;
			-webkit-transition: all .3s ease;
		}
		
		&.slide-up .center {
			top: 10%;
			-webkit-transform: translate(-50%, 0%);
			-webkit-transition: all .3s ease;
		}
		
		&.slide-up .form-holder,
		&.slide-up .submit-btn {
			opacity: 0;
			visibility: hidden;
			-webkit-transition: all .3s ease;
		}
		
		&.slide-up .form-title {
			font-size: 1em;
			margin: 0;
			padding: 0;
			cursor: pointer;
			-webkit-transition: all .3s ease;
		}
		
		&.slide-up .form-title span {
			margin-right: 5px;
			opacity: 1;
			visibility: visible;
			-webkit-transition: all .3s ease;
		}
	}
}
</style>
</head>
<body>
<div id="app">
	<div class="form-structor">
		<div class="signup">
			<h2 class="form-title" id="signup" @click="signupSlide($event)">Login</h2>
			<div class="form-holder">
				<input type="text" class="input" placeholder="id" ref="id" v-model="id" />
				<input type="password" class="input" placeholder="Password" ref="pwd" v-model="pwd" />
			</div>
			<input type="button" class="submit-btn" value="login" @click="login()">
			<input type="button" class="submit-btn" value="Join" @click="join()">
		</div>
		<div class="login slide-up">
			<div class="center">
				<h2 class="form-title" id="login" @click="findIdSlide($event)">ID 찾기</h2>
				<div class="form-holder">
					<input type="email" class="input" placeholder="Email을 입력해주세요" v-model="email">
					<input type="text" class="input" :placeholder="idFindOk" />
				</div>
				<button class="submit-btn" @click="idFind()">찾기</button>
			</div>
		</div>
	</div>
</div>

<!-- login VueJS -->
<script>
new Vue({
    el:'#app',
    data:{
       id:'',
       pwd:'',
       email:'',
       idFindOk:'',
       signupBtn: '',
       loginBtn: ''
    },
    mounted() {
    	this.loginBtn = document.getElementById('login');
		this.signupBtn = document.getElementById('signup');
    },
    methods:{
    	join(){
    		location.href="../member/join.do"
    	},
  	  idFind() {
  		   axios.get('../member/id_find_vue.do', {
  		      params: {
  		         email: this.email // 세미콜론 제거
  		      }
  		   }).then(response => {
  		      console.log(response.data);
  		      if (response.data === 'no') {
  		         alert("존재하지 않는 email입니다.");
  		         this.idFindOk='';
  		         this.id='';
  		      } else {
  		         this.idFindOk = response.data;
  		      }
  		   }).catch(error => {
  		      console.log("Error:", error);
  		   });
  		},
  		findIdSlide(e) {
  			let parent = e.target.parentNode.parentNode;
			Array.from(e.target.parentNode.parentNode.classList).find((element) => {
				if(element !== "slide-up") {
					parent.classList.add('slide-up')
				}else{
					this.signupBtn.parentNode.classList.add('slide-up')
					parent.classList.remove('slide-up')
				}
			});
  		},
  		signupSlide(e) {
  			let parent = e.target.parentNode;
			Array.from(e.target.parentNode.classList).find((element) => {
				if(element !== "slide-up") {
					parent.classList.add('slide-up')
				}else{
					this.loginBtn.parentNode.parentNode.classList.add('slide-up')
					parent.classList.remove('slide-up')
				}
			});
  		},
   	  pwdFind(){
  		  
  	  }, 
       login(){
          if(this.id.trim()==="") {
             this.$refs.id.focus();
             return;
          }
          if(this.pwd.trim()===""){
             this.$refs.id.focus();
             return;
          }
          
          axios.post('../member/login_ok.do',null,{
             params:{
                id:this.id,
                pwd:this.pwd
             }
          }).then(response=>{
             let res=response.data;
             if(res==="NOID") {
                alert('ID가 존재하지 않습니다')
                this.id=''
                this.pwd=''
                this.$refs.id.focus()
             } else if(res==="NOPWD") {
                alert('비밀번호가 틀립니다')
                this.pwd='';
                this.$refs.pwd.focus()
             } else {
                location.href="../main/home.do"
             }
          }).catch(error=>{
             console.log("Error:"+error);
          })
       }
    }
 })
 
</script>
</body>
</html>