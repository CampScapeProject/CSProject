<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Lato:400,300,700);



memh2 {
  margin-bottom:0px;
  margin-top:25px;
  text-align:center;
  font-weight:200;
  font-size:19px;
  font-size:1.2rem;
  
}
.member_container {
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  -webkit-box-align:center;
  -webkit-align-items:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  margin-top:100px;
  margin-left: 100px;
}

.thin {
  font-weight:400;
}
.small {
  font-size:12px;
  font-size:.8rem;
}
.half-input-table {
  border-collapse:collapse;
  width:100%;
}
.half-input-table td:first-of-type {
  border-right:10px solid mediumseagreen;
  width:50%;
}
.window {
  height:650px;
  width:1000px;
  background:#fff;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  box-shadow: 0px 15px 50px 10px rgba(0, 0, 0, 0.2);
  border-radius:30px;
  z-index:10;
}
.order-info {
  height:100%;
  width:50%;
  padding-left:25px;
  padding-right:25px;
  box-sizing:border-box;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  position:relative;
}
.price {
  bottom:0px;
  position:absolute;
  right:0px;
  color:mediumseagreen;
}
.order-table td:first-of-type {
  width:25%;
}
.order-table {
    position:relative;
}
.line {
  height:1px;
  width:100%;
  margin-top:10px;
  margin-bottom:10px;
  background:#ddd;
}
.order-table td:last-of-type {
  vertical-align:top;
  padding-left:25px;
}
.order-info-content {
  table-layout:fixed;

}

.full-width {
  width:100%;
}
.pay-btn {
  border:none;
  background:white;
  line-height:2em;
  border-radius:10px;
  font-size:19px;
  font-size:1.2rem;
  color:black;
  cursor:pointer;
  position:absolute;
  bottom:25px;
  width:calc(100% - 50px);
  -webkit-transition:all .2s ease;
          transition:all .2s ease;
}
.pay-btn:hover {
  background:#22a877;
    color:#eee;
  -webkit-transition:all .2s ease;
          transition:all .2s ease;
}

.total {
  margin-top:25px;
  font-size:20px;
  font-size:1.3rem;
  position:absolute;
  bottom:30px;
  right:27px;
  left:35px;
}
.dense {
  line-height:1.2em;
  font-size:16px;
  font-size:1rem;
}
.input-field {
  background:rgba(255,255,255,0.1);
  margin-bottom:10px;
  margin-top:3px;
  line-height:1.5em;
  font-size:20px;
  font-size:1.3rem;
  border:none;
  padding:5px 10px 5px 10px;
  color:#fff;
  box-sizing:border-box;
  width:100%;
  margin-left:auto;
  margin-right:auto;
}
.credit-info {
  background:mediumseagreen;
  height:100%;
  width:50%;
  color:#eee;
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  font-size:14px;
  font-size:1.1rem;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  box-sizing:border-box;
  padding-left:25px;
  padding-right:25px;
  border-top-right-radius:30px;
  border-bottom-right-radius:30px;
  position:relative;
}
.dropdown-btn {
  background:rgba(255,255,255,0.1);
  width:100%;
  border-radius:5px;
  text-align:center;
  line-height:1.5em;
  cursor:pointer;
  position:relative;
  -webkit-transition:background .2s ease;
          transition:background .2s ease;
}
.dropdown-btn:after {
  content: '\25BE';
  right:8px;
  position:absolute;
}
.dropdown-btn:hover {
  background:rgba(255,255,255,0.2);
  -webkit-transition:background .2s ease;
          transition:background .2s ease;
}
.dropdown-select {
  display:none;
}
.credit-card-image {
  display:block;
  max-height:80px;
  margin-left:auto;
  margin-right:auto;
  margin-top:35px;
  margin-bottom:15px;
}
.credit-info-content {
  margin-top:25px;
  -webkit-flex-flow:column;
      -ms-flex-flow:column;
          flex-flow:column;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  width:100%;
}
@media (max-width: 600px) {
  .window {
    width: 100%;
    height: 100%;
    display:block;
    border-radius:0px;
  }
  .order-info {
    width:100%;
    height:auto;
    padding-bottom:100px;
    border-radius:0px;
  }
  .credit-info {
    width:100%;
    height:auto;
    padding-bottom:100px;
    border-radius:0px;
  }
  .pay-btn {
    border-radius:0px;
  }
}
.check-dup {
  display: flex;
  align-items: center; /* 수직 중앙 정렬 */
}

.check-dup input[type="text"] {
  margin-right: 10px;
}

.check-dup .btn-dup {
  display: inline-flex;
  margin-left: 12px;
  height: 52px;
}

</style>

</head>
<body>

<div class='member_container'>
  <div class='window'>
    <div class='order-info' style='overflow-y: scroll'>
      <div class='order-info-content'>
        <h2 class="memh2">회원 내역</h2>
                <div class='line'></div>
        <table class='order-table'>
          <tbody>
				<tr class="success">
					<th width=20% class="text-center">아이디</th>
					<th width=30% class="text-center">이름</th>
					<th width=30% class="text-center">생년월일</th>
				</tr>
				<tr v-for="m in memberList"  @click="detailInfoGo(m.id)">
					<td width=20% class="text-center" style="vertical-align: middle;">{{m.id}}</td>
					<td width=30% class="text-center" style="vertical-align: middle;">{{m.name}}</td>
					<td width=30% class="text-center" style="vertical-align: middle;">{{m.birth}}</td>
				</tr>

          </tbody>

        </table>
        <div class='line'></div>

</div>
</div>
        <div class='credit-info'>
          <div class='credit-info-content'>
            <table class='half-input-table'>
              <tr><td>상세정보</td></tr>
            </table>
<!--             <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img> -->
            <table class='half-input-table'>
              <tr>
                <td> 아이디
                  <input type="text" class='input-field' v-model="id" id=id value="id" size=100 readonly>
                </td>
                <td>이름
                  <input type="text" class='input-field' v-model="name" id=name value="name">
                </td>
              </tr>
            </table>
            연락처
            <input type="text" class='input-field' v-model="phone" id=phone value="phone">
            이메일
            <input type="text" class='input-field' v-model="email" id=email value="email">
            닉네임
            <input type="text" class='input-field' v-model="nickname" id=nickname value="nickname">
            생년월일
			<input type="date" class="input-field" v-model="birth" id=birth value="birth">
			우편번호
			<div class="check-dup">
				<input type="text" class="input-field" v-model="post" id=post style="margin-right: 10px;display: inline;" value="post">
				<input type="button" class="btn btn-sm btn-default" value="우편번호 검색" id="postBtn"  @click="openPost">
			</div>
			주소
			<input type="text" class="input-field" v-model="addr1" id=addr1 size=100 value="addr1">			
			상세주소
			<input type="text" class="input-field" v-model="addr2" id=addr2 value="addr2" size=100 >
			성별
            <div class="radio">
                <label>
                    <input type="radio" name=sex value="남" v-model="sex" /><span style="color:white">남자</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name=sex value="여" v-model="sex" /><span style="color:white">여자</span>
                </label>
            </div>
            관리자
             <div class="radio">
                 <label>
                     <input type="radio" value="n" v-model="admin" /><span style="color:white">NO</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" value="y" v-model="admin" /><span style="color:white">YES</span>
                 </label>
             </div>
			
            <button class='pay-btn' @click="updateGo">수정하기</button>

          </div>

        </div>
      </div>
    </div>
    
<script>

new Vue({
	el:'.member_container',
	data:{
		memberList:[],
		detailInfo:[],
		id:'',
		name:'',
		phone:'',
		email:'',
		nickname:'',
		birth:'',
		post:'',
		addr1:'',
		addr2:'',
		sex:'',
		admin:''
	},
    mounted() {
        axios.get('../adminpage/member_list_vue.do')
            .then(response => {
                this.memberList = response.data;
                console.log(response.data)
            }).catch(error => {
                console.log(error);
            });
    },
		methods:{
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
		detailInfoGo(id){
			axios.post('../adminpage/member_detail_vue.do',null,{
				params: {
					id:id
				}
			}).then(res=>{
				this.detailInfo=res.data
				this.id=this.detailInfo.id
				this.name=this.detailInfo.name
				this.phone=this.detailInfo.phone
				this.email=this.detailInfo.email
				this.nickname=this.detailInfo.nickname
				this.birth=this.detailInfo.birth
				this.post=this.detailInfo.post
				this.addr1=this.detailInfo.addr1
				this.addr2=this.detailInfo.addr2
				this.sex=this.detailInfo.sex
				this.admin=this.detailInfo.admin
			}).catch(error=>{
				console.log(error)
			})
		},
			updateGo(){
			axios.post('../adminpage/member_update_vue.do',null,{
				params:{
					name:this.name,
					email:this.email,
					nickname:this.nickname,
					sex:this.sex,
					birth:this.birth,
					phone:this.phone,
					post:this.post,
					addr1:this.addr1,					
					addr2:this.addr2,
					admin:this.admin,
					id:this.id
				}
			}).then(res=>{
				
				this.detailInfo(this.id)
				location.href="../adminpage/main.do";
				
			})	
		}
	} 
})

</script>    
</body>
</html>