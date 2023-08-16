<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.login-row {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    width: 800px;   
}   
.login-table {
    width: 48%; /* 왼쪽 테이블 너비 설정 */
}
.find-table {
    width: 48%; /* 오른쪽 테이블 너비 설정 */
}

/* tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
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
           <p>London is the capital city of England.</p>
         </div>
         
         <div id="PWD" class="tabcontent">
           <h3>PWD 찾기</h3>
           <p>Paris is the capital of France.</p> 
         </div>
      </div>
   </div>
   
   
<!-- <script>
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
</script> -->
   
<script>

   new Vue({
      el:'.row',
      data:{
         id:'',
         pwd:''
      },
      methods:{
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
                  location.href="../main/main.do"
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