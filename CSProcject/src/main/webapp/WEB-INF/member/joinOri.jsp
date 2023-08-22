<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">

.joinContainer {
    position: absolute;
    top: 35%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0.7);
    height: 600px;

}   
</style>   


</head>
<body>

   <div class="joinContainer">
      <table class="table">
         <div class="text-center">
            <h3>회원가입</h3>
            회원이 되어 다양한 혜택을 경험해 보세요!
         </div>
         <tr>
             <th>아이디<span style="color:red">&nbsp;{{idOk}}</span></th>
         </tr>
         <tr>
             <td>
                 <input type="text" placeholder="아이디 입력(6~20자)" size=40 v-model="id" ref="id">
                 <span v-if="id !== ''">
                     <button class="btn btn-sm btn-default" id="idCheck" @click="idCheck">중복 확인</button>
                 </span>
             </td>
         </tr>
         <tr>
            <th>비밀번호<span style="color:red">&nbsp;{{pwdOk}}</span></th>
         </tr>
         <tr>   
             <td><input type="password" placeholder="비밀번호 입력(8~20자)" size=50 v-model="pwd" ref="pwd" @keyup="pwdValidate"></td>
         </tr>
         <tr>
             <th>비밀번호 확인<span v-show="!checkPasswordsMatch()" style="color:red">&nbsp;비밀번호가 일치하지 않습니다.</span></th>
         </tr>
         <tr>    
             <td>
                 <input type="password" placeholder="비밀번호 재입력" size="50" v-model="confirmPwd">
             </td>
         </tr>
         <tr>
            <th>이름</th>
         </tr>
         <tr>   
            <td><input type=text placeholder="이름을 입력해주세요" size=50 ref="name" v-model="name"></td>
         </tr>
         <tr>
            <th>이메일<span style="color:red">&nbsp;{{emailOk}}</span></th>
         </tr>
         <tr>   
            <td><input type=text name=email placeholder="이메일을 입력해주세요" size=50 ref="email" v-model="email" @keyup="emailCheck"></td>
         </tr>
         <tr>
            <th>닉네임</th>
         </tr>
         <tr>   
            <td><input type=text name=nickname placeholder="닉네임을 입력해주세요" size=50 ref="nickname" v-model="nickname"></td>
         </tr>
         <tr>
            <th>성별</th>
         </tr>
         <tr>   
            <td>
            남<input type=radio name=sex value="남" checked v-model="sex">
            여<input type=radio name=sex value="여" v-model="sex">
            </td>
         </tr>
         <tr>
            <th>생년월일</th>
         </tr>
         <tr>   
            <td><input type=date name=birth size=50 ref="birth" v-model="birth"></td>
         </tr>
         <tr>
            <th>전화번호</th>
         </tr>
         <tr>   
            <td><input type=text name=phone size=50 ref="phone" v-model="phone"></td>
         </tr>
         <tr>
            <th>우편번호</th>
         </tr>
         <tr>   
            <td>
            <input type=text name=post id=post class="input-sm" ref="post" v-model="post">
            <input type=button id="postBtn" value="우편번호 검색" class="btn btn-sm btn-default" size=40>
            </td>
         </tr>
         <tr>
            <th>주소</th>
         </tr>
         <tr>   
            <td>
            <input type=text name=addr1 id=addr1 size=50 ref="addr1" v-model="addr1">
            </td>
         </tr>
         <tr>
            <th>상세주소</th>
         </tr>
         <tr>   
            <td>
            <input type=text name=addr2 id=addr2 size=50 ref="addr2" v-model="addr2">
            </td>
         </tr>
               <tr style="text-align: center;">
                   <td colspan="2">
                       <input type=submit name="joinBtn" value="회원가입" @click="join">
                       <input type=button name="joinBtn" value="취소" onclick="javascript:history.back()">
                   </td>
               </tr>
      </table>
   </div>

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
         if (!this.post) {
             alert("우편번호를 입력해주세요.");
             this.$refs.post.focus();
             return;
          }
         if (!this.addr1) {
            alert("주소를 입력해주세요.");
            this.$refs.addr1.focus();
            return;
         }
         if (!this.addr2) {
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
</body>
</html>