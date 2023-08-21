<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.row2 {
		margin: 0px auto;
		text-align: center;
	}
	
	/* 레시피 리스트 css */
	.caption {
		margin: 0 0 0.5em;
		font-weight: bold;
		font-size: 16px;
		
		text-align:left;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	.caption:hover {
		color: #41644A;
	}
	
</style>
</head>
<body>

<div class="recipe">

	<!-- 레시피 상단 -->
	<div class="container" style="padding: 80px; background-color: ">
		<div class="row2" style="text-align: center">

		</div>
	</div>
	
	<!-- 레시피 본문 -->

	<div class="container">
		<div class="row2">
			<!-- 레시피 리스트 -->
			
			<div class="col-sm-3">
				<div class="thumbnail" v-for="vo in recipe_list">
			        <a href="#">
			          <img :src="vo.image" alt="Lights" style="width:200px;">
			          <div class="caption">
			            <p>{{vo.title}}</p>
			          </div>
			        </a>
			    </div>
			</div>
			
			
			
			<!-- 페이지 -->
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<li class="page-item" v-if="startPage>1">
						<a href="#" class="page-link" aria-label="Previous" @click="prev()">
							<i class="ti-angle-left"></i>
						</a>
					</li>
					
					<li v-for="i in range(startPage,endPage)" :class="i==curpage?'page-item active':'page-item'">
						<a href="#" class="page-link" @click="pageChange(i)">{{i}}</a>
					</li>
					
					<li class="page-item" v-if="endPage<totalpage">
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
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		},
		mounted:function(){
			this.dataRecive();
		},
		methods:{
			dataRecive:function()
			{
				// 해당 페이지 값 데이터 읽기
				axios.get('../recipe/recipe_list_vue.do', {
					params:{
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.recipe_list=response.data
				}).catch(error=>{
					console.log(error.response)
				})
				
				// 페이지 정보
				axios.get('../recipe/recipe_page_vue.do', {
					params:{
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.page_list = response.data
					this.curpage = this.page_list.curpage
					this.totalpage = this.page_list.totalpage
					this.startPage = this.page_list.startPage
					this.endPage = this.page_list.endPage
				}).catch(error=>{
					console.log(error.response)
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
			}
		}
		
	})
</script>
</body>
</html>