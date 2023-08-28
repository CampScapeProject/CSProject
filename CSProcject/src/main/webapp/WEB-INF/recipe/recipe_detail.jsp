<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.recipe {
		margin-top: 80px;
	}
	
	.row1 {
		margin: 0px auto;
	}

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
	
	pre {
		font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	}
	
	.allsteps {
		font-size: 18px;
		font-weight: bold;
	}
	
	.comment {
		margin-bottom: 50px;
		margin-top: 10px;
	}
	
	.comment_title {
		margin-top: -50px;
		padding: 10px;
	}
	
	.comment_title_span {
		font-weight: bold;
		font-size: 20px;
	}
	
</style>
</head>
<body>

	<div class="where_togo_area" style="padding: 30px;">
	    <div class="container" style="margin: 0 auto;">
	    	<div class=row>
	         <div class="col-lg-3">
	             <div class="form_area">
	                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">Recipe</h1>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<div class="recipe">
	<div class="container">
		<div class="row1">
		
			<!-- 레시피 -->
			<table class="table">
				<tr>
					<td class="text-center" colspan=3>
						<img :src="image" style="width: 600px">
					</td>
				</tr>
				<tr>
					<td class="text-left" colspan=2><span class="recipe_title">{{title}}</span></td>
					<td class="text-right" style="padding-top: 17px;">
						<i class="fa-regular fa-heart fa-2xl" style="color: #f05c5c;"></i><span style="margin-right: 10px;">       찜하기</span>
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
					<td style="padding: 30px;"><span style="font-size: 24px;"> <span style="font-weight: 600;">재료</span>   |</span> <span style="font-size: 16px;">   Ingredients</span></td>
					<td style="padding: 30px;" colspan=2><span>{{ingre}}</span></td>
				</tr>
				<tr>
					<td colspan=3 style="padding:30px;">

						<!-- 조리 순서 -->
						<div>
						<i class="fa-solid fa-fire-burner fa-xl" style="color: #E86A33;"></i><span style="font-size: 24px; font-weight: 600;">            조리 순서</span>
						</div>
						
						<div style="padding: 30px;">
							<table class="table recipe_step_img">
								<tr v-for="steps_img, index in allstepsimg">
									<td width=40% class="text-center">
										<img :src="steps_img" style="width: 600px; margin-bottom: 20px;">
										<span class="allsteps"><pre>{{allsteps[index]}}</pre></span>
									</td>
								</tr>
							</table>
						</div>
						
					</td>
				</tr>
			</table>
			
			<div class="comment_title">
				<i class="fa-regular fa-comments fa-2xl" style="margin-right: 20px; color:#E86A33"></i><span class="comment_title_span">댓글</span>
			</div>
			
			<div class="comment">
				<!-- 댓글 -->
				<table class="table" v-for="cvo in comment_list">
					<tr>
						<td class="text-left" style="vertical-align: middle;">
							<i class="fa-solid fa-user fa-lg" style="color: #8f8f8f;"></i>&nbsp;&nbsp;{{cvo.nickname}}<span style="font-size: 12px;">  &#91;{{cvo.dbday}}&#93;</span>
						</td>
						
						<td class="text-right" style="vertical-align: middle;">
							<span v-if="sessionId==cvo.id">
								<input type=button class="btn btn-sm btn-default ups" value="수정" :id="'up'+cvo.cmno" @click="commentUpdateForm(cvo.cmno)">
		    					<input type=button class="btn btn-sm btn-default" value="삭제" @click="commentDelete(cvo.cmno)">
							</span>
						</td>
					</tr>
					
					<tr>
						<td colspan=2><pre style="white-space: pre-wrap;background-color: white;border: none">{{cvo.msg}}</pre></td>
					</tr>
					
					<!-- 댓글 업데이트 -->
					<tr :id="'u'+cvo.cmno" class="updates" style="display:none">
						<td colspan=2>
							<textarea rows=3 cols=100 :id="'msg'+cvo.cmno" style="float:left; resize: none;">{{cvo.msg}}</textarea>
							<button class="btn btn-sm btn-default" style="float:left; margin-left: 10px; width: 120px; height: 79px;" @click="commentUpdate(cvo.cmno)">수정</button>
						</td>
					</tr>
				</table>
				
				<!-- 댓글 작성 -->
				<c:if test="${sessionScope.id!=null }">
				<table class="table">
					<tr>
						<td>
							<textarea rows=3 cols=100 style="float:left; resize: none;" ref="msg" v-model="msg"></textarea>
							<button class="btn btn-sm btn-default" style="float:left; margin-left: 10px; width: 120px; height: 79px;" @click="commentInsert()">댓글 작성</button>
						</td>
					</tr>
				</table>
				</c:if>
			</div>
			
			
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
			comment_list:[],
			sessionId:"${id}",
			sessionNickname:"${nickname}",
			msg:'',
			isShow:false,
			cmno:0,
			bool:false,
			commentTotal:0
		},
		mounted:function(){
			this.dataRecive()
			this.commentList()
			
			axios.get('../recipe/comment_total_vue.do', {
				params:rno:this.rno
			}).then(res=>{
				console.log(res.data)
				commentTotal = res.data
			})
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
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 목록
			commentList:function(){
				
				console.log(this.rno)
				
				axios.get('../recipe/comment_list_vue.do',{
					params:{
						rno:this.rno
					}
				}).then(res=>{
					console.log("데이터 : ",res.data)
					
					this.comment_list = res.data
					this.msg = this.comment_list.msg
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 입력
			commentInsert:function(){
				if(this.msg==="")
				{
					this.$refs.msg.focus()
					return;
				}
				
				axios.post('../recipe/comment_insert_vue.do', null, {
					params:{
						rno:this.rno,
						msg:this.msg
					}
				}).then(res=>{
					console.log(res.data)
					this.comment_list=res.data
					this.msg='';
				}).catch(error=>{
					console.log("에러 : ",error)
				})
			},
			
			// 댓글 수정
			commentUpdateForm:function(cmno){
				$('.updates').hide()
				$('.ups').val('수정')
				
				if(this.bool==false)
				{
					$('#u'+cmno).show();
					$('#up'+cmno).val('취소')
					this.bool=true;
				}
				else {
					$('#u'+cmno).hide();
					$('#up'+cmno).val('수정')
					this.bool=false;
				}
			},
			
			commentUpdate:function(cmno){
				let msg = $('#msg'+cmno).val()
				
				axios.post('../recipe/comment_update_vue.do', null, {
					params:{
						cmno:cmno,
						rno:this.rno,
						msg:msg
					}
				}).then(res=>{
					console.log(res.data)
					this.comment_list = res.data
					$('#u'+cmno).hide();
					$('#up'+cmno).val('수정')
					
				}).catch(error=>{
					console.log(error.response)
				})
			},
			
			// 댓글 삭제
			commentDelete:function(cmno){
				axios.get('../recipe/comment_delete_vue.do', {
					params:{
						cmno:cmno,
						rno:this.rno
					}
				}).then(res=>{
					console.log(res.data)
					this.comment_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
			}
		}
	})
</script>
</body>
</html>