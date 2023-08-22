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
	.card-image {
		display: block;
		background: #fff center center no-repeat;
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 1;
		max-height: 10rem;
		object-fit: cover;
	}
	
	.card-list {
		display: block;
		margin: 1rem auto;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
	}
	
	.card {
		display: inline-block;
		width: 90%;
		max-width: 15rem;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		color: #515151;
	}
	
	.card-description {
		display: block;
		padding: 1em 0.5em;
		text-decoration: none;
	}
	
	.card-description > span {
		margin: 0 0 0.5em;
		display: block;
		font-weight: bold;
		font-size: 16px;
		
		text-align:left;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	
	.card-description > span:hover {
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
		<div class="row">
		
			<!-- 레시피 리스트 -->
			<div class="col-lg-3" v-for="vo in recipe_list">
				<li class="card">
					<a class="card-image" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
						<img :src="vo.image" :title="vo.title">
					</a>
					
					<a class="card-description" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
						<span>{{vo.title}}</span>
					</a>
				</li>
			</div>			
		</div>
		
		<!-- 페이지 -->
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
			startpage:0,
			endpage:0
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
					this.startpage = this.page_list.startPage
					this.endpage = this.page_list.endPage
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