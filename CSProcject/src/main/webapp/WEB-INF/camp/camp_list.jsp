<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">

.well{ 
	width: 1465px;
	height: 50px;
}  
 
#cDate input {
  width: 250px;
  height: 40px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
  text-align: center;
  margin-bottom: 20px;
}
.col-lg-12 h3{
	margin-top: 20px;
}
.single-input-primary:focus {
  outline: none;
  border: 1px solid #ff5e13;
}
.single-input-primary {
  display: block;
  width: 100%;
  line-height: 40px;
  border: 1px solid #DEE2E7;
  outline: none;
  background: #f9f9ff;
  padding: 0 20px;
}
.filter_result_wrap .filter_bordered {
  border: 2px solid #DEE2E7;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
  padding: 25px;
}

.blog-pagination {
  margin-top: 80px;
}

/* line 988, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_blog.scss */
.blog-pagination .page-link {
  font-size: 14px;
  position: relative;
  display: block;
  padding: 0;
  text-align: center;
  margin-left: -1px;
  line-height: 45px;
  width: 45px;
  height: 45px;
  border-radius: 0 !important;
  color: #8a8a8a;
  border: 1px solid #f0e9ff;
  margin-right: 2px;
}

</style>
</head>
<body>
<!-- 배경 -->
 <div class="bradcam_area bradcam_bg_2">
     <div class="container">
	     <div class="row">
	         <div class="col-xl-12">
	             <div class="bradcam_text text-center">
	                 <h3>Destinations</h3>
	                 <p>Pixel perfect design with awesome contents</p>
	             </div>
	         </div>
	     </div>
     </div>
</div>
<!---------->

<!-- 제목 칸 -->
<div class="where_togo_area" style="padding: 30px;">
    <div class="container" style="margin: 0 auto;">
    	<div class=row>
         <div class="col-lg-3">
             <div class="form_area">
                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">캠핑</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!---------->

<div class="popular_places_area">
	<div class="container">
		<div class="row">
		 
		    <!-- 리스트 목록 -->
		        <div class="col-lg-8">
		        	 <div class="well" style=" border-bottom: 2px solid #DEE2E7;">
						<select>
							<option value="1">조회순 &nbsp;&nbsp;</option>
							<option value="1">추천순 &nbsp;&nbsp;</option>
							<option value="1">리뷰순 &nbsp;&nbsp;</option>
						</select>
						<a href="../camp/camp_main.do" class="btn btn-info" role="button" style="float: right; margin-right: 20px;background-color:gray;border: none; ">캠핑장 검색</a>
		        	 </div>
		        	 <br>
		            <div class="row" style="width: 1500px;display: flex;justify-content : center;">
		                <div class="col-lg-3 col-md-3" v-for="vo in camp_list" style="border: 1px solid #f0e9ff;width: 400px;height: 500px;">
		                    <div class="single_place">
		                        <div class="thumb" style="margin-top: 10px;">
		                            <img :src="vo.image" :title="vo.name" style="height: 250px;">
		                            <a href="#" class="prise">{{vo.mprice}}&nbsp;원</a>
		                        </div>
		                        <div class="place_info">
		                            <a :href="'../camp/camp_detail.do?cno='+vo.cno"><h3>{{vo.name}}</h3></a>
		                            <p>{{vo.msg}}</p>
		                            <i class="fa fa-phone-square" style="color: #E86A33"></i>&nbsp;<span>{{vo.phone}}</span><br>
		                           <i class="fa fa-location-arrow" style="color: #E86A33"></i>&nbsp;<span>{{vo.address}}</span>
		                            <div class="rating_days d-flex justify-content-between" style="margin-top: 8px;margin-bottom: -8px;">
		                            		<!--  추천,찜 등 -->
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!--  page바 -->
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
		   <!--------->
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'.popular_places_area',
		data:{
			camp_list:[],
			page_list:[],
			curpage:1,
			startpage:0,
			endpage:0,
			totalpage:0
		},
		mounted:function(){
			this.dataRecive();
		},
		methods:{
			dataRecive:function(){
				axios.get('../camp/camp_list_vue.do',{
					params:{
						page:this.curpage
					}
				}).then(res=>{
					console.log(res.data)
					this.camp_list=res.data
					
				})
				
				axios.get('../camp/camp_list_page_vue.do',{
					params:{
						page:this.curpage
					}
					
				}).then(res=>{
					console.log(res.data)
					this.page_list=res.data
					this.curpage=this.page_list.curpage
					this.totalpage=this.page_list.totalpage
					this.startpage=this.page_list.startpage
					this.endpage=this.page_list.endpage
				})
			},
			range:function(start,end){
				let arr=[];
				let length=end-start;
				for(let i=0;i<=length;i++)
				{
					arr[i]=start
					start++;
				}
				return arr;
			},
			prev:function(){
				this.curpage=this.startpage-1;
				this.dataRecive();
			},
			next:function(){
				this.curpage=this.endpage+1;
				this.dataRecive();
			},
			pageChange:function(page){
				this.curpage=page;
				this.dataRecive();
			}
		}
		
	})
</script>
</body>
</html>