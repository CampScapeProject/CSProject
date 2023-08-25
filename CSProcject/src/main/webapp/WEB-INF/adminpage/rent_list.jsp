<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
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
<div class="el">
	<div class=row style="padding-top: 40px;padding-left: 20px;padding-bottom: 150px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<h3 style="margin: 0">렌터카 목록</h3>
		</div>
		
		<div class="col-lg-6 text-left" style="margin-bottom: 10px;">
			<input type="text" placeholder="차량명을 입력하세요" v-model="fd" @keyup.enter="findData()">
			<input type="button" value="검색" @click="findData()">
		</div>
		<div class="col-lg-6 text-right" style="margin-bottom: 10px;">
			<input type="button" value="차량등록">
		</div>
		
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;padding-bottom: 5px">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="visit">차량명</div>
							<div class="serial text-left">브랜드</div>
							<div class="visit text-left">차종</div>
							<div class="serial text-left">탑승인원</div>
							<div class="serial text-left">연료</div>
							<div class="serial text-left">가격</div>
						</div>
						
						<div class="table-row" v-for="vo in rent_list">
							<div class="serial">
								<img :src="vo.image" width="65px" height="55px">
							</div>
							<div class="visit">{{vo.car_name}}</div>
							<div class="serial">{{vo.maker}}</div>
							<div class="visit">{{vo.car_type}}</div>
							<div class="serial">{{vo.inwon}}</div>
							<div class="serial">{{vo.fuel}}</div>
							<div class="serial">{{vo.price}}</div>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
   		<div class="col-lg-12 text-center" style="color: #E86A33;margin-top: 10px;font-size: 18px;">
   			<span class="page" @click="prev()" v-if="startpage>1">&lt;</span>&nbsp;
   			<span class="page" 
   				:class="curpage==(startpage+i-1)?'activePage':''" 
   			 	v-for="i in (endpage-startpage+1)"
   				@click="pageSelect((startpage+i-1))"
   			>
   				{{startpage+i-1}}&nbsp;
   			</span>
   			<span class="page" @click="next()" v-if="totalpage>endpage">&gt;</span>&nbsp;
   		</div>
	</div>
</div>

<script>
	new Vue({
		el:'.el',
		data:{
			curpage:1,
			fd:'',
			rent_list:[],
			totalpage:0,
			startpage:0,
			endpage:0
		},
		mounted:function(){
			this.listData()
		},
		methods:{
			listData(){
				axios.get('../rent/admin_rent_list_vue.do',{
					params:{
						curpage:this.curpage,
						fd:this.fd
					}
				}).then(res=>{
					console.log(res.data)
					this.rent_list=res.data.list
					this.totalpage=res.data.totalpage
					this.startpage=res.data.startpage
					this.endpage=res.data.endpage
				})
			},
		    pageSelect(page){
		    	this.curpage=page
		    	this.listData()
		    },
		    prev(){
		    	this.curpage=this.startpage-1
		    	this.listData()
		    },
		    next(){
		    	this.curpage=this.endpage+1
		    	this.listData()
		    },
		    findData(){
		    	this.listData()
		    }
		}
	})
</script>

</body>
</html>