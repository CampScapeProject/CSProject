<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

</head>

<style type="text/css">

.member_container {
	width:900px;
	margin-left:275px;
}

.row1 {
	height:400px;
}
.detailForm {
	height:600px;
}

th {
    background: linear-gradient(142.94deg, #7fb88d 7.53%, #41644A 103.72%);
}
</style>

<body>

<div class="member_container">
	<div id="memberInfo">
		<h3 style="margin-bottom: 20px">회원 내역</h3>
		<div class="row1" style="margin-top:50px; ;margin-bottom: 10px;overflow-y: scroll">
			<table class="table">
				<tr class="success">
					<th width=20% class="text-center">아이디</th>
					<th width=20% class="text-center">이름</th>
					<th width=20% class="text-center">생년월일</th>
				</tr>
					<tr style="padding: 10px;" v-for="m in memberList" @click="detailInfoGo(m.id)">
						<td width=20% class="text-center" style="vertical-align: middle;">{{m.id}}</td>
						<td width=20% class="text-center" style="vertical-align: middle;">{{m.name}}</td>
						<td width=20% class="text-center" style="vertical-align: middle;">{{m.birth}}</td>
					</tr>
			</table>
		</div>
		
		<div class="detailForm" >
			<h3 style="margin-bottom: 20px">상세 정보</h3>
			<table class="table" style="margin-bottom: 20px;">
				<tr>
					<th width=10% class="success text-center">아이디</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="id" id=id value="id" size=100 readonly>
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">이름</th>
					<td width=40%>
						<input type="text" class="form-control-sm" v-model="name" id=name value="name">
					</td>
					<th width=10% class="success text-center">연락처</th>
					<td width=40%>
						<input type="text" class="form-control-sm" v-model="phone" id=phone value="phone">
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">이메일</th>
					<td width=90% colspan="3">
						<input type="email" class="form-control-sm" v-model="email" id=email value="email" size=100 >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">닉네임</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="nickname" id=nickname value="nickname" size=100 >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">생년월일</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="birth" id=birth value="birth" size=100 >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">우편번호</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="post" id=post style="margin-right: 10px;display: inline;" value="post">
						<input type="button" class="btn btn-sm btn-default" value="우편번호 검색" id="postBtn" >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">주소</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="addr1" id=addr1 size=100 value="addr1">
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">상세주소</th>
					<td width=90% colspan="3">
						<input type="text" class="form-control-sm" v-model="addr2" id=addr2 value="addr2" size=100 >
					</td>
				</tr>
				<tr>
					<th width=10% class="success text-center">성별</th>
					<td>
			             <div class="radio">
			                 <label>
			                     <input type="radio" name=sex value="남" v-model="sex" />남자 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                     <input type="radio" name=sex value="여" v-model="sex" />여자
			                 </label>
			             </div>
		             </td>
				</tr>
				<tr>
					<th width=10% class="success text-center">관리자</th>
					<td>
			             <div class="radio">
			                 <label>
			                     <input type="radio" value="n" v-model="admin" />NO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                     <input type="radio" value="y" v-model="admin" />YES
			                 </label>
			             </div>
		             </td>
				</tr>
			</table>
			<div id="수정" style="margin-bottom: 80px;justify-content: center;display:block;">
				<table>
					<tr>
						<td colspan=2>
							<input type=button class="btn btn-lg btn-default" value="수정하기" style="width: 150px;text-align: center;font-size:20px" id="updateBtn" @click="updateGo">
						</td>
					</tr>
				</table>
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
					
				})	
			}
		} 
	})

</script>

</body>
</html>