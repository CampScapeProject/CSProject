	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6fd98b724a1c5dfb4d7bfce05b0389f&libraries=services"></script>
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
<style type="text/css">
/* 카테고리 */
.row2 {
		margin: 0px auto;
		text-align: center;
	}
.tabs {
	  display: flex;
	}
.tabs > div {
  	padding: 10px 20px;
  	cursor: pointer;
  	background-color: #001D38;
  	color: white;
}
.tabs > div.active {
  	border-bottom: 3px solid #001D38;
  	font-weight: bold;
  	background-color: white;
  	color: #001D38
}
.tabs > div:hover{
	font-weight: bold;
	color:#001D38;
}
.tab-content > div {
  display: none;
}
.tab-content > div:nth-child(1),
.tab-content > div:nth-child(2),
.tab-content > div:nth-child(3) {
  display: block;
}
/*---------------------------------------*/

.single-post-area .navigation-area {
  border: 1px solid #f0e9ff;
  padding-bottom: 30px;
  margin-top: 55px;
}

/* 주변관광지 */
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
		max-width: 15rem;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		color: #515151;
	}
	
	.card-description {
		display: block;
		padding: 1em 0.5em;
		text-decoration: none;
	}
	
	.card-description > span {
		margin: 0 0 0.5em;
		display: block;
		font-weight: bold;
		font-size: 16px;
		
		text-align:left;
		overflow:hidden;
		text-overflow:ellipsis;
		white-space:nowrap;
	}
	
	.card-description > span:hover {
		color: #41644A;
	}
/*-----------------------------------------*/

/* 리뷰 */

.campprogress-table-wrap {
}

.campprogress-table {
  background: #f9f9ff;
  padding: 15px 0px 30px 0px;
  min-width: 800px;
} 

.campprogress-table .serial {
  width: 11.83%;
  padding-left: 30px;
}


.campprogress-table .visit {
  width: 19.74%;
}


.campprogress-table .table-head {
  display: flex;
}

.campprogress-table .table-head .serial,
.campprogress-table .table-head .visit {
  color: #415094;
  line-height: 40px;
  text-transform: uppercase;
  font-weight: 500;
}

.campprogress-table .table-row {
  padding: 15px 0;
  border-top: 1px solid #edf3fd;
  display: flex;
}

.campprogress-table .table-row .serial,
.campprogress-table .table-row .visit {
  display: flex;
  align-items: center;
}	
/*------------------------------------*/

/* 버튼 */
.cgenric-btn {
  display: inline-block;
  outline: none;
  line-height: 40px;
  padding: 0 30px;
  font-size: .9em;
  text-align: center;
  text-decoration: none;
  font-weight: 500;
  cursor: pointer;
  -webkit-transition: all 0.3s ease 0s;
  -moz-transition: all 0.3s ease 0s;
  -o-transition: all 0.3s ease 0s;
  transition: all 0.3s ease 0s;
  width: 90px;
  height: 35px;
  color: white;
}

/* line 166, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_elements.scss */
.cgenric-btn:focus {
  outline: none;
}


/* line 221, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_elements.scss */
.cgenric-btn:hover {
  color: #001D38;
  border: 1px solid #001D38;
  background: white;
}

/* line 227, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_elements.scss */
.cgenric-btn .cprimary-border {
  color: #001D38;
  border: 1px solid #001D38;
  background: #001D38;
}

/* line 231, ../../Arafath/CL/December/231. Travel-02/HTML/scss/_elements.scss */
.cgenric-btn .cprimary-border:hover {
  color: #001D38;
  background: white;
  border: 1px solid #001D38;
}

.blog_details a:hover {
  color: #001D38;
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
                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">캠핑 상세보기</h1>
                </div>
            </div>
        </div>
    </div>
</div>

   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-10 posts-list">
               <div class="single-post"><!--style="width: 1000px"-->
                  <div class="feature-img">
                     <img class="img-fluid" :src="camp_detail.image">
                  </div>
                  <div class="blog_details">
                     <h2>{{camp_detail.name}}</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#" ref="addr"><i class="fa fa-location-arrow" style="color: #E86A33"></i>{{camp_detail.address}}</a></li>
                        <li><a href="#"><i class="fa fa-phone-square" style="color: #E86A33"></i>{{camp_detail.phone}}</a></li>
                     </ul>
                     <p class="excert" style="color: black">
                       {{camp_detail.msg}}
                     </p>
                  <!--  
                     <div class="quote-wrapper">
                        <div class="quotes">
                          {{camp_detail.msg}}
                        </div>
                     </div> -->
                  </div>
               </div>
               <div class="navigation-top"><!--style="width: 1000px"-->
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                     </ul>
                  </div>
               </div>
               
               <!--  카테고리 -->
               <div class="comments-area" style="margin-top: 0px;"><!--style="width: 1000px"-->
               	<div id="app"><!--style="width: 1000px"-->
					<div class="tabs row text-center" style="padding:20px 35px 0 35px">
					    <div v-for="(tab, index) in tabs" :key="index" :class="{ active: activeTab === index }" @click="setActiveTab(index)"
					      class="col-lg-4" style="border-right: 1px solid white;border-left: 1px solid white;">
					      {{ tab.title }}
					    </div>
					</div>
					<div style="height: 20px;"></div>
				  	<div class="tab-content" style="padding:0 20px 0 20px;min-height: 200px;">
				    	<div v-for="(tab, index) in tabs" :key="index" v-show="activeTab === index">
				      		<template v-if="index == 0">
				      			<div class="row">
					      			<div class="col-lg-3" v-for="fvo in tour_list">
										<li class="card">
											<a class="card-image" href="#">
												<img :src="fvo.image">
											</a>
											<a class="card-description" :href="fvo.link" target="_blank">
												<span>{{fvo.name}}</span>
											</a>
											<a class="card-description" :href="fvo.link" target="_blank">
												<span style="font-size: 10px;">사이트 보기</span>
											</a>
										</li>
									</div>
								</div>
							</template>
				      		<template v-if="index == 1">
								<div class=col-sm-12>
						            <!-- 지도출력 -->
						            <div id="map" style="width:100%;height:300px;"></div>
						            <!-- 분석 = 그래프(데이터분석 : 데이터마이닝) : 꼬꼬마 -->
						         </div>
					        	
							</template>
				      		<template v-if="index == 2">
					        	<div class="container">
									<div class="campprogress-table-wrap">
										<div class="campprogress-table">
											<div class="table-head">
												<div class="serial" width=10%>번호</div>
												<div class="visit" width=45%>제목</div>
												<div class="visit" width=15%>이름</div>
												<div class="visit" width=15%>날짜</div>
												<div class="visit" width=5%>조회수</div>
												<div class="visit" width=10%></div>
											</div>
											<div class="table-row" v-for="rvo,index in review_list">
												<div class="serial">{{index+1}}</div>
												<div class="visit"><a @click="reviewDetail(rvo.no,rvo.sno,true)">{{rvo.subject}}</a></div>
												<div class="visit">{{rvo.id}}</div>
												<div class="visit">{{rvo.dbday}}</div>
												<div class="visit">{{rvo.hit}}</div>
												<div class="visit">
													<button class="btn btn-xs btn-danger" style="font-size: 15px;margin-right: 15px;" @click="reviewUpdateDialog(rvo.no,rvo.sno,true)">수정</button>
          											<button class="btn btn-xs btn-danger" @click="reviewDelete(rvo.no,rvo.sno)" style="font-size: 15px;cursor:pointer;">삭제</buton>
												</div>
											</div>
										</div>
									</div>
									<div style="float: right;">
										<div class="row">
										<a href="#" class="cgenric-btn cprimary-border circle" style="background-color: #001D38;border-radius: 20px;">작성</a>
							            </div>
									</div>
							 		<nav class="blog-pagination justify-content-center d-flex">
			                                    <a href="#"  aria-label="Previous" @click="prev()">
			                                    &lt;
			                                    </a>
			                                &nbsp; {{curpage}} page/ {{totalpage}} pages &nbsp;
			                                    <a href="#"  aria-label="Next" @click="next()">
			                                    &gt;
			                                    </a>
			                                </li>
			                            </ul>
			                        </nav> 
								</div>
							</template>
				    	</div>
				  	</div>
				</div>
              </div>
              
              <div id="dialog" title="후기글" v-if="isShow">
              	<div class="comment-form" style="margin-top: -65px;">
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row" >
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="name" type="text" :value="review_detail.id" readonly>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="date" id="date" type="text" :value="review_detail.dbday" readonly>
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" name="subject" id="subject" type="text" :value="review_detail.subject" readonly>
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" readonly>
                              	{{review_detail.content}}
                              </textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">후기 작성</button>
                     </div>
                  </form>
               </div>
              </div>
              
              <!-- 리뷰 수정 -->
              <div id="dialogU" title="후기글 수정" v-if="isShow">
              	<div class="comment-form" style="margin-top: -65px;">
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row" >
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="name" id="name" type="text" :value="review_detail.id" >
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" name="date" id="date" type="text" :value="review_detail.dbday" >
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" name="subject" id="subject" type="text" :value="review_detail.subject" >
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9">
                              	{{review_detail.content}}
                              </textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn" @click="reviewUpdate(review_detail.no,review_detail.sno,false)">후기 작성</button>
                     </div>
                  </form>
               </div>
              </div>
              <!---------------------->
              <div class="navigation-area"><!--style="width: 1000px"-->
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="img/post/preview.png" alt="">
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>이전 캠핑장</p>
                              <a href="#">
                                 <h4>Space The Final Frontier</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>다음 캠핑장</p>
                              <a href="#">
                                 <h4>Telescopes 101</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="img/post/next.png" alt="">
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
            </div>
            
            
	            <div class="col-lg-2">
	               <div class="blog_right_sidebar" style="width: 400px;">
               		<aside class="single_sidebar_widget search_widget">
                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"type="submit" style="background-color:#E86A33;border-color: #E86A33;">예약하기</button>
                  	</aside>
	                  <aside class="single_sidebar_widget popular_post_widget">
	                     <h3 class="widget_title">Recent Post</h3>
	                     <div class="media post_item">
	                        <img src="img/post/post_1.png" alt="post">
	                        <div class="media-body">
	                           <a href="single-blog.html">
	                              <h3>From life was you fish...</h3>
	                           </a>
	                           <p>January 12, 2019</p>
	                        </div>
	                     </div>
	                  </aside>
	                  <aside class="single_sidebar_widget instagram_feeds">
	                     <h4 class="widget_title">Instagram Feeds</h4>
	                     <ul class="instagram_row flex-wrap">
	                        <li v-for="clist in cookie_list">
	                           <a href="#">
	                              <img class="img-fluid" :src="clist.image" alt="">
	                           </a>
	                        </li>
	                     </ul>
	                  </aside>
	               </div>
	            </div>
            
            
         </div>
      </div>
   </section>
   <!--================ Blog Area end =================-->
	<script>
		new Vue({
			el:'.blog_area',
			data:{
				camp_detail:{},
				cno:${cno},
				activeTab: 0,
			    tabs: [
				      { title: "주변 관광지", content: "Content for Tab 1" },
				      { title: "위치 보기", content: "Content for Tab 2" },
				      { title: "후기", content: "Content for Tab 3" }
				    ],
				tour_list:[],
				addr:'',
				cookie_list:[],
				review_list:[],
				curpage:1,
				totalpage:0,
				rcount:0,
				review_detail:{},
				isShow:false
			},
			mounted:function(){
				axios.get('../camp/camp_detail_vue.do',{
					params:{
						cno:this.cno
					}
				}).then(res=>{
					console.log(res.data)
					this.camp_detail=res.data
					this.tourShow(this.camp_detail.address)
					if(window.kakao && window.kakao.maps) {
		               this.initMap();
		            } else {
		               this.addScript();   
		               
		            }
					this.cookieShow();
					this.reviewList();
				})
				
				
				
				   
			},
			methods:{
				setActiveTab(index) {
			      	this.activeTab = index;
			    },
			    tourShow:function(addr){
			    	axios.get('../camp/tour_detail_vue.do',{
						params:{
							addr:addr
						}
					}).then(res=>{
						console.log(res.data)
						this.tour_list=res.data
					})
			    },
			    cookieShow:function(){
			    	axios.get('../camp/camp_cookie.do').then(res=>{
			    		console.log(res.data)
			    		this.cookie_list=res.data
			    	})
			    },
			    reviewList:function(){
			    	axios.get('../camp/camp_review_vue.do',{
			    			params:{
			    			page:this.curpage,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		console.log(res.data)
			    		this.review_list=res.data
			    	})
			    	
			    	axios.get('../camp/camp_review_page_vue.do',{
			    		params:{
			    			page:this.curpage,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		console.log(res.data)
			    		this.curpage=res.data.curpage;
						this.totalpage=res.data.totalpage
			    	})
			    	
			    	axios.get('../camp/camp_count_vue.do',{
			    		params:{
			    			page:this.curpage,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		console.log(res.data)
			    		this.rcount=res.data
			    	})
			    },
			    reviewDetail:function(no,cno,bool){
			    	this.isShow=bool;
					axios.get('../camp/camp_review_detail_vue.do',{
						params:{
							cno:cno,
							no:no
						}
					}).then(res=>{
						console.log(res.data)
						this.review_detail=res.data
						
						$('#dialog').dialog({
							autoOpen:false,
							modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
							width:700,
							height:500
						}).dialog("open")
					})			    	
			    },
			    reviewDelete:function(no,cno){
			    	axios.get('../camp/camp_review_delete_vue.do',{
						params:{
							cno:cno,
							no:no,
							page:this.curpage
						}
					}).then(res=>{
						alert('삭제되었습니다')
						this.review_list=res.data
						
					}).catch(error=>{
						  console.log(error.response)
					  })
			    },reviewUpdateDialog:function(no,cno,bool){
			    	
			    	this.isShow=bool;
			    	axios.get('../camp/camp_review_detail_vue.do',{
						params:{
							cno:cno,
							no:no
						}
					}).then(res=>{
						console.log(res.data)
						this.review_detail=res.data
						
			    	$('#dialogU').dialog({
						autoOpen:false,
						modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
						width:700,
						height:500
					}).dialog("open")
					})
					
			    },	
			    reviewUpdate:function(no,cno,bool){
			    	alert("cno:"+cno+"no:"+no)
			    	this.isShow=bool;
					
			    	let cont=$('#content').val()
			    	let sub=$('#subject').val()
					  axios.post('../camp/camp_review_update_vue.do',null,{
						  params:{
							  no:no,
							  cno:cno,
							  page:this.curpage,
							  content:cont,
							  subject:sub
								  
						  }
					  }).then(response=>{
						  console.log(response.data)
						  this.review_list=response.data
					  }).catch(error=>{
						  console.log(error.response)
					  })
				  },
			    initMap:function(){
		            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		             mapOption = {
		                 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		                 level: 3 // 지도의 확대 레벨
		             };  

		         // 지도를 생성합니다    
		         var map = new kakao.maps.Map(mapContainer, mapOption); 

		         // 주소-좌표 변환 객체를 생성합니다
		         var geocoder = new kakao.maps.services.Geocoder();
		         var name=this.camp_detail.name
		         // 주소로 좌표를 검색합니다
		         geocoder.addressSearch(this.camp_detail.address, function(result, status) {
		         
		             // 정상적으로 검색이 완료됐으면 
		              if (status === kakao.maps.services.Status.OK) {

		                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		                 // 결과값으로 받은 위치를 마커로 표시합니다
		                 var marker = new kakao.maps.Marker({
		                     map: map,
		                     position: coords
		                 });

		                 // 인포윈도우로 장소에 대한 설명을 표시합니다
		                 var infowindow = new kakao.maps.InfoWindow({
		                     content: '<div style="width:400px;text-align:center;padding:6px 0;">'+name+'</div>'
		                 });
		                 infowindow.open(map, marker);

		                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                 map.setCenter(coords);
		             } 
		         });    
		         },
		         
		         addScript(){
		            const script=document.createElement("script")
		            /* global kakao */
		            script.onload=()=>kakao.maps.load(this.initMap())
		            script.src='//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=c6fd98b724a1c5dfb4d7bfce05b0389f&libraries=services'
		            document.head.appendChild(script)
		         },
		         prev:function(){
					  this.curpage=this.curpage>1?this.curpage-1:this.curpage;
					  this.dataRecv()
				  },
				  next:function(){
					  this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
					  this.dataRecv()
				  }
			}
			
		})
	</script> 	
</body>
</html>