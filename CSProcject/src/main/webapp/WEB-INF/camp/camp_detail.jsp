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


.single-post-area .navigation-area {
  border: 1px solid #f0e9ff;
  padding-bottom: 30px;
  margin-top: 55px;
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
<!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post"><!--style="width: 1000px"-->
                  <div class="feature-img">
                     <img class="img-fluid" :src="camp_detail.image">
                  </div>
                  <div class="blog_details">
                     <h2>{{camp_detail.name}}</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="fa fa-location-arrow" style="color: #E86A33"></i>{{camp_detail.address}}</a></li>
                        <li><a href="#"><i class="fa fa-phone-square" style="color: #E86A33"></i>{{camp_detail.phone}}</a></li>
                     </ul>
                     <p class="excert">
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
				      		
				      			<div class="row" style="width: 1500px;display: flex;justify-content : center;">
						                <div class="col-lg-3 col-md-3" v-for="tvo in tour_list" style="border: 1px solid #f0e9ff;width: 400px;height: 500px;">
						                    <div class="single_place">
						                        <div class="place_info">
						                            <a :href="'../camp/camp_detail.do?cno='+vo.cno"><h3>{{tvo.name}}</h3></a>
						                           <i class="fa fa-location-arrow" style="color: #E86A33"></i>&nbsp;<span ref="addr">{{tvo.address}}</span>
						                            <div class="rating_days d-flex justify-content-between" style="margin-top: 8px;margin-bottom: -8px;">
						                            		<!--  추천,찜 등 -->
						                            </div>
						                        </div>
						                    </div>
						                </div>
						                <!--  page바 -->
						            <!-- <div class="row">
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
						            </div> -->
		        				</div>
		        				
							</template>
				      		<template v-if="index == 1">
					        	5678
					        	
							</template>
				      		<template v-if="index == 2">
					        	910
							</template>
				    	</div>
				  	</div>
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
            
            
	            <div class="col-lg-4">
	               <div class="blog_right_sidebar">
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
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
	                           </a>
	                        </li>
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
	                           </a>
	                        </li>
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
	                           </a>
	                        </li>
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
	                           </a>
	                        </li>
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
	                           </a>
	                        </li>
	                        <li>
	                           <a href="#">
	                              <img class="img-fluid" :src="camp_detail.image" alt="">
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
				tour_list:[]
			},
			mounted:function(){
				axios.get('../camp/camp_detail_vue.do',{
					params:{
						cno:this.cno
					}
				}).then(res=>{
					console.log(res.data)
					this.camp_detail=res.data
				}),
				
			},
			methods:{
				setActiveTab(index) {
			      	this.activeTab = index;
			    },
			    tourShow:function(){
			    	axios.get('../camp/tour_detail_vue.do',{
						params:{
							addr:this.$refs.addr.textContent
						}
					}).then(res=>{
						console.log(res.data)
						this.tour_list=res.data
					})
			    }
			}
			
		})
	</script> 	
</body>
</html>