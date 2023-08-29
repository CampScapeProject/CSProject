<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>일상을 벗어나 자연속으로, CampScape</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
	.board_area {
		padding: 30px;
		background: #f5f5f5;
	}
	
	.board_area .table th {
		padding : 0.5rem;
		font-size: 16px;
		background-color: rgba(255, 255, 255, 0.6);
	}
	
	.board_area .table td {
		padding: 0.3rem;
		font-size: 14px;
		vertical-align: top;
	    border-top: 1px solid #dee2e6;
	}
	
	.board_area_title {
		font-size: 20px;
		font-weight: bold;
	}
	
	.board_list_title {
		overflow: inherit;
	}
	
	.board_area .table a:hover {
		color: #E86A33;
		font-weight: bold;
	}

</style>
</head>
<body>
    <!-- slider_area_start -->
    <div class="slider_area">
    	
        <div class="slider_active owl-carousel">
        	
        	
            <div class="single_slider  d-flex align-items-center slider_bg_1">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

 			<a href="../notice/notice_detail.do?nno=11">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            
            <div class="single_slider  d-flex align-items-center slider_bg_3">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    <!-- slider_area_end -->

    <!-- where_togo_area_start  -->
    <div class="where_togo_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3" style="margin-right: -50px;">
                    <div class="form_area" style="padding-bottom: 20px;">
                        <h3>캠핑장 예약 검색</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="search_wrap">
                    	 <div class="search_form" >
                            <div class="input_field">
                                <input type="text" name="daterange" ref="rdate"/>
                            </div>
                            <div class="input_field" >
                               <select ref="state">
	                                <option data-display="지역">지역을 선택하세요</option>
	                                <option value="경기">경기</option>
	                                <option value="인천">인천</option>
	                                <option value="강원">강원</option>
	                                <option value="울산">울산</option>
	                                <option value="충청북도">충북</option>
	                                <option value="충청남도">충남</option>
	                                <option value="전라북도">전북</option>
	                                <option value="전라남도">전남</option>
	                                <option value="경상북도">경북</option>
	                                <option value="경상남도">경남</option>
	                                <option value="제주">제주</option>
                              </select>
                            </div>
                            <div class="input_field">
                               <input type="text" v-model="campfd" placeholder="캠핑장명을 검색하세요."
											onfocus="this.placeholder = ''" onblur="this.placeholder = '캠핑장명을 검색하세요.'" required
												class="single-input-primary" style="margin-bottom: 20px;">
                            </div>
                            <div class="search_btn">
                                <button class="boxed-btn4 " type="submit" @click="findReserve()" style="background-color: #F2E3DB;color: #1F1F1F">검색</button>
                            </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- where_togo_area_end  -->
    
    
  <!-- 캠핑장 조회수 순 리스트  -->
    
    <div class="popular_destination_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <h3>자연 속 휴식,<br> 캠프스케이프에서 만나요!</h3>
                        <p>조회수가 가장 높은 캠핑장!!</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6" v-for="cvo in camp_list">
                    <div class="single_destination" style="width:360px;height: 290px;cursor: pointer;"  @click="toDetail(cvo.cno)">
                        <div class="thumb">
                           <img :src="cvo.image" style="width: 100%;height: 290px;">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center" >{{cvo.name}}<a href="#" class="mPrice">{{cvo.mprice}}&nbsp;원</a> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!------------------------------------>

    <div class="popular_places_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <h3>완벽한 캠핑을 위한 모든 준비,<br> 캠프스케이프에서 시작하세요!</h3>
                        <p>이번주 가장 많이 사랑받은 캠핑용품!</p>
                    </div>
                </div>
            </div>
            <div class="row">
               <div class="col-lg-4 col-md-6" v-for="s in shopList">
                   <div class="single_place">
                       <div class="thumb">
                           <img :src="s.image" alt="">
                       </div>
                       <div class="place_info">
                           <a :href="'../shop/shop_detail.do?sno='+s.sno"><h3>{{s.name}}</h3></a>
                           <p></p>	
                           <div class="rating_days d-flex justify-content-between">
                               <span class="d-flex justify-content-center align-items-center">
                                    <i class="fa fa-star"></i> 
                                    <i class="fa fa-star"></i> 
                                    <i class="fa fa-star"></i> 
                                    <i class="fa fa-star"></i> 
                                    <i class="fa fa-star"></i>
                                    <a href="#">금주의 인기상품!</a>
                               </span>
<!-- 	                                <div class="days">
	                                    <i class="fa fa-clock-o"></i>
	                                    <a href="#">5 Days</a>
	                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="row">
                <div class="col-lg-12">
                    <div class="more_place_btn text-center">
                        <a class="boxed-btn4" href="#">More Places</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<div class="rent-el">
	    <div class="recent_trip_area">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-lg-6">
	                    <div class="section_title text-center mb_70">
	                        <h3>여행 일정에 맞는 차량을<br> 캠프스케이프에서 찾아보세요</h3>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-lg-4 col-md-6" v-for="vo in rent_list">
	                    <div class="single_trip">
	                        <div class="thumb">
	                            <img :src="vo.image">
	                        </div>
	                        <div class="info">
	                            <div class="date">
	                                <span>{{vo.maker}}</span>
	                            </div>
	                            <a>
	                            	<div class="row">
	                            		<div class="col-lg-8">
	                                		<h3>{{vo.car_name}}</h3>
	                            		</div>
	                            		<div class="col-lg-4 text-right" style="padding-top: 11px;">
	                            			<i class="fa-solid fa-heart" style="color: red"></i> ({{vo.jjimCount}})
	                            		</div>
	                            	</div>
	                            </a>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-12" style="margin-top: 30px;">
	                    <div class="more_place_btn text-center">
	                        <a class="boxed-btn4" href="../rent/rent_main.do">예약하러가기</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
    
    <div class="board_area">
	    <div class="container">
	    	<div class="row">
	    		<div class="col-lg-6" style="padding: 30px;">
	    			<div style="margin-bottom: 15px;">
	    			<span class="board_area_title">공지사항</span>
	    			</div>
	    			
	    			<table class="table">
	    				<tr>
	    					<th width=80% class="text-center">제목</th>
	    					<th width=20% class="text-center">조회수</th>
	    				</tr>
	    				<tr v-for="nvo, index in notice_list" :key=index v-if="index<Math.min(notice_list.length, 5)">
	    					<td width=80% class="board_list_title"><a :href="'../notice/notice_detail.do?nno='+nvo.nno">{{nvo.title}}</a></td>
	    					<td width=20% class="text-center">{{nvo.hit}}</td>
	    				</tr>
	    			</table>
	    		</div>
	    		
	    		<div class="col-lg-6" style="padding: 30px;">
	    			<div style="margin-bottom: 15px;">
	    			<span class="board_area_title">인기 레시피</span>
	    			</div>
	    			
	    			<table class="table">
	    				<tr>
	    					<th width=80% class="text-center">레시피명</th>
	    					<th width=20% class="text-center">조회수</th>
	    				</tr>
	    				<tr v-for="rvo, index in recipe_list" :key=index v-if="index<Math.min(recipe_list.length, 5)">
	    					<td width=80% class="board_list_title"><a :href="'../recipe/recipe_detail.do?rno='+rvo.rno">{{rvo.title}}</a></td>
	    					<td width=20% class="text-center">{{rvo.hit}}</td>
	    				</tr>
	    			</table>
	    		</div>
	    	</div>
	    </div>
    </div>
    
<script type="text/javascript">
	
let slider = new Vue({
		el:'.slider_area',
		data:{
			slider_number : 3
		}
	})

let campList=new Vue({
	el:'.popular_destination_area',
	data:{
		camp_list:[]
	},
	mounted:function(){
		axios.get('../camp/camp_main_list_vue.do').then(res=>{
			console.log(res.data)
			this.camp_list=res.data
		})
	},
	methods:{
		toDetail:function(no){
			location.href="../camp/camp_detail.do?cno="+no;
		}
	}
})

let campFind=new Vue({
	el:'.where_togo_area',
	data:{
		campfd:''
	},
	methods:{
		findReserve:function(){
			let	rdate=this.$refs.rdate.value
			let	state=this.$refs.state.value
			let	campfd=this.campfd
			
		
			location.href="../camp/camp_main_find.do?rdate="+rdate+"&state="+state+"&campfd="+campfd				
			
		}
	}
})

let shop=new Vue({
    el: '.popular_places_area',
    data: {
        shopList: []
    },
    mounted: function() {
        axios.get('../main/shopList_vue.do')
            .then(res => {
                this.shopList = res.data; 
                console.log(this.shopList);
            })
            .catch(error => {
                console.error(error); 
            });
    }
})

let board = new Vue({
	el:'.board_area',
	data:{
		notice_list:[],
		recipe_list:[]
	},
	mounted:function(){
		axios.get('../main/notice_list_vue.do').then(res=>{
			this.notice_list = res.data
			
		}).catch(error=>{
			console.log(error.response)
		})
		
		axios.get('../main/recipe_list_vue.do').then(res=>{
			this.recipe_list = res.data
		}).catch(error=>{
			console.log(error.response)
		})
	}
})

let rent=new Vue({
	el:'.rent-el',
	data:{
		rent_list:[]
	},
	mounted:function(){
		axios.get('../rent/home_rent_list_vue.do').then(res=>{
			console.log(res.data)
			this.rent_list=res.data
		})
	}
})

</script>
</body>
</html>