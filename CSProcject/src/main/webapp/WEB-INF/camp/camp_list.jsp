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
	width: 1000px;
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
		            <div class="row">
		                <div class="col-lg-6 col-md-6" v-for="vo in camp_list">
		                    <div class="single_place">
		                        <div class="thumb">
		                            <img :src="vo.image" :title="vo.name" style="height: 250px;">
		                            <a href="#" class="prise">{{vo.mprice}}</a>
		                        </div>
		                        <div class="place_info">
		                            <a href="destination_details.html"><h3>{{vo.name}}</h3></a>
		                            <p>{{vo.msg}}</p>
		                            <span><i class="fa fa-phone-square" style="color: #E86A33">{{vo.phone}}</i></span>&nbsp;
		                            <span><i class="fa fa-location-arrow" style="color: #E86A33">{{vo.address}}</i></span>
		                            <div class="rating_days d-flex justify-content-between" style="margin-top: 8px;margin-bottom: -8px;">
		                               <a href="#" class="btn btn-sm btn-danger" style="width:85px;height: 25px; text-align: center;font-size: 10px;">Primary</a>
		                               <a href="#" class="btn btn-sm btn-danger" style="width:85px;height: 25px; text-align: center;font-size: 10px;">Primary</a>
		                               <a href="#" class="btn btn-sm btn-danger" style="width:85px;height: 25px; text-align: center;font-size: 10px;">Primary</a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="more_place_btn text-center">
		                        <a class="boxed-btn4" href="#">캠핑장 더보기</a>
		                    </div>
		                </div>
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
			this.dataRecv();
		},
		methods:{
			dataRecv:function(){
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
			}
		}
		
	})
</script>
</body>
</html>