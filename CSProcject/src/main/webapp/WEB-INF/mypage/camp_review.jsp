<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="campMy">
	<div class=row style="padding-top: 40px;padding-left: 20px;padding-bottom: 150px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">리뷰 목록</span>
		</div>
		
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;padding-bottom: 5px">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="serial text-left">캠핑장</div>
							<div class="serial text-left">제목</div>
							<div class="percentage text-center">내용</div>
							<div class="serial text-left">작성날짜</div>
							<div class="serial text-left">조회수</div>
							<div class="serial text-left"></div>
						</div>
						
						<div class="table-row" v-for="rvo in my_rlist">
							<div class="serial">
								<img  :src="rvo.image" width="85px" height="65px">
							</div>
							<div class="serial">{{rvo.camp_name}}</div>
							<div class="serial">{{rvo.subject}}</div>
							<div class="percentage">{{rvo.content}}</div>
							<div class="serial">{{rvo.dbday}}</div>
							<div class="serial">{{rvo.hit}}</div>
							<div class="serial">
								<div class="row">
									<div class="col-lg-12 text-center">
										<button class="btn btn-xs btn-primary" style="font-size: 15px;margin-left:-30px;" @click="reviewGo(rvo.sno)">리뷰 보러가기</button>
									</div>
								</div>
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
			my_rlist:[]
		},
		mounted:function(){
			axios.get('../mypage/camp_myreview.do',{
				params:{
					id:'${sessionScope.id}'
				}
			}).then(res=>{
				this.my_rlist=res.data
			})
		},
		methods:{
			reviewGo:function(sno){
				location.href="../camp/camp_detail.do?cno="+sno
			}
		}
	})
</script>
</body>
</html>  