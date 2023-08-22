<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 순서 상-우-하-좌 */
	.recipe_title {
		padding: 5px;
		margin-left: 10px;
		font-size: 23px;
		font-weight: bold;
	}
	
	.msg2 {
		font-size: 14px;
		font-weight: bold;
		color: #8f8f8f;
	}
</style>
</head>
<body>

<div class="recipe">
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center" colspan=3>
						<img :src="image" style="width: 60%">
					</td>
				</tr>
				<tr>
					<td class="text-left" colspan=2><span class="recipe_title">{{title}}</span></td>
					<td class="text-right" style="padding-top: 17px;">
						<i class="fa-regular fa-heart fa-2xl" style="color: #f05c5c;"></i><span style="margin-right: 20px;">       찜하기</span>
						<i class="fa-regular fa-thumbs-up fa-2xl" style="color: #8f8f8f;"></i><span style="margin-right: 10px;">       추천</span>
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan=3 style="padding: 50px 60px 50px 60px"><span class="recipe_subject">{{msg1}}</span></td>
				</tr>
				<tr style="padding: 15px 0px 15px 0px;">
					<td class="text-right" width="33.3%"><i class="fa-solid fa-users" style="color: #8f8f8f;"></i><span class="msg2">       {{people}}       </span></td>
					<td class="text-center" width="33.3%"><i class="fa-regular fa-clock" style="color: #8f8f8f;"></i><span class="msg2">       {{time}}       </span></td>
					<td class="text-left" width="33.3%"><i class="fa-solid fa-chart-simple" style="color: #8f8f8f;"></i><span class="msg2">       {{level}}       </span></td>
				</tr>
				<tr>
					<td><span style="font-size: 20px;"> <span style="font-weight: 600;">재료</span>   |</span> <span style="font-size: 15px;">   Ingredients</span></td>
					<td colspan=2><span>{{ingre}}</span></td>
				</tr>
				<tr>
					<td colspan=3>
						<!-- 조리 순서 -->
						<div style="">
						<i class="fa-solid fa-fire-burner fa-xl" style="color: #E86A33;"></i><span style="font-size: 24px; font-weight: 600;">         조리 순서</span>
						</div>
						<div style="margin-top: 20px;">
							<table class="table recipe_step_img">
								<tr v-for="steps_img, index in allstepsimg">
									<td width=40% class="text-center">
										<img :src="steps_img" style="width: 100%">
									</td>
									<td width=60% style="padding: 200px 50px 200px 50px;">
										{{allsteps[index]}}
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="row">
			<c:if test="${sessionScope.id!=null }">
			<table class="table">
				<tr>
					<td>
						<textarea rows=3 cols=100 style="float:left; resize: none;" ref="msg"></textarea>
						<button class="btn btn-sm btn-default" style="float:left; margin-left: 10px; width: 120px; height: 79px;" @click="replyWrite">댓글 작성</button>
					</td>
				</tr>
			</table>
			</c:if>
		
			<table class="table" v-for="rvo in reply_list">
				<tr>
					<td class="text-left">
						<i class="fa-solid fa-user fa-xl" style="color: #8f8f8f;"></i>&nbsp;&nbsp;{{rvo.nickname}}<span style="font-size: 12px;">  &#91;{{rvo.dbday}}&#93;</span>
					</td>
					<td class="text-right">
						<span v-if="sessionId==rvo.id">
							<input type=button class="btn btn-sm btn-default ups" value="수정" :id="'up'+rvo.rpno" @click="replyUpdateForm(rvo.rpno)">
	    					<input type=button class="btn btn-sm btn-default" value="삭제" @click="replyDelete(rvo.rpno)">
						</span>
					</td>
				</tr>
				<tr>
					<td colspan=2><pre style="white-space: pre-wrap;background-color: white;border: none">{{rvo.msg}}</pre></td>
				</tr>
				<tr :id="'u'+rvo.rpno" class="updates" style="display:none">
					<td colspan=2>
						<textarea rows=3 cols=100 :id="'msg'+rvo.rpno" style="float:left; resize: none;">{{rvo.msg}}</textarea>
						<button class="btn btn-sm btn-default" style="float:left; margin-left: 10px; width: 120px; height: 79px;" @click="replyUpdate(rvo.rpno)">수정</button>
					</td>
				</tr>
			</table>
		</div>
 
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script>
	new Vue({
		el:'.recipe',
		data:{
			rno:${rno},
			recipe_detail:{},
			title:'',
			image:'',
			msg1:'',
			people:'',
			time:'',
			level:'',
			ingre_title:'',
			ingre:'',
			allsteps:[],
			allstepsimg:[],
			jjim:0,
			recommend:0,
			reply_list:[],
			sessionId:"${id}",
			sessionNickname:"${nickname}",
			msg:'',
			isShow:false,
			rpno:0,
			bool:false
		},
		mounted:function(){
			this.dataRecive()
			this.replyRead()
		},
		methods:{
			dataRecive:function(){
				axios.get('../recipe/recipe_detail_vue.do',{
					params:{
						rno:this.rno
					}
				}).then(res=>{
					console.log(res.data)
					this.recipe_detail = res.data
					
					this.title = this.recipe_detail.title
					this.image = this.recipe_detail.image
					this.msg1 = this.recipe_detail.msg1
					this.people = this.recipe_detail.people
					this.time = this.recipe_detail.time
					this.level = this.recipe_detail.level
					this.ingre_title = this.recipe_detail.ingre_title
					this.ingre = this.recipe_detail.ingre
					this.jjim = this.recipe_detail.jjim
					this.recommend = this.recipe_detail.recommend
					
					this.allsteps = res.data.allSteps.split("|");
					this.allstepsimg = res.data.allStepsImg.split("^");
					
					console.log(allsteps)
					console.log(allstepsimg)
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			replyRead:function(){
				axios.get('../recipe/reply_list_vue.do',{
					params:{
						rno:this.rno
					}
				}).then(res=>{
					console.log(res.data)
					this.reply_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 입력
			replyWrite:function(){
				if(this.msg==="")
				{
					this.$refs.msg.focus()
					return;
				}
				
				axios.post('../recipe/reply_insert_vue.do', null, {
					params:{
						rno:this.rno,
						msg:this.msg
					}
				}).then(res=>{
					console.log(res.data)
					this.reply_list=res.data
					this.msg='';
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 수정
			replyUpdateForm:function(rpno){
				$('.updates').hide()
				$('.ups').val('수정')
				
				if(this.bool==false)
				{
					$('#u'+rpno).show();
					$('#up'+rpno).val('취소')
					this.bool=true;
				}
				else {
					$('#u'+rpno).hide();
					$('#up'+rpno).val('수정')
					this.bool=false;
				}
			},
			
			replyUpdate:function(rpno){
				let msg = $('#msg'+rpno).val()
				
				axios.post('../recipe/reply_update_vue.do', null, {
					params:{
						rpno:rpno,
						rno:this.rno,
						msg:msg
					}
				}).then(res=>{
					console.log(res.data)
					this.reply_list = res.data
					$('#u'+rpno).hide();
					$('#up'+rpno).val('수정')
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 삭제
			replyDelete:function(rpno){
				axios.get('../recipe/reply_delete_vue.do', {
					params:{
						rpno:rpno,
						rno:this.rno
					}
				}).then(res=>{
					console.log(res.data)
					this.reply_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
			}
		}
	})
</script>
</body>
</html>