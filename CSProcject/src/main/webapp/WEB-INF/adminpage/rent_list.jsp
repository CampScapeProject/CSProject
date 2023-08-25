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
   		
   		<!-- 차량 등록 칸 -->
   		<div class="col-lg-12" style="padding: 30px">
   			<div class="text-left">
   			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">차량 등록</span>
   			</div>
   			
   			<div>
   				<div class="col-lg-4 text-center" style="padding:30px;">
   					<div style="width: 300px; height: 300px; background-color: white;  display: grid;place-items: center;border:1px solid black;">
							<input type="file" id=chooseFile name="chooseFile" accept="image/*" onchange="loadFile(this)" style="display: none;">
							<label for="chooseFile" style="width: 20%;height: 20%;margin: 0 ">
								<img src="../layout/img/imgUpload.png" style="width: 100%;height: 100%;">
							</label>
   					</div>
   				</div>
   				
   				<div class="col-lg-8" style="padding:30px;">
   					<table class="table">
   						<tr>
	   						<th class="text-center" width=15%>차량명</th>
	   						<td width=85%>
	   							<input type=text class="input-sm form-control">
	   						</td>
   						</tr>
   						<tr>
	   						<th class="text-center" width=15%>차종</th>
	   						<td width=85%>
	   							<input type=text class="input-sm form-control">
	   						</td>
   						</tr>
   						<tr>
	   						<th class="text-center" width=15%>브랜드</th>
	   						<td width=85%>
	   							<input type=text class="input-sm form-control">
	   						</td>
   						</tr>
   						<tr>
	   						<th class="text-center" width=15%>탑승인원</th>
	   						<td width=85%>
	   							<select>
	   								<option v-for="i in people" :key="i" :value="i+3">       {{i+3}}&nbsp;&nbsp;&nbsp;       </option>
	   							</select>
	   						</td>
   						</tr>
   						<tr>
	   						<th class="text-center" width=15%>연료</th>
	   						<td width=85%>
	   							<input type=text class="input-sm form-control">
	   						</td>
   						</tr>
   						<tr>
	   						<th class="text-center" width=15%>가격</th>
	   						<td width=85%>
	   							<input type=text class="input-sm form-control">
	   						</td>
   						</tr>
   						<tr>
   							<th colspan=2>
   								<div class=row>
   									<div class="col-lg-8 text-left" >
   										차량 옵션
   									</div>
   									<div class="col-lg-4 text-right" style="font-size: 20px;">
   										<i class="fa-solid fa-plus"></i> <i class="fa-solid fa-minus"></i>
   									</div>
   									
   									<div class="col-lg-3">
   										· <input type=text style="width: 70%;text-align: right">
   									</div>
   									
   								</div>
   							</th>
   						</tr>
   					</table>
   				</div>
   			</div>
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
			endpage:0,
			people:9
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