<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
	.page{
		cursor: pointer;
	}  
	.activePage{
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="campMy">
	<div class=row style="padding-top: 40px;padding-left: 20px;padding-bottom: 150px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">캠핑장 목록</span>
		</div>
		
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;padding-bottom: 5px">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="serial">캠핑장</div>
							<div class="serial text-left">객실</div>
							<div class="serial text-left">인원</div>
							<div class="visit text-left">예약일</div>
							<div class="serial text-left">가격</div>
							<div class="serial text-left">승인 여부</div>
							<div class="serial text-left">리뷰</div>
						</div>
						
						<div class="table-row" v-for="cvo in my_clist">
							<div class="serial">
								<img  :src="cvo.image" width="85px" height="65px">
							</div>
							<div class="serial">{{cvo.camp_name}}</div>
							<div class="serial">{{cvo.campsite_name}}</div>
							<div class="serial">{{cvo.inwon}}</div>
							<div class="visit">{{cvo.dbsdate}}&nbsp;-&nbsp;{{cvo.dbedate}}</div>
							<div class="serial">{{cvo.price}}</div>
							<div class="serial">
								<button class="btn btn-xs btn-primary" style="font-size: 15px;margin-right: 5px;">{{cvo.rstate}}</button>
								<button class="btn btn-xs btn-danger" style="font-size: 15px;" @click="reserveDelete(cvo.rno)">예약취소</button>
							</div>
							<div class="serial">
								<button class="btn btn-xs btn-info" style="font-size: 15px;margin-left: 5px;" @click="reviewForm()">리뷰작성</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<!--  리뷰 작성 -->
              <div id="dialog" title="후기글" v-if="rInsertShow">
              	<div class="comment-form" style="margin-top: -55px;">
                     <div class="row" >
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" type="text">
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control"  type="text">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control"  type="text" >
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" readonly>
                             
                              </textarea>
                           </div>
                        </div>
                     </div>
               </div>
              </div>
			
			
		</div>
		 </div>
	</div>
	<script>
	new Vue({
		el:'.campMy',
		data:{
			my_clist:[],
			rInsertShow:false
		},
		mounted:function(){
			this.dataRecive();
		},
		methods:{
			dataRecive:function(){
				axios.get('../mypage/camp_reserve_list.do',{
					params:{
						id:'${sessionScope.id}'
					}
				}).then(res=>{
					this.my_clist=res.data
				})
			},
			reserveDelete:function(rno){
				axios.get('../mypage/camp_reserve_delete.do',{
					params:{
						rno:rno
					}
				}).then(res=>{
					let check=res.data
					if(check==="OK")
					alert('예약이 취소되었습니다')
					location.href='../mypage/camp_reserve.do'
				})
			},
			reviewForm:function(){
				rInsertShow=true;
				
				$('#dialog').dialog({
					autoOpen:false,
					modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
					width:700,
					height:500
				}).dialog('open')
			}
			
			
		}
	})
	</script>
</body>
</html>