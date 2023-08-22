<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title></title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<style type="text/css">

*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
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

button {
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

.number {
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

  form {
    max-width: 480px;
  }

}

</style>
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
</head>
    <body>

      <form action="index.html" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="name">Name:</label>
          <input type="text" id="name" name="user_name">
          
          <label for="mail">Email:</label>
          <input type="email" id="mail" name="user_email">
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="user_password">
          
          <label>성별:</label>
          <input type="radio" id="under_13" name=sex value="남" checked v-model="sex"><label for="under_13" class="light">남자</label><br>
          <input type="radio" id="over_13" name=sex value="여" v-model="sex"><label for="over_13" class="light">여자</label>
        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>Your profile</legend>
          <label for="bio">Biography:</label>
          <textarea id="bio" name="user_bio"></textarea>
        </fieldset>
        <fieldset>
        
          <label>Interests:</label>
          <input type="checkbox" id="development" value="interest_development" name="user_interest"><label class="light" for="development">Development</label><br>
            <input type="checkbox" id="design" value="interest_design" name="user_interest"><label class="light" for="design">Design</label><br>
          <input type="checkbox" id="business" value="interest_business" name="user_interest"><label class="light" for="business">Business</label>
        
        </fieldset>
        <button type="submit">Sign Up</button>
      </form>
      
<script>

$(function(){
	   $('#postBtn').click(function(){
	      new daum.Postcode({
	         oncomplete:function(data) {
	            $('#post').val(data.zonecode)
	            $('#addr1').val(data.address)
	         }
	      }).open()
	   })
	})

new Vue({
   el: '.joinContainer',
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
         if (this.post === "") {
             alert("우편번호를 입력해주세요.");
             this.$refs.post.focus();
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


