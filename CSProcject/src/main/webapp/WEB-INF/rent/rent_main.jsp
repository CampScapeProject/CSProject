<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
 
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 
<style type="text/css">
	.filter_result_wrap input[type="checkbox"]{
		width: 15px;
		height: 15px;
	}
	
	.col-lg-8 .row::-webkit-scrollbar {
	    width: 10px;
	}
	.col-lg-8 .row::-webkit-scrollbar-thumb {
	    background-color: rgb(180, 180, 180);
	    border-radius: 10px;
	}
	.col-lg-8 .row::-webkit-scrollbar-track {
	    background-color: #F5F5F5;
	}
	.cookieWrap{
		position: fixed;
		top: 250px;
		right: 50px;
		
		border: none;
		border-radius: 16px;
		color: white;
		padding: 12px;
		font-weight: bold;
	}
</style>

</head>
<body style="background-color: #F7FAFD;">
<div class="el-space">
	<!-- where_togo_area_start  -->
    <div class="where_togo_area" style="padding: 30px;">
        <div class="container" style="margin: 0 auto;">
        	<div class=row>
	            <div class="col-lg-3">
	                <div class="form_area">
	                    <h1 style="color: white;text-align: left;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">차량 조회</h1>
	                </div>
	            </div>
	            <div class="col-lg-2"></div>
	            <div class="col-lg-7" style="padding-top: 7px;">
	                <div class="search_wrap" >
	                    <form class="search_form" action="#">
	                        <div class="input_field">
	                            <h3 style="color: white;text-align:right;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">날짜를 선택하세요</h3>
	                        </div>
	                        <div class="input_field">
								<!-- daterangepicker -->
								<input type="text" name="daterange" ref="date" />

	                        </div>
	                        <div class="search_btn">
	                            <button class="boxed-btn4" type="button" @click="print()">Search</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
            </div>
        </div>
    </div>
    <!-- where_togo_area_end  -->
    
    <div class="popular_places_area" style="padding-top: 50px;padding-bottom: 100px">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="filter_result_wrap">
                        <h3><b>차량 옵션</b></h3>
                        <div class="filter_bordered" style="background-color: white;">
                            <div class="filter_inner">
                            	<div class=row style="padding:0 15px 15px 15px;">
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="all" v-model="all" ref="all" @click="reset()">&nbsp;전체
                            		</div>
                            	</div>
                            	
                            	<hr style="margin-top: 0px;">
                            	
                            	<h4><b>차종</b></h4>
                            	<div class=row style="padding: 3px 15px 15px 15px;">
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_1" v-model="oArray.o1_1" ref="o1_1">&nbsp;경차
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_2" v-model="oArray.o1_2" ref="o1_2">&nbsp;소형차
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_3" v-model="oArray.o1_3" ref="o1_3">&nbsp;준중형
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_4" v-model="oArray.o1_4" ref="o1_4">&nbsp;중형
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_5" v-model="oArray.o1_5" ref="o1_5">&nbsp;SUV
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_6" v-model="oArray.o1_6" ref="o1_6">&nbsp;승합차
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_7" v-model="oArray.o1_7" ref="o1_7">&nbsp;전기차
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_8" v-model="oArray.o1_8" ref="o1_8">&nbsp;고급차
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o1_9" v-model="oArray.o1_9" ref="o1_9">&nbsp;수입
                            		</div>
                            	</div>
                            	
                            	<hr style="margin-top: 0px;">
                            	
                            	<h4><b>차종</b></h4>
                            	<div class=row style="padding: 3px 15px 15px 15px;">
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o2_1" v-model="oArray.o2_1" ref="o2_1">&nbsp;기아
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o2_2" v-model="oArray.o2_2" ref="o2_2">&nbsp;현대
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o2_3" v-model="oArray.o2_3" ref="o2_3">&nbsp;기타
                            		</div>
                            	</div>
                            	
                            	<hr style="margin-top: 0px;">
                            	
                            	<h4><b>승차인원</b></h4>
                            	<div class=row style="padding: 3px 15px 15px 15px;">
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o3_1" v-model="oArray.o3_1" ref="o3_1">&nbsp;1~5
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o3_2" v-model="oArray.o3_2" ref="o3_2">&nbsp;6~8
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o3_3" v-model="oArray.o3_3" ref="o3_3">&nbsp;9~
                            		</div>
                            	</div>
                            	
                            	<hr style="margin-top: 0px;">
                            	
                            	<h4><b>연료</b></h4>
                            	<div class=row style="padding: 3px 15px 15px 15px;">
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o4_1" v-model="oArray.o4_1" ref="o4_1">&nbsp;휘발유
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o4_2" v-model="oArray.o4_2" ref="o4_2">&nbsp;경유
                            		</div>
                            		<div class="col-sm-4">
                            			<input type="checkbox" id="o4_3" v-model="oArray.o4_3" ref="o4_3">&nbsp;기타
                            		</div>
                            	</div>
                            		
                            </div>

                            <div class="reset_btn" style="margin-top: 30px;">
                                <button class="boxed-btn4" @click="reset()">Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row" style="height: 800px;overflow-y:auto ">
                        <div class="col-lg-6 col-md-6" v-for="vo in rent_list">
                            <div class="single_place">
                                <div class="thumb">
                                    <img :src="vo.image" height="250px" alt="">
                                    <!-- <a href="#" class="prise">$500</a> -->
                                </div>
                                <div class="place_info">
                                    <a :href="'../rent/rent_detail.do?rno=' + vo.rno + '&date=' + date"><h3 style="margin: 0">{{vo.car_name}}</h3></a>
                                    <p>{{vo.maker}}</p>
                                    <div class="rating_days d-flex justify-content-between">
                                        <span class="d-flex justify-content-center align-items-center">
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa fa-star"></i> 
                                             <i class="fa-regular fa-star"></i>
                                             <a href="#">(20 Review)</a>
                                        </span>
                                        <div class="days">
                                            <a href="#" style="margin-right: -7px;">
                                            	<!-- fa-regular fa-heart -->
                                            	<i class="fa fa-heart" style="color: red;font-size: 20px;"></i>
                                            </a>
                                            <span>(1000)</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
 	<div class="filter_result_wrap cookieWrap">
		<h3><b>최근 본 렌터카</b></h3>
		<div class="filter_bordered" style="background-color: white;">
		    <div class="filter_inner">
		    	<img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/SUV/%EC%85%80%ED%86%A0%EC%8A%A4.jpg" width="130px" height="100px">
		    </div>
		</div>
	</div>
    
<!-- <aside class="single_sidebar_widget popular_post_widget cookieWrap">
	<h3 class="widget_title">펠리세이드</h3>
	<div class="media post_item">
		<img src="https://rentinjeju.com/media/images/%EB%A0%8C%ED%8A%B8%EC%B9%B4/SUV/%EC%85%80%ED%86%A0%EC%8A%A4.jpg" width="130px" height="100px">
		<div class="media-body">
			<a href="single-blog.html">
				<h3>From life was you fish...</h3>
			</a>
			<p>January 12, 2019</p>
		</div>
	</div>
</aside> -->

</div>

<script>
	function dateFormat(date) {
	    let month = date.getMonth() + 1;
	    let day = date.getDate();
	    month = month >= 10 ? month : '0' + month;
	    day = day >= 10 ? day : '0' + day;
	
	    return date.getFullYear() + '-' + month + '-' + day;
	}
	var today=new Date();
	var tomorrow = new Date(new Date().setDate(today.getDate()+1))
	let defaultDate=dateFormat(today) + ' - ' + dateFormat(tomorrow);
	
	new Vue({
		el:'.el-space',
		data:{
			date:'',
			rent_list:[],
			all:true,
			oArray:{
				o1_1:false,
				o1_2:false,
				o1_3:false,
				o1_4:false,
				o1_5:false,
				o1_6:false,
				o1_7:false,
				o1_8:false,
				o1_9:false,
				o2_1:false,
				o2_2:false,
				o2_3:false,
				o3_1:false,
				o3_2:false,
				o3_3:false,
				o4_1:false,
				o4_2:false,
				o4_3:false
			}
		},
		mounted:function(){
			//dateFormat(today) + ' - ' + dateFormat(tomorrow)
			this.$refs.date.value=defaultDate
			this.date=this.$refs.date.value
			this.print();
		},
		watch:{
			oArray: {
			      handler(newValue, oldValue) {
			          this.oArrayChange();
			      },
			      deep: true,
			}
		},
		methods:{
			print(){
				console.log('ref.date: '+this.$refs.date.value)
				axios.get('../rent/rentList_vue.do',{
					params:{
						date:this.$refs.date.value,
						all:this.all,
						o1_1:this.oArray.o1_1,
						o1_2:this.oArray.o1_2,
						o1_3:this.oArray.o1_3,
						o1_4:this.oArray.o1_4,
						o1_5:this.oArray.o1_5,
						o1_6:this.oArray.o1_6,
						o1_7:this.oArray.o1_7,
						o1_8:this.oArray.o1_8,
						o1_9:this.oArray.o1_9,
						o2_1:this.oArray.o2_1,
						o2_2:this.oArray.o2_2,
						o2_3:this.oArray.o2_3,
						o3_1:this.oArray.o3_1,
						o3_2:this.oArray.o3_2,
						o3_3:this.oArray.o3_3,
						o4_1:this.oArray.o4_1,
						o4_2:this.oArray.o4_2,
						o4_3:this.oArray.o4_3
					}
				}).then(res=>{
					console.log(res.data)
					this.rent_list=res.data
					this.date=this.$refs.date.value
				}) 
			},
			reset(){
				for(let o in this.oArray) {
					this.oArray[o]=false;
				}
				this.all=true;
			},
			oArrayChange(){
				let check=false;
				let values=Object.values(this.oArray);
				for(let value of values){
					if(value==true){
						check=true;
						break;
					}
				}
				if(check==true){
					this.all=false;
				} else {
					this.all=true;
				}
				this.print()
			}


		}
	})
</script>
</body>
</html>