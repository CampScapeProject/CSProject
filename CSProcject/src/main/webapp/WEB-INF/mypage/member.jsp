<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>
   
<style type="text/css">
	input[type=button] {
		background: linear-gradient(142.94deg, #7fb88d 7.53%, #41644A 103.72%);
		border:none;
	}
</style>   
    
<body>
 
<div class="member_container">
    <form class="well form-horizontal" style="margin-left:100px;margin-top:20px;">
		<fieldset>

		<legend>회원 정보</legend>
		
		<div class="form-group">
		    <label class="col-md-4 control-label">비밀번호</label>  
		    <div class="col-md-4 inputGroupContainer">
		        <div class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
		            <input type="password" placeholder="pwd를 입력해주세요" class="form-control" ref="pwd" :value="pwd" @input="pwd = $event.target.value" autocomplete="current-password">
		        </div>
		    </div>
		</div>
		
		<div class="form-group">
		  <label class="col-md-4 control-label"></label>
		  <div class="col-md-4">
		    <input type="button" @click="pwd_check" class="btn btn-warning" value="확인">
		  </div>
		</div> 

	<div id="memberInfo" v-show="pwdOk">
		<div class="form-group">
		  <label class="col-md-4 control-label">이름</label> 
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
				    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				    <input type="text" placeholder="${sessionScope.name }" class="form-control" ref="name" v-model="name">
			    </div>
		  </div>
		</div>
		
		 <div class="form-group">
		  <label class="col-md-4 control-label">E-Mail</label><span style="color:red">&nbsp;{{emailOk}}</span>  
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
			  		<input type="text" placeholder="${sessionScope.email }" class="form-control" ref="email" v-model="email" @keyup="emailCheck">
			    </div>
		  </div>
		</div>
				
		<div class="form-group">
		  <label class="col-md-4 control-label">닉네임</label>  
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
			  	 <input type="text" placeholder="${sessionScope.nickname }" class="form-control" ref="nickname" v-model="nickname">
			    </div>
		  </div>
		</div>
			
		<div class="form-group">
		  <label class="col-md-4 control-label">생년월일</label>  
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
			  	 <input type="date" placeholder="${sessionScope.birth }" class="form-control" ref="birth" v-model="birth">
			    </div>
		  </div>
		</div>
		      
		<div class="form-group">
		  <label class="col-md-4 control-label">연락처</label>  
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
			    	<input type="text" placeholder="${sessionScope.phone }" class="form-control" ref="phone" v-model="phone">
			    </div>
		  </div>
		</div>

		      
		<div class="form-group">
		  <label class="col-md-4 control-label">우편번호</label><input type=button id="postBtn" value="우편번호 검색" class="btn btn-sm btn-default" size=40 @click="openPost">
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			 		<input type="text" name=post id=post placeholder="${sessionScope.post }" class="form-control" ref="post" v-model="post">
			    </div>
		  </div>
		</div>
		
		 
		<div class="form-group">
		  <label class="col-md-4 control-label">주소</label>  
		    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				  <input type="text" placeholder="${sessionScope.addr1 }" class="form-control" id="addr1" v-model="addr1">
			    </div>
		  </div>
		</div>
		
		<div class="form-group">
		  <label class="col-md-4 control-label">상세 주소</label>  
		    <div class="col-md-4 inputGroupContainer">
		    <div class="input-group">
		        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
		  	<input type="text" placeholder="${sessionScope.addr2 }" class="form-control" ref="addr2" v-model="addr2" id="addr2">
		    </div>
		  </div>
		</div>
		
		 <div class="form-group">
	         <label class="col-md-4 control-label">성별</label>
	         <div class="col-md-4">
	             <div class="radio">
	                 <label>
	                     <input type="radio" name=sex value="남" checked v-model="sex" /> 남자
	                 </label>
	             </div>
	             <div class="radio">
	                 <label>
	                     <input type="radio" name=sex value="여" v-model="sex" /> 여자
	                 </label>
	             </div>
	         </div>
         </div>
         
		<div class="alert alert-success" role="alert" id="success_message">Thank you<i class="glyphicon glyphicon-thumbs-up"></i> CampScape</div>

		<div class="form-group">
		  <label class="col-md-4 control-label"></label>
			  <div class="col-md-4">
			    <input type="button" @click="update" class="btn btn-warning" value="수정">
			  </div>
		</div>
		
		</div>	
		</fieldset>
	</form>
</div>

<script>

/* 	$(function(){
		   $('#postBtn').click(function(){
		      new daum.Postcode({
		         oncomplete:function(data) {
		            $('#post').val(data.zonecode)
		            $('#addr1').val(data.address)
		         }
		      }).open()
		   })
		}) */

	new Vue({
		el:'.member_container',	
		data:{
			id:'${sessionScope.id}',
			name:'',
			nickname:'',
			email:'',
			birth:'',
			phone:'',
			post:'',
			addr1:'',
			addr2:'',
			sex:'남',
		    pwdOk:'',
		    emailOk:'',
		    pwd:'',
		    pwdOk:false,
			detailInfo:[]
		},
		mounted(){
			axios.post('../adminpage/member_detail_vue.do',null,{
				params:{
					id:this.id
				}
			}).then(res=>{
				this.detailInfo=res.data
				
				this.name=this.detailInfo.name
				this.nickname=this.detailInfo.nickname
				this.email=this.detailInfo.email
				this.birth=this.detailInfo.birth
				this.phone=this.detailInfo.phone
				this.post=this.detailInfo.post
				this.addr1=this.detailInfo.addr1
				this.addr2=this.detailInfo.addr2
				this.sex=this.detailInfo.sex
			})
		},
		methods: {
		   openPost() {
			   const _this = this
			   new daum.Postcode({
			         oncomplete:function(data) {
			            /* $('#post').val(data.zonecode)
			            $('#addr1').val(data.address) */
			            console.log(_this)
			            _this.post = data.zonecode
			            _this.addr1 = data.address
			         }
			      }).open()
		   },
	      pwd_check:function() {
	    	    axios.get('../mypage/pwd_check.do', {
	    	        params: {
	    	            pwd: this.pwd
	    	        }
	    	    }).then(res => {
	    	    	let result=res.data
	    	        
	    	        if(result==="ok") {
	    	        	this.pwdOk=true;
	    	        } else {
	    	        	alert('비밀번호가 틀렸습니다.')
	    	        }
	    	    }).catch(error=>{
	    	    	console.log(error)
	    	    })
	    	},
			emailCheck(){
					if(this.email!='') {
						axios.get('../member/email_check_vue.do',{
							params:{
								email:this.email
							}
						}).then(res=>{
							if(res.data=='no') {
								this.emailOk='이미 사용 중인 이메일입니다'
							} else {
								this.emailValidate(res.data)
							}
						})
					} else {
						this.emailOk='';
					}
			},
			emailValidate(email){
				let re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
				if(!re.test(this.email)) {
					this.emailOk='이메일 형식이 올바르지 못합니다'
				} else {
					this.emailOk=''
				}
			},	
	      	update() {
	         if (this.id === "") {
	            alert("ID를 입력해주세요.");
	            this.$refs.id.focus();
	            return;
	         }
	         if (this.email === "") {
	            alert("이메일을 입력해주세요.");
	            this.$refs.email.focus();
	            return;
	         }
	         if (this.name === "") {
	            alert("이름을 입력해주세요.");
	            this.$refs.name.focus();
	            return;
	         }
	         if (this.nickname === "") {
	            alert("닉네임을 입력해주세요.");
	            this.$refs.nickname.focus();
	            return;
	         }
	         if (this.sex === "") {
	            alert("성별을 체크해주세요.");
	            return;
	         }   
	         if (this.birth === "") {
	             alert("생년월일을 입력해주세요.");
	             this.$refs.birth.focus();
	             return;
	         }
	         if (this.phone === "") {
	            alert("연락처를 입력해주세요.");
	            this.$refs.phone.focus();
	            return;
	         }
	         if (this.addr1 === "") {
	            alert("주소를 입력해주세요.");
	            this.$refs.addr1.focus();
	            return;
	         }
	         if (this.addr2 === "") {
	            alert("상세주소를 입력해주세요."); 
	            this.$refs.addr2.focus();
	            return;
	         }
   	         axios.post('../mypage/update_ok.do',null, {
   		            params:{
   		               id:'${sessionScope.id}',
   		               email: this.email,
   		               name: this.name,
   		               nickname: this.nickname,
   		               sex: this.sex,
   		               birth: this.birth,
   		               phone: this.phone, 
   		               post: this.post,
   		               addr1: this.addr1,
   		               addr2: this.addr2
   		            }
   		         }).then(response => {
   		            let res = response.data;
   		            if (res === "YES") {
   		               alert("회원 수정이 완료되었습니다!");/* 
   		               location.href = "../mypage/main.do"; */
   		           	   this.pwdOk=true;
   		            } else {
   		               alert("다시 시도해주세요.");
   		            }
   		         })
	      }

	   }
	})

</script>

</body>
</html>