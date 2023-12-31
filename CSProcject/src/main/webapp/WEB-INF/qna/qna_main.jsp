<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape - 문의하기</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style type="text/css">
	.row2 {
		margin: 0px auto;
		text-align: center;
	}
	.form_area, .blog_item_date {
		font-family: 'Jua', sans-serif;
	} 
	.form_area span {
		font-size: 60px;
		color: black;
		font-weight: bold;
		display: block;
		margin: 0px auto;
	}
	.blog_item_img .blog_item_date {
   		background-color: #E86A33;
	}
	.notice_text {
		text-align: center;
	}
	.blog_right_sidebar .post_category_widget .cat-list li a {
		font-size: 14px;
		line-height: 20px;
		color: white;
	}
	.qna_nav {
		margin: 0px auto;
		padding: 80px 80px 80px 180px;
	}
	.qna_nav > ul > li {
		float: left;
		margin-left: 30px;
		margin-right: 30px;
	}
	
	a, span {
		color: #212529;
	}
	
	li > a:hover {
		color: #212529;
		font-weight: bold;
	}
	
	a:hover {
		text-decoration: none;
		font-weight: bold;
		color: #212529;
	}

</style>
</head>
<body>

	<div class="container" style="padding: 80px;">
	
		<div class="row2" style="text-align: center">
			<div class="form_area">
				<i class="fa-regular fa-comments fa-2xl" style="margin-bottom: 20px;"></i>
				<br>
				<span class="notice_text">문의사항</span>
			</div>
		</div>
		
		<div class="row2">
			<div class="qna_nav">
				<ul style="list-style: none">
					<li>
						<a href="../qna/qna_main.do?qcno=1">전체</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=2">캠핑장 예약</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=3">렌터카 예약</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=4">상품 문의</a>
					</li>
					<li>
						<a href="../qna/qna_main.do?qcno=5">기타 문의</a>
					</li>
				</ul>
			</div>
		</div>
		
	</div>
	 
	<!--================ 문의사항 폼 시작 =================-->
    <section class="blog_area section-padding">
    	<div class="container">
	    	<div class="row">
	    	
	    		<div class="search_form" style="margin-bottom: 20px;">
	                    <input type=radio name=search value=subject checked>    제목 
	                    <input type=radio name=search value=content>    내용
	                    <input type=text class="input-sm" placeholder="검색어를 입력하세요." style="margin-left: 5px;"/>
	                    <a href="#"><i class="fa-solid fa-magnifying-glass fa-lg" style="color: #e86a33;margin-left: 5px;"></i></a>
	                    
	                    <c:if test="${sessionScope.id!=null }">
	                    	<a href="../qna/qna_insert.do"><input type=button class="boxed-btn4 text-white rounded-1 w-40 h-10 btn_1" value="1:1 문의하기" style="margin-left: 570px"></a>
	                    </c:if>
	    		</div>
	    		
	    		<table class="table">
	    			<tr>
	    				<th width=1% class="text-center"></th>
	    				<th width=49% class="text-center">CONTENT</th>
	    				<th width=15% class="text-center">작성자</th>
	    				<th width=20% class="text-center">DATE</th>
	    				<th width=15% class="text-center">HITS</th>
	    			</tr>
	    			
	    			<tr v-for="vo in qna_list">
	    				 
	    				<td width=1% class="text-center"></td>
	    				<!-- 답변이 아닐 때 -->
	    				<td width=49% v-if="vo.group_tab==0">
	    					<!-- 비밀글 일 때 -->
	    					<span v-if="vo.open=='n'">
	    						<span v-if="sessionAdmin=='y'">
	    							<a :href="'../qna/qna_detail.do?qno='+vo.qno">
		    							<i class="fa-solid fa-lock" style="color:#828282; margin-right: 10px;"></i>{{vo.title}}
		    						</a>
	    						</span> 
	    						
		    					<span v-else>
		    						<span v-if="sessionId!=vo.id">
	    								<i class="fa-solid fa-lock" style="color:#828282; margin-right: 10px;"></i>비밀글입니다.
		    						</span>
		    						
		    						<span v-if="sessionId==vo.id">
			    						<a :href="'../qna/qna_detail.do?qno='+vo.qno">
			    							<i class="fa-solid fa-lock" style="color:#828282; margin-right: 10px;"></i>{{vo.title}}
			    						</a>
		    						</span>
		    					</span>
	    						
	    					</span>
	    					
	    					<!-- 공개글일 때 -->
	    					<a v-if="vo.open=='y'" :href="'../qna/qna_detail.do?qno='+vo.qno">{{vo.title}}</a>
	    				</td>
	    				
	    				<!-- 답변일 때 -->
	    				<td width=40% v-if="vo.group_tab>=1">
	    					<i v-if="vo.open=='n'" class="fa-solid fa-lock" style="color:#828282; margin-right: 10px;"></i>
	    					<span v-for="i in vo.group_tab" :key="i">&nbsp;&nbsp;
	    						<i class="fa-solid fa-arrow-turn-up fa-rotate-90" style="color: #E86A33"></i>
	    					</span>&nbsp;&nbsp;
	    					<a :href="'../qna/qna_detail.do?qno='+vo.qno">{{vo.title}}</a>
	    				</td>
	    				
	    				
	    				<td width=15% class="text-center">
	    					<span v-if="vo.group_tab<1">{{vo.id}}</span>
	    					<span v-if="vo.group_tab>=1">관리자</span>
	    				</td>
	    				<td width=20% class="text-center">{{vo.dbday}}</td>
	    				<td width=15% class="text-center">{{vo.hit}}</td>
	    			</tr>
	    		</table>
	    		
	    		<div class="row2">
	    		
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
  	</section>

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script>
	new Vue({
		el:'.blog_area',
		data:{
			qna_list:[],
			page_info:[],
			qcno:${param.qcno},
			curpage:1,
			totalpage:0,
			startpage:0,
			endpage:0,
			sessionId:'${id}',
			sessionAdmin:'${admin}',
			name:'${name}',
			group_tab:0
		},
		mounted:function(){
			this.dataRecive()
		},
		methods:{
			dataRecive:function(){
				
				// 데이터값 받아오기
				axios.get('../qna/qna_main_vue.do', {
					params:{
						page:this.curpage,
						qcno:this.qcno
					}
				}).then(res=>{
					console.log(res.data)
					this.qna_list = res.data
				}).catch(error=>{
					console.log(error.response)
				})
				
				// 페이지 읽어오기
				axios.get('../qna/qna_page_vue.do',{
					params:{
						page:this.curpage,
						qcno:this.qcno
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
				this.curpage = this.startpage-1;
				this.dataRecive();
			},
			next:function(){
				this.curpage = this.endpage+1;
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