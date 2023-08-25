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


</style>
</head>
<body>
    <!-- slider_area_start -->
    <div class="slider_area">
    	
        <div class="slider_active owl-carousel">
        
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

 
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="single_slider  d-flex align-items-center slider_bg_4 overlay">
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
                <div class="col-lg-3">
                    <div class="form_area" style="padding-bottom: 20px;">
                        <h3>Where you want to go?</h3>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="search_wrap">
                        <form class="search_form" action="#">
                            <div class="input_field">
                                <input type="text" placeholder="Where to go?">
                            </div>
                            <div class="input_field">
                                <input id="datepicker" placeholder="Date">
                            </div>
                            <div class="input_field">
                                <select>
                                    <option data-display="Travel type">Travel type</option>
                                    <option value="1">Some option</option>
                                    <option value="2">Another option</option>
                                </select>
                            </div>
                            <div class="search_btn">
                                <button class="boxed-btn4 " type="submit" >Search</button>
                            </div>
                        </form>
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
    
    <!-- popular_destination_area_end  -->

    <div class="travel_variation_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="../layout/img/svg_icon/1.svg" alt="">
                        </div>
                        <h3>Comfortable Journey</h3>
                        <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="../layout/img/svg_icon/2.svg" alt="">
                        </div>
                        <h3>Luxuries Hotel</h3>
                        <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_travel text-center">
                        <div class="icon">
                            <img src="../layout/img/svg_icon/3.svg" alt="">
                        </div>
                        <h3>Travel Guide</h3>
                        <p>A wonderful serenity has taken to the possession of my entire soul.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="../layout/img/trip/1.png" alt="">
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="../layout/img/trip/2.png" alt="">
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="../layout/img/trip/3.png" alt="">
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
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

</script>
</body>
</html>