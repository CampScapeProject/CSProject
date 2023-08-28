<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.recipe {
		margin: 100px 10px 30px 100px;
	}
	
	.row1 {
		margin: 0px auto;
		padding-right: 120px;
	}
	
	.recipe_pagination {
		margin: 50px 0px 50px 0px;
	}
	
	a {
		color: #333333;
	}
	
	a:hover {
		text-decoration: none;
		font-weight: bold;
		color: #333333;
	}
</style>
</head>
<body>
	<div class="recipe">
		<div class="row1">
			
			<table class="table">
				<tr>
					<th width=20% class="text-center"></th>
					<th width=60% class="text-center">레시피명</th>
					<th width=10% class="text-center">조회수</th>
					<th width=10% class="text-center"></th>
				</tr>
				<tr v-for="rvo in recipe_list">
					<td width=20% class="text-center" style="vertical-align: middle;">
						<img :src="rvo.image" style="width: 40%">
					</td>
					<td width=60% style="vertical-align: middle;"><a :href="'../recipe/recipe_detail.do?rno='+rvo.rno">{{rvo.title}}</a></td>
					<td width=10% class="text-center" style="vertical-align: middle;">{{rvo.hit}}</td>
					<td width=10% class="text-center" style="vertical-align: middle;">
						<input type=button class="btn btn-sm btn-default" value="삭제" @click="recipeDel(rvo.rno)">
					</td>
				</tr>
			</table>
			
			<div class="recipe_pagination">
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
			recipe_list:[],
			page_info:[],
			rno:0,
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0
		},
		mounted:function(){
			this.dataRecive()
		},
		methods:{
			
			dataRecive:function(){
				axios.get('../recipe/ap_list_vue.do', {
					params:{
						page:this.curpage
					}
				}).then(res=>{
					this.recipe_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
				
				//페이지 데이터
				axios.get('../recipe/ap_totalpage_vue.do', {
					params:{
						page:this.curpage
					}
				}).then(res=>{
					this.page_info = res.data
					
					this.curpage = this.page_info.curpage
					this.totalpage = this.page_info.totalpage
					this.startpage = this.page_info.startpage
					this.endpage = this.page_info.endpage
				})
			},
			
			range:function(start,end){
				let arr = [];
				let length = end-start;
				for(let i=0;i<=length;i++)
				{
					arr[i] = start;
					start++;
				}
				return arr;
			},
			prev:function(){
				this.curpage = this.startPage-1;
				this.dataRecive();
			},
			next:function(){
				this.curpage = this.endPage+1;
				this.dataRecive();
			},
			pageChange:function(page){
				this.curpage = page;
				this.dataRecive();
			},
			
			recipeDel:function(rno){
				
				alert("삭제하시겠습니까?")
				
				console.log(rno);
				
				axios.post("../recipe/recipe_del_vue.do", {
					params:{
						rno:rno
					}
				}).then(res=>{
					this.dataRecive();
				}).catch(error=>{
					console.log(error.response)
				})
			}
			
		}
	})
</script>
</body>
</html>