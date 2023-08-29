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
	
	.where_togo_area {
		background: linear-gradient(142.94deg, #7fb88d 7.53%, #41644A 103.72%);
	}
	
	/* 레시피 리스트 css */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		height: 160px;
		opacity: 1;
		max-height: 10rem;
		object-fit: cover;
		padding: 10px 10px 0px 10px;
		border-radius: 15px;
	}
	
	.card {
		display: inline-block;
		width: 100%;
		max-width: 15rem;
		margin: 0.5rem 0.5rem 1rem 0.5rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
		border-radius: 15px;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		color: #515151;
	}
	
	.card-description {
		display: block;
		padding: 0.7em 0.6em;
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
	
	.card-description-detail {
		margin: 0px 10px 5px 10px;
	}
	
	.card-description-detail > span {
		color: #8f8f8f;
		font-size: 12px;
	}
	
	.search_form {
		margin-bottom: 30px;
	}
	
	.row2 {
		text-align: right;
	}
	
	i:hover {
		cursor: pointer;
	}
	
</style>
</head>
<body>

<div class="recipe">

	<div class="where_togo_area" style="padding: 30px;">
	    <div class="container" style="margin: 0 auto;">
	    	<div class=row>
	         <div class="col-lg-3">
	             <div class="form_area">
	                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">Recipe</h1>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 레시피 본문 -->
	
	<div class="container">
	
		<div class="row2" style="margin-top: 70px; margin-right: 10px;">
			<div class="search">
	            <input type=text class="input-sm" placeholder="레시피명을 입력하세요." style="width: 300px" v-model="fd" @keyup.enter="recipeSearch()"/>
	            <i class="fa-solid fa-magnifying-glass fa-lg" style="color: #e86a33;margin-left: 5px;" @click="recipeSearch()"></i>
			</div>
		</div>
		
		<div class="row" style="margin-top: 30px;">
			
			<!-- 레시피 리스트 -->
			<div class="col-lg-3" v-for="vo in recipe_list">
				<li class="card">
					<a class="card-image" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
						<img :src="vo.image" :title="vo.title">
					</a>
					
					<a class="card-description" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
						<span>{{vo.title}}</span>
					</a>
					
					<div class="card-description-detail text-right">
						<i class="fa-solid fa-eye fa-sm" style="color: #8f8f8f;"></i><span style="margin-right: 5px; margin-left: 3px;">             {{vo.hit}}</span>
						<i class="fa-solid fa-heart fa-sm" style="color: #8f8f8f;"></i><span style="margin-left: 3px;">             {{vo.jjim}}</span>
					</div>
				</li>
			</div>			
		</div>
		
		<!-- 페이지 -->
		<div class="row2" style="margin-bottom: 80px">
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
			endpage:0,
			fd:''
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
						page:this.curpage,
						fd:this.fd
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
						page:this.curpage,
						fd:this.fd
					}
				}).then(response=>{
					console.log(response.data)
					
					this.page_list = response.data
					this.curpage = this.page_list.curpage
					this.totalpage = this.page_list.totalpage
					this.startpage = this.page_list.startpage
					this.endpage = this.page_list.endpage
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
			},
			
			// 검색
			recipeSearch:function(){
				this.curpage=1
				this.dataRecive();
			}
		}
		
	})
</script>
</body>
</html>