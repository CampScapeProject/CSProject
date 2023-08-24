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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6fd98b724a1c5dfb4d7bfce05b0389f&libraries=services"></script>
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

<script>
<!-- 가격 검색시 자동 콤마 넣기 -->
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
</script>
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
	<!-- 검색 창 -->
		
			<div class="col-lg-4">
			    <div class="filter_result_wrap">
			        <h2>상세조건</h2>
			        <br>
			        <div class="filter_bordered">
			        <div class="col-lg-12" id="cDate" style="text-align: center;border-bottom: 2px solid #DEE2E7;">
			        	<input type="text" name="daterange" ref="rdate"/>
			        </div>
			            <div class="filter_inner">
			                <div class="row">
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
			                        <div class="single_select">
			                        <h3><b>지역</b></h3>
			                            <select ref="state">
			                                <option data-display="지역">지역을 선택하세요</option>
			                                <option value="경기">경기</option>
			                                <option value="인천">인천</option>
			                                <option value="강원">강원</option>
			                                <option value="울산">울산</option>
			                                <option value="충북">충북</option>
			                                <option value="충남">충남</option>
			                                <option value="전북">전북</option>
			                                <option value="전남">전남</option>
			                                <option value="경북">경북</option>
			                                <option value="경남">경남</option>
			                                <option value="제주">제주</option>
			                              </select>
			                        </div>
			                    </div>
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
	                                 <h3><b>가격</b></h3>
	                                 <div class="row">
										<input type="text" ref=spricefd v-model=spricefd placeholder="15,000"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '15,000 ~ 1,100,000사이 입력'" required
												class="single-input-primary" style="margin-bottom: 20px;margin-left:12px;width: 100px;" onkeyup="inputNumberFormat(this)">
										<span style="margin: 10px;">&nbsp;-&nbsp;</span>
										<input type="text" ref=epricefd v-model=epricefd placeholder="1,100,000사이 입력"
									onfocus="this.placeholder = ''" onblur="this.placeholder = '15,000 ~ 1,100,000사이 입력'" required
										class="single-input-primary" style="margin-bottom: 20px;width: 100px;" onkeyup="inputNumberFormat(this)">
										<span style="margin: 10px;">&nbsp;원</span>
									</div>
                                </div>
			                    <div class="col-lg-12" style="border-bottom: 2px solid #DEE2E7;">
				                     <h3><b>캠핑장 명</b></h3>
										<input type="text" ref=campfd v-model=campfd placeholder="캠핑장명을 검색하세요."
											onfocus="this.placeholder = ''" onblur="this.placeholder = '캠핑장명을 검색하세요.'" required
												class="single-input-primary" style="margin-bottom: 20px;">
								</div>
			                </div>
			            </div>
			            <br>
			            <div class="reset_btn">
			                <button class="boxed-btn4" type="submit" @click="findCamp()">적용</button>
			            </div>
			        </div>
			    </div>
			</div>
	    <!----------->    
	    
	    	 
	    <!-- 리스트 목록 -->
	        <div class="col-lg-8">
	        	 <div class="well" style=" border-bottom: 2px solid #DEE2E7;">
						<select>
							<option value="1">조회순 &nbsp;&nbsp;</option>
							<option value="1">추천순 &nbsp;&nbsp;</option>
							<option value="1">리뷰순 &nbsp;&nbsp;</option>
						</select>
						<a href="../camp/camp_list.do" class="btn btn-info" role="button" style="float: right; margin-right: 20px;background-color:gray;border: none; ">캠핑장 전체</a>
		        	 </div>
		        	 <br>
		            <div class="row" style="height: 800px;">
		                <div class="col-lg-6 col-md-6" v-for="vo in camp_list">
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
	        		</div>
	        	<div class="row">
	                <div class="col-lg-12">
	                    <div class="more_place_btn text-center">
	                        <a class="boxed-btn4" href="#">캠핑장 더보기</a>
	                    </div>
	                </div>
	            </div>
	   	 </div>
	   	 <!----------------->
	   	 
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'.popular_places_area',
		data:{
			camp_list:[],
			curpage:1,
			state:'',
			spricefd:'',
			epricefd:'',
			campfd:'',
			rdate:''
			
		},
		mounted:function(){
			axios.get('../camp/camp_list_vue.do',{
				params:{
					page:this.curpage,
					type:'mlist'
				}
			}).then(res=>{
				this.camp_list=res.data
			})
			
		},
		methods:{
			findCamp:function(){
				axios.get('../camp/camp_find_list_vue.do',{
					params:{
						page:this.curpage,
						rdate:this.$refs.rdate.value,
						state:this.$refs.state.value,
						spricefd:this.spricefd,
						epricefd:this.epricefd,
						campfd:this.campfd
						
					}
				}).then(res=>{
					this.camp_list=res.data
				})
			}
			
		}
		
		
	}) 
</script>
</body>
</html>