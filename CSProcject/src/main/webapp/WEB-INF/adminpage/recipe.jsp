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
	}
	
	.recipe_pagination {
		margin: 50px 0px 50px 0px;
	}
</style>
</head>
<body>
	<div class="recipe">
		<div class="row1">
			
			<table class="table">
				<tr>
					<th width=30% class="text-center"></th>
					<th width=50% class="text-center">레시피명</th>
					<th width=10% class="text-center">조회수</th>
					<th width=10% class="text-center"></th>
				</tr>
				<tr v-for="rvo in recipe_list">
					<td width=30% class="text-center">
						<img :href="rvo.image" style="width: 20%">
					</td>
					<td width=50%>{{rvo.title}}</td>
					<td width=10% class="text-center">{{rvo.hit}}</td>
					<td width=10% class="text-center">
						<input type=button class="btn btn-sm btn-default" value="삭제">
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
			page_list:[],
			rno:0,
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0
		},
		mounted:function(){
			
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
				this.page_list = res.data
				
				this.curpage = this.page_list.curpage
				this.totalpage = this.page_list.totalpage
				this.startpage = this.page_list.startpage
				this.endpage = this.page_list.endpage
			})
			
		},
		methods:{
			
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
			},
			next:function(){
				this.curpage = this.endPage+1;
			},
			pageChange:function(page){
				this.curpage = page;
			}
			
		}
	})
</script>
</body>
</html>