<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">예약자 목록</span>
		</div>
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;padding-bottom: 5px">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="serial">캠핑장</div>
							<div class="serial text-left">연락처</div>
							<div class="visit text-left" style="margin-left: 10px;">주소</div>
							<div class="serial text-left">가격</div>
							<div class="serial text-left">승인 여부</div>
						</div>
						
						<div class="table-row" v-for="jvo in mypage_jlist">
							<div class="serial">
								<img  :src="jvo.image" width="85px" height="65px">
							</div>
							<div class="serial"><a :href="'../camp/camp_detail.do?cno='+jvo.sno">{{jvo.name}}</a></div>
							<div class="serial">{{jvo.phone}}</div>	
							<div class="visit" style="margin-left: 10px;">{{jvo.address}}</div>
							<div class="serial">{{jvo.price}}</div>
							<div class="serial">
								<button class="btn btn-xs btn-danger" @click="jjimDelete(jvo.sno)"style="font-size: 15px;margin-right: 5px;">찜 취소</button>
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
			mypage_jlist:[],
		
		},
		mounted:function(){
			this.dataRecive();
		},
		methods:{
			dataRecive:function(){
				axios.get('../mypage/camp_jjim_list.do',{
					params:{
						id:'${sessionScope.id}'
					}
				}).then(res=>{
					console.log(res.data)
					this.mypage_jlist=res.data
					
				})
			},
			jjimDelete:function(sno){
		    	axios.get('../camp/camp_jjim_delete.do',{
		    		params:{
		    			id:'${sessionScope.id}',
		    			cno:sno
		    		}
		    	}).then(res=>{
		    		this.jjimCount=res.data.jjimCount
		    		this.dataRecive();
		    	})
		    }
		}
	})
	</script>
</body>
</html>