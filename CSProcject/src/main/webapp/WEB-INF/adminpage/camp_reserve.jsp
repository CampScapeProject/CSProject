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
<style type="text/css">
	.page{
		cursor: pointer;
	}
	.activePage{
		font-weight: bold;
	}
	
	.nice-select {
   display: none !important;
}

#select-count {
   display: block !important;
}


</style>
</head>
<body>
<div class="campMy">
	<div class=row style="padding-top: 40px;padding-left: 20px;padding-bottom: 150px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">예약자 목록</span>
		</div>
		
		<div class="col-lg-6 text-left" style="margin-bottom: 10px;">
		<div class="col-lg-12">
    		<div class="option">
		      <div>
		        <select ref="rstate" @change="option()" id="select-count">
					<option value="전체">전체&nbsp;&nbsp;</option>
					<option value="대기">대기중&nbsp;&nbsp;</option>
					<option value="예약승인">승인완료&nbsp;&nbsp;</option>
		        </select>
		      </div>
		        </div>
       		</div>
		</div>
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;padding-bottom: 5px">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="serial">캠핑장</div>
							<div class="serial text-left">객실</div>
							<div class="serial text-left">예약자</div>
							<div class="serial text-left">인원</div>
							<div class="visit text-left">예약일</div>
							<div class="serial text-left">가격</div>
							<div class="serial text-left">승인 여부</div>
							<div class="serial text-left">요청 사항</div>
						</div>
						
						<div class="table-row" v-for="cvo in admin_clist">
							<div class="serial">
								<img  :src="cvo.image" width="85px" height="65px">
							</div>
							<div class="serial">{{cvo.camp_name}}</div>
							<div class="serial">{{cvo.campsite_name}}</div>
							<div class="serial">{{cvo.name}}({{cvo.id}})</div>
							<div class="serial">{{cvo.inwon}}</div>
							<div class="visit">{{cvo.dbsdate}}&nbsp;-&nbsp;{{cvo.dbedate}}</div>
							<div class="serial">{{cvo.price}}</div>
							<div class="serial">
								<button class="btn btn-xs btn-primary" @click="rstateChange(cvo.rno)" style="font-size: 15px;">{{cvo.rstate}}</button>
							</div>
							<div class="serial">
								<button class="btn btn-xs btn-primary" @click="seeDetail(true)" style="font-size: 15px;margin-right: 5px;">보기</button>
								<!--  요청사항 디테일 -->
								 <div id="dialogDetail" :title="cvo.name+'님의 요청사항'" v-if="show" style="background-color: #EEEEEE;">
						           		<div class="comment-form" style="margin-top: -55px;">
						                   <div class="row" >
						                      <div class="col-12">
						                         <div class="form-group">
						                            <textarea class="form-control w-100"  cols="30" rows="9" readonly>
						                            	{{cvo.msg}}
						                            </textarea>
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
   			<div class="row">
            	<nav class="blog-pagination justify-content-center d-flex">
                     <ul class="pagination">
                         <li class="page-item" v-if="startpage>1">
                             <a href="#" class="page-link" aria-label="Previous" @click="prev()">
                                 <i class="ti-angle-left"></i>
                             </a>
                         </li>
                         <li v-for="i in range(startpage,endpage)" :class="i==curpage?'page-item active':'page-item'">
                             <a href="#" class="page-link" @click="pageChange(i)">{{i}}</a>
                         </li>
                         <li class="page-item" v-if="endpage<totalpage">
                             <a href="#" class="page-link" aria-label="Next" @click="next()">
                                 <i class="ti-angle-right"></i>
                             </a>
                         </li>
                     </ul>
                 </nav> 
            </div>
		 </div>
		 </div>
	</div>
	<script>
	new Vue({
		el:'.campMy',
		data:{
			admin_clist:[],
			curpage:1,
			startpage:0,
			endpage:0,
			totalpage:0,
			rstate:'전체',
			show:false
		},
		mounted:function(){
			this.dataRecive();
		},
		methods:{
			dataRecive:function(){
				axios.get('../adminpage/camp_reserve_list.do',{
					params:{
						page:this.curpage,
						rstate:this.$refs.rstate.value
					}
				}).then(res=>{
					console.log(res.data)
					this.admin_clist=res.data.list
					this.curpage=res.data.curpage
					this.totalpage=res.data.totalpage
					this.startpage=res.data.startpage
					this.endpage=res.data.endpage
				})
			},
			rstateChange:function(rno){
				axios.get('../adminpage/camp_reserve_rstate_change.do',{
					params:{
						page:1,
						rno:rno,
						rstate:this.rstate
					}
				}).then(res=>{
					console.log(res.data)
					this.admin_clist=res.data.list
					this.curpage=res.data.curpage
					this.totalpage=res.data.totalpage
					this.startpage=res.data.startpage
					this.endpage=res.data.endpage
				})
			},
			range:function(start,end){
				let arr=[];
				let length=end-start;
				for(let i=0;i<=length;i++)
				{
					arr[i]=start
					start++;
				}
				return arr;
			},
			prev:function(){
				this.curpage=this.startpage-1;
				this.dataRecive();
			},
			next:function(){
				this.curpage=this.endpage+1;
				this.dataRecive();
			},
			pageChange:function(page){
				this.curpage=page;
				this.dataRecive();
			},
			option:function(){
				this.dataRecive();
			},
			seeDetail:function(bool){
				this.show=bool
				
				$('#dialogDetail').dialog({
					autoOpen:false,
					modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
					width:600,
					height:300
				}).dialog("open")
			}
		}
	})
	</script>
</body>
</html>