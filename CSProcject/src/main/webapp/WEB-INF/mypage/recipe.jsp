<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.recipe_container {
		margin: 100px 10px 30px 100px;
	}
	
	.row1 {
		margin: 0px auto;
		padding-right: 100px;
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
	
</style>
</head>
<body>
	<div class="recipe_container">
		<div class="container">
			<div class="row1">
				<span class="recipe_title"></span>
				
				<div class="card-list">
					<article class="card">
					
					<figure class="card-image">
						<img src="https://images.unsplash.com/photo-1494253109108-2e30c049369b?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYyNDcwMTUwOQ&ixlib=rb-1.2.1&q=85" alt="An orange painted blue, cut in half laying on a blue background" />
					</figure>
					
					<div class="card-header">
						<a href="#">When life gives you oranges</a>
						<button class="icon-button">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Heart">
								<path d="M7 3C4.239 3 2 5.216 2 7.95c0 2.207.875 7.445 9.488 12.74a.985.985 0 0 0 1.024 0C21.125 15.395 22 10.157 22 7.95 22 5.216 19.761 3 17 3s-5 3-5 3-2.239-3-5-3z" />
							</svg>
				
						</button>
					</div>
					
					<div class="card-footer">
						<div class="card-meta card-meta--views">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="EyeOpen">
								<path d="M21.257 10.962c.474.62.474 1.457 0 2.076C19.764 14.987 16.182 19 12 19c-4.182 0-7.764-4.013-9.257-5.962a1.692 1.692 0 0 1 0-2.076C4.236 9.013 7.818 5 12 5c4.182 0 7.764 4.013 9.257 5.962z" />
								<circle cx="12" cy="12" r="3" />
							</svg>
							2,465
						</div>
						
						<div class="card-meta card-meta--date">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
								<rect x="2" y="4" width="20" height="18" rx="4" />
								<path d="M8 2v4" />
								<path d="M16 2v4" />
								<path d="M2 10h20" />
							</svg>
							Jul 26, 2019
						</div>
					</div>
					
				</article>
				</div>
				
				
				
				
				
				
				<table class="table">
					<tr>
						<th width=20% class="text-center"></th>
						<th width=60% class="text-center">레시피명</th>
						<th width=20% class="text-center"></th>
					</tr>
					<tr v-for="vo in recipe_list">
						<td width=20% class="text-center" style="vertical-align: middle;">
							<img :src="vo.image" style="width:30%">
						</td>
						<td width=60% style="vertical-align: middle;">
							<a :href="'../recipe/recipe_detail.do?rno='+vo.sno">{{vo.name}}</a>
						</td>
						<td width=20% class="text-center" style="vertical-align: middle;">
							<span>
								<i class="fa-solid fa-heart fa-2xl" style="color: #f05c5c;" @click=jjimDelete()></i>
							</span>
						</td>
					</tr>
				</table>
				
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
						rno:this.rno,
						id:this.sessionId
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