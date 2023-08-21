<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script> <!-- VueJS  -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> <!-- axios 라이브러리 -->

<title>Insert title here</title>
<style type="text/css">
.login-row {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    width:600px;
}   
.login-table {
    border:1px solid black;
}
.find-table {
    border:1px solid black;
    height: auto 0px;
} */

/* tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  font-siz
}

  
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

.tab button:hover {
  background-color: #ddd;
}

.tab button.active {
  background-color: #ccc;
}

.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>

</head>
<body>
<div id="app">
   <div class="login-row">
      <table class="table login-table">
         <tr>
            <th colspan="2" class="text-center">Login</th>
         </tr>
         <tr>
            <th>id</th>
            <td>
               <input type="text" name="id" ref="id" v-model="id">
            </td>
         </tr>
         <tr>
            <th>pwd</th>
            <td>
               <input type="password" name="pwd" ref="pwd" v-model="pwd">
            </td>
         </tr>
               <tr>
                  <td colspan="2">
                      <input type="button" class="btn btn-sm btn-default" value="login" @click="login()">
                      <a href="../member/join.do"><button class="btn btn-sm btn-default">Join</button></a>
                  </td>
              </tr>
      </table>
      <div class="table find-table">
         <div class="tab">
           <button class="tablinks" onclick="openTab(event, 'ID')">ID찾기</button>
           <button class="tablinks" onclick="openTab(event, 'PWD')">PWD찾기</button>
         </div>
         
         <div id="ID" class="tabcontent">
           <h4>Email로 ID를 찾아보세요</h4>
            <input type=text ref="email" v-model="email">
           <input type="button" value="찾기" @click="idFind()">
           <div style=""></div> 	
         </div>
         
         <div id="PWD" class="tabcontent">
           <h4>PWD 찾기</h4>
<!--            <input type=text ref="pwdFind" v-model="pwdFind">
           <input type=button value="찾기" @click="pwdFind()"> -->
         </div>
      </div>
   </div>
 </div>  
   
<script>
   function openTab(evt, tabs) {
     var i, tabcontent, tablinks;
     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }
     tablinks = document.getElementsByClassName("tablinks");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }
     document.getElementById(tabs).style.display = "block";
     evt.currentTarget.className += " active";
   }
</script>
   
<script>

   new Vue({
      el:'#app',
      data:{
         id:'',
         pwd:'',
         email:'',
         idFindOk:''
      },
      methods:{
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