<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.recipe_container {
		margin: 100px 10px 30px 180px;
	}
	
	.row1 {
		margin: 0px auto;
		padding-right: 100px;
	}
	
	.row2 {
		margin: 0px auto;
	}
	
	.recipe_pagination {
		margin: 50px 0px 50px 0px;
	}
	
	.reply_ok {
		color: #EB0000;
		font-weight: bold;
	}
	
	a {
		color: #333333;
	}
	
	a:hover {
		font-weight: bold;
		text-decoration: none;
		color: #333333;
	}
	
	i:hover {
		cursor: pointer;
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
		padding: 7px 7px 0px 7px;
		border-radius: 20px;
	}
	
	.card {
		display: inline-block;
		width: 100%;
		max-width: 15rem;
		margin: 0.5rem 0.5rem 2rem 0.5rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
		border-radius: 20px;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		color: #515151;
	}
	
	.card-description {
		display: block;
		padding: 0.9em 0.7em 0.5rem 0.7rem;
		text-decoration: none;
	}
	
	.card-description > span {
		margin: 0 0 0.3em;
		display: block;
		font-weight: bold;
		font-size: 14px;
		
		text-align:left;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	
	.card-description > span:hover {
		color: #41644A;
	}
	
	.card-description-detail {
		margin: 0px 10px 10px 10px;
	}
	
</style>
</head>
<body>
	<div class="recipe_container">
	
		<div class="container">
			<div class="row1">

				<div class="col-lg-2" v-for="vo in recipe_list">
					<li class="card">
						<a class="card-image" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
							<img :src="vo.image" :title="vo.name">
						</a>
						
						<a class="card-description" :href="'../recipe/recipe_detail.do?rno='+vo.rno">
							<span>{{vo.name}}</span>
						</a>
						
						<div class="card-description-detail text-right">
							<i class="fa-solid fa-heart fa-2xl" style="color: #f05c5c;" @click=jjimDelete()></i>
						</div>
					</li>
				</div>
				
			</div>	
		</div>
				
		<div class="row2">	
			<div class="qna_pagination">
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
		el:'.recipe_container',
		data:{
			recipe_list:[],
			page_info:[],
			rno:0,
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			id:'${id}'
		},
		mounted:function(){
			this.dataRecive()
		},
		methods:{
			
			dataRecive:function(){
				
				axios.get('../recipe/mp_recipe_list.do', {
					params:{
						id:this.id,
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					
					this.recipe_list = res.data
					
				}).catch(error=>{
					console.log(error.response)
				})
				
				axios.get('../recipe/mp_recipe_page.do', {
					params:{
						id:this.id,
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					
					this.page_info = res.data
					
					this.curpage = this.page_info.curpage
					this.totalpage = this.page_info.totalpage
					this.startpage = this.page_info.startpage
					this.endpage = this.page_info.endpage
					
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
			
			jjimDelete:function(){
				
				axios.post('../recipe/jjim_delete.do',null, {
					params:{
						id:this.id,
						rno:this.rno
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