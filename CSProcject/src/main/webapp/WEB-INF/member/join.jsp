<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title></title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<style type="text/css">

*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

#joinBody {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

#joinForm {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

#joinSub {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

.joinButton {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.joinNumber {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}

@media screen and (min-width: 480px) {

  #joinForm {
    max-width: 480px;
  }

}
.check-dup {
 > div {
 	display: flex;
 	justify-content: space-between;
 	.btn-dup {
 		display: inline-flex;
 		margin-left: 12px;
 		height: 52px;
 	}
 }
}

</style>
<head>

</head>
<body>
    
	<div id="joinBody">
      <div id="joinForm">
        <h1 id="joinSub">Sign Up</h1>
        
        <fieldset>
          <legend><span class="joinNumber">1</span>Your basic info</legend>
          	
          	<div class="check-dup">
	        	<label for="name">아이디:</label><span style="color:red">&nbsp;{{idOk}}</span>
	        	<div>
		          	<input type="text" placeholder="아이디 입력(6~20자)" size=40 v-model="id" ref="id">
			        <span v-if="id !== ''" class="btn-dup">
			            <button class="btn btn-sm btn-default" id="idCheck" @click="idCheck">중복 확인</button>
			        </span>
	           </div>
           </div>
	          
          <label for="name">비밀번호:</label><span style="color:red">&nbsp;{{pwdOk}}</span>
          <input type="password" placeholder="비밀번호 입력(8~20자)" size=50 v-model="pwd" ref="pwd" @keyup="pwdValidate">
          
          <label for="name">비밀번호 확인:</label><span v-show="!checkPasswordsMatch()" style="color:red">&nbsp;비밀번호가 일치하지 않습니다.</span>
          <input type="password" placeholder="비밀번호 재입력" size="50" v-model="confirmPwd">
          
          <label for="name">이름:</label>
          <input type=text placeholder="이름을 입력해주세요" size=50 ref="name" v-model="name">
          
          <label for="mail">이메일:</label><span style="color:red">&nbsp;{{emailOk}}</span>
          <input type=text name=email placeholder="이메일을 입력해주세요" size=50 ref="email" v-model="email" @keyup="emailCheck">
          
          <label for="password">닉네임:</label>
          <input type=text name=nickname placeholder="닉네임을 입력해주세요" size=50 ref="nickname" v-model="nickname">
          
          <label>성별:</label>
          <input type="radio" id="under_13" name=sex value="남" checked v-model="sex"><label for="under_13" class="light">남자</label><br>
          <input type="radio" id="over_13" name=sex value="여" v-model="sex"><label for="over_13" class="light">여자</label>
          
          <label for="name">생년월일:</label>
          <input type=date name=birth size=50 ref="birth" v-model="birth">
          
          <label for="name">연락처:</label>
          <input type=text name=phone size=50 ref="phone" v-model="phone">
          
          <div class="check-dup">
	          <label for="name">우편번호:</label>
	          <div>
		          <input type=text name=post id=post class="input-sm" ref="post" v-model="post">
		          <input type=button id="postBtn" value="우편번호 검색" class="btn btn-sm btn-default btn-dup" size=40 @click="openPost">
	         </div>
          </div>
          
          <label for="name">주소:</label>
          <input type=text name=addr1 id=addr1 size=50 ref="addr1" v-model="addr1">
          
          <label for="name">상세 주소:</label>
          <input type=text name=addr2 id=addr2 size=50 ref="addr2" v-model="addr2" @keydown="test($event)">
          
        </fieldset>
        
		  <button type="submit" class="joinButton" @click="join">Sign Up</button>
		  <!-- 취소 버튼 -->
		  <button type="button" class="joinButton" onclick="javascript:history.back()">Cancle</button>
      </div>
      
      </div>
      
<script>

/* $(function(){
	   $('#postBtn').click(function(){
		   console.log('1')
	      new daum.Postcode({
	         oncomplete:function(data) {

	  		   console.log('2')
	            $('#post').val(data.zonecode)
	            $('#addr1').val(data.address)
	         }
	      }).open()
	   })
	}) */

new Vue({
   el: '#joinForm',
   data: {
      confirmPwd: '',
      id: '',
      pwd: '',
      email: '',
      name: '',
      nickname: '',
      sex: '남',
      birth: '',
      phone: '',
      post: '',
      addr1: '',
      addr2: '',
      idOk:'',
      pwdOk:'',
      emailOk:''
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
		pwdValidate(){
				let pwd=String(this.pwd);
				let num=pwd.search(/[0-9]/g)
				let eng=pwd.search(/[a-z]/ig)
				if(pwd==='') {
					this.pwdOk='';
				}
				if(pwd.length<8 || pwd.length>20) {
					this.pwdOk='비밀번호는 8~20자 이내로 입력해주세요'
				
				} else if(pwd.search(/\s/)!=-1) {
					this.pwdOk='비민번호는 공백 없이 입력해주세요'
				
				} else if(num<0 || eng<0) {
					this.pwdOk='비밀번호는 영문, 숫자를 혼합해서 입력해주세요';
					
				} else {
					this.pwdOk='';
					
				}
		},
		idCheckValidate(id){
				let id_res=String(id)
				let num=id_res.search(/[0-9]/g)
				let eng=id_res.search(/[a-z]/ig)
				if(id_res.length<6 || id_res.length>12) {
					this.idOk='아이디는 6~12자리 이내로 입력해주세요.';
					this.id='';
					 return;
				} else if(id_res.search(/\s/)!=-1) {
					// 공백 찾기
					this.idOk='아이디는 공백 없이 입력해주세요.';
					this.id='';
					return;
				} else if(num<0 || eng < 0) {
					this.idOk='아이디는 영문, 숫자를 혼합하여 입력해주세요.';
					this.id='';
					return;
				} else {
					this.idOk='';
					alert("사용 가능한 ID입니다!")
					return;
				}
	   },
      checkPasswordsMatch() {
         return this.pwd === this.confirmPwd;
      },
      idCheck() {
         let id = this.id
         axios.post('../member/idCheck.do', null, {
            params: {
               id: this.id
            }
         }).then(response => {
            let res = response.data;
            if (res === "NO") {
               alert("이미 가입된 ID입니다!")
            } else {
               this.idCheckValidate(this.id)
            }
         })
      },
      join() {
         if (this.id === "") {
            alert("ID를 입력해주세요.");
            this.$refs.id.focus();
            return;
         }
         if (this.pwd === "") {
            alert("Password를 입력해주세요.");
            this.$refs.pwd.focus();
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
         axios.post('../member/join_ok.do',null, {
            params:{
               id: this.id,
               pwd: this.pwd,
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
            /* console.log(res); */
            if (res === "YES") {
               alert("회원가입이 완료되었습니다!");
               location.href = "../main/home.do";
            } else {
               alert("회원가입이 실패했습니다!");
            }
         })
      }
   }
});

</script>      
      
    </body>
</html>


