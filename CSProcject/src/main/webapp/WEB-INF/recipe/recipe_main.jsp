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
		min-height: 20rem; /* layout hack */
		background: #fff center center no-repeat;
		background-size: cover;
		filter: blur(3px); /* blur the lowres image */
	}
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	}
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
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
		max-width: 20rem;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0,0,0,0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0,0,0,0.5);
	}
	.card-description {
		display: block;
		padding: 1em 0.5em;
		color: #515151;
		text-decoration: none;
	}
	.card-description > h2 {
		margin: 0 0 0.5em;
	}
	.card-description > p {
		margin: 0;
	}
	
</style>
</head>
<body>

	<!-- 레시피 상단 -->
	<div class="container" style="padding: 80px; background-color: ">
		<div class="row2" style="text-align: center">

		</div>
	</div>
	
	<!-- 레시피 본문 -->

	<div class="container">
		<div class="row2">
			<!-- 레시피 리스트 -->
			
			<div class="col-sm-12">
			<ul class="card-list">
				<li class="card">
				<a class="card-image" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg);" data-image-full="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-500.jpg">
					<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/310408/psychopomp-100.jpg" alt="Psychopomp" />
				</a>
				<a class="card-description" href="https://michellezauner.bandcamp.com/album/psychopomp-2" target="_blank">
					<h2>Psychopomp</h2>
					<p>Japanese Breakfast</p>
				</a>
				</li>
			</ul>
			</div>
			
			
			
			<!-- 페이지 -->
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
	
<script>
	new Vue({
		el:'.container',
		data:{
			recipe_list:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		},
		mounted:function(){
			
		},
		methods:{
			// 해당 페이지 값 데이터 읽기
			axios.get('../recipe/recipe_list_vue.do', {
				params:{
					page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.chef_list=response.data
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
		}
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
		
	})
</script>
</body>
</html>