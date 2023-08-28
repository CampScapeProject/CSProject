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
                     <img class="img-fluid" :src="camp_detail.image" style="width: 900px;height: 500px">
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
                     <p class="like-info"><span class="align-middle"><i class="fa-solid fa-house"></i></span>총 <span style="color: orange">{{camp_detail.hit}}</span>명이 조회하였습니다</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons" v-if="jjimCount==0">
                     	<i class="fa-regular fa-heart" @click="jjimInsert()"></i>&nbsp;찜하기
                     </ul>
                     <ul class="social-icons" v-if="jjimCount==1">
                     	<i class="fa-solid fa-heart" style="color: red;" @click="jjimDelete()"></i>&nbsp;찜하기
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
										<li class="card" style="width: 200px;">
											<a class="card-image" href="#">
												<img :src="fvo.image" style="width: 100%;height: 130px">
											</a>
											<a class="card-description" target="_blank" style="cursor: default;">
												<span style="text-align: center;">{{fvo.name}}</span>
											</a>
											<a class="card-description" :href="fvo.link" target="_blank" style="margin-top: -20px">
												<span style="font-size: 10px;text-align: center;">사이트 보기</span>
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
					        		<h4 style="color:#001D38;font-weight: bold;">&nbsp;리뷰({{rcount}})</h4>
									<div class="campprogress-table-wrap" style="margin-top: -20px;">
										<div class="campprogress-table">
											<div class="table-head">
												<div class="serial">번호</div>
												<div class="visit">제목</div>
												<div class="visit">이름</div>
												<div class="visit">작성날짜</div>
												<div class="serial">조회수</div>
												<div class="visit"></div>
											</div>
											<div class="table-row" v-for="rvo,index in review_list">
												<div class="serial">{{index+1}}</div>
												<div class="visit"><a @click="reviewDetail(rvo.no,true)">{{rvo.subject}}</a></div>
												<div class="visit">{{rvo.id}}</div>
												<div class="visit">{{rvo.dbday}}</div>
												<div class="serial">{{rvo.hit}}</div>
												<div class="visit">
													<button class="btn btn-xs btn-link" style="font-size: 15px;margin-right: 15px;" @click="reviewUpdateDialog(rvo.no,true)">수정</button>
          											<button class="btn btn-xs btn-link" @click="reviewDelete(rvo.no)" style="font-size: 15px;cursor:pointer;">삭제</buton>
												</div>
											</div>
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
              
              
              <!-- 리뷰 디테일 -->
              
              <div id="dialog" title="후기글" v-if="rDetailShow" style="background-color: #EEEEEE;">
              	<div class="comment-form" style="margin-top: -55px;">
                     <div class="row" >
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control"  type="text" :value="review_detail.id" readonly>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control"  type="text" :value="review_detail.dbday" readonly>
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control"  type="text" :value="review_detail.subject" readonly>
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100"  cols="30" rows="9" readonly>
                              	{{review_detail.content}}
                              </textarea>
                           </div>
                        </div>
                     </div>
               </div>
              </div>
              
              <!-- 리뷰 수정 -->
              <div id="dialogU" title="후기글 수정" v-if="rUpShow" style="background-color: #EEEEEE;">
              	<div class="comment-form" style="margin-top: -65px;">
                  <form @submit.prevent="updateForm()">
                     <div class="row" >
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" ref="id" type="text" :value="update_data.id" readonly>
                              <input type="hidden" ref="no" :value="update_data.no"> 
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <div class="form-group">
                              <input class="form-control" ref="date" type="text" :value="update_data.dbday" readonly>
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <input class="form-control" ref=subject v-model=subject type="text">
                           </div>
                        </div>
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" ref=content v-model=content cols="30" rows="9">
                              	{{content}}
                              </textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">수정</button>
                     </div>
                  </form>
               </div>
              </div>
              
              <!--  예약 객식-->
              <div id="dialogReserve" :title="camp_detail.name+' 예약'" v-if="resShow" style="padding: 0px;overflow-y:auto;background-color: #EEEEEE;">
              
              <div class="popular_destination_area" style="padding: 0px" v-if="!reserveForm">
        		<div class="container">
	              	<div>
	                  <div class="row">
		                <div class="col-lg-12 col-md-12" v-for="cs in campsite_list" style="padding: 0px">
		                    <div class="single_destination" style="width:100%;height: 290px;cursor: pointer;">
		                        <div class="thumb">
		                           <img :src="cs.image" style="width: 100%">
		                        </div>
		                        <div class="content">
		                            <p class="d-flex align-items-center" >{{cs.name}}<a href="#" class="mPrice">{{cs.price}}&nbsp;원</a></p>
		                            <p style="font-size: 15px;">최대&nbsp;{{cs.inwon}}인<button type="button" @click="reserveGo(cs.csno)" class="button button-contactForm btn_1 boxed-btn" style="margin-left: 250px;height: 60px;background-color:#001D38;border:1px solid #001D38 ">예약하기</button></p>
		                        </div>
		                            
		                    </div>
		                </div>
	           		 </div>
	               </div>
              </div>
             </div>
             
             <!--  예약 폼 -->
          	<div class="destination_details_info" v-if="reserveForm" style="padding: 0px;margin-top: -40px;background-color: #EEEEEE;">
          		<div class="container">
			          		<div class="row" style="background-color: white;">
			          			<div class="col-lg-12 text-center">
			                   <a href="../main/home.do">
			                       <img src="../layout/img/logo.png">
			                   </a>
			                   </div>
			               </div>
			               <br>
         					<section>
         					  <div class="row justify-content-center" style="background-color: white;">
			                <div class="col-lg-8 col-md-9">
			                	<div class="contact_join" style="margin-top: 20px;margin-bottom: 20px">
         						<h4><i class="fa-solid fa-house"></i>&nbsp;{{camp_detail.name}}</h4>
		                            	<p>{{campsite_detail.name}}</p>
		                            	<br>
		                            	<div class="row">
			                            	<div class="col-lg-6" style="border: 1px solid gray">
			                                    <div class="single_input">
			                                    	<label><i class="fa-regular fa-calendar-check"></i>&nbsp;입실일</label>	
			                                    	<h4>{{sdate}}</h4>
			                                    </div>
			                                 </div>
			                                <div class="col-lg-6" style="border: 1px solid gray">
			                                    <div class="single_input">
			                                    	<label><i class="fa-regular fa-calendar-minus"></i>&nbsp;퇴실일</label>
			                                    	<h4>{{edate}}</h4>
			                                    </div>
			                                </div>
		                            	</div>
		                    		</div>
		                   		 </div>
		                    </div>
         					</section>
         					<br>
			        	<section>
			        	<form @submit.prevent="reserveOk">
			        	 <div class="row justify-content-center" style="background-color: white;">
			                <div class="col-lg-8 col-md-9">
			                	<div class="contact_join" style="margin-top: 20px;margin-bottom: 20px">
         						<h4>예약 인원 수</h4>
         						<p>*최대 인원 {{campsite_detail.inwon}}명</p>
		                            	<br>
	                            	<div class="row"> 
	                           			<div class="col-lg-12">
	                            			<div class="option">
									          <div>
									            <span><i class="fa-solid fa-user"></i></span>
									            <select ref="inwon">
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
									            </select>
									            <span>명</span>
									          </div>
				                            </div>
	                            		</div>
		                    		</div>
		                   		 </div>
		                    </div>
		                    </div>
		                    <br>
			            <div class="row justify-content-center" style="background-color: white;">
			                <div class="col-lg-8 col-md-9">
			                	<div class="contact_join" style="margin-top: 20px;margin-bottom: 20px">
			                        <h3>예약 정보</h3>
			                            <div class="row">
			                                <div class="col-lg-6">
			                                    <div class="single_input">
			                                    	<label>이름</label>
			                                       <input type="text" v-model="name" ref="name">
			                                       <input type="hidden" :value="campsite_detail.csno" ref="csno">
			                                       <input type="hidden" :value="cno" ref="cno">
			                                    </div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="single_input">
			                                   		<label>연락처</label>
			                                        <input type="text" v-model="phone" ref="phone">
			                                    </div>
			                                </div>
			                                <div class="col-lg-8">
			                                    <div class="single_input">
			                                    	<label>이메일</label>
			                                        <input type="email" v-model="email" ref="email">
			                                    </div>
			                                </div>
			                                <div class="col-lg-12">
			                                    <div class="single_input">
			                                    	<label>요청사항</label>
			                                        <textarea v-model="msg" cols="30" rows="10" ref="msg"></textarea>
			                                    </div>
			                                </div>
			                            </div>
			                        
			                    </div>
							</div>
						</div>
							<div class="col-lg-12" >
                           <div class="submit_btn" style="width: 100%;	">
                               <button class="boxed-btn4" type="submit" style="width: 100%">예약하기 | {{csprice*dateCount}}원</button>
                           </div>
                       </div>
						 </form>
					</section> 
					</div>
				</div> 
	          </div>
             <!-- ------------------------------ -->
             
              <div class="navigation-area">
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
                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="button" @click="reserveList(true)" style="background-color:#001D38;border: 1px solid #001D38;">예약하기</button>
                  	</aside>
	                  <aside class="single_sidebar_widget popular_post_widget">
	                     <h3 class="widget_title">최근 본 캠핑장</h3>
	                     <div class="media post_item"  v-for="c in cookie_list">
	                        <img :src="c.image.split('^')[0]" alt="post" style="width: 100px;height:100px">
	                        <div class="media-body">
	                           <a href="single-blog.html">
	                              <h3>{{c.name}}</h3>
	                           </a>
	                           <p>{{c.address}}</p>
	                        </div>
	                     </div>
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
				sdate:'${sdate}',
				edate:'${edate}',
				id:'${id}',
				name:'${name}',
				email:'${email}',
				phone:'${phone}',
				msg:'',
				no:0,
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
				rDetailShow:false,
				rUpShow:false,
				resShow:false,
				subject:'',
				content:'',
				update_data:{},
				campsite_list:[],
				campsite_detail:{},
				reserveForm:false,
				dateCount:${dateCount},
				csprice:0,
				jjimCount:0
			},
			mounted:function(){
				this.dataRecive();
			},
			methods:{
				dataRecive:function(){
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
						
						this.reviewList();
						this.jjimCountData();
					})
					this.cookieShow();
				},
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
			    reviewDetail:function(no,bool){
			    	this.rDetailShow=bool;
					axios.get('../camp/camp_review_detail_vue.do',{
						params:{
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
			    reviewDelete:function(no){
			    	axios.get('../camp/camp_review_delete_vue.do',{
						params:{
							no:no,
							cno:this.cno,
							page:this.curpage
						}
					}).then(res=>{
						
						let check=res.data
						if(check==="OK")
						{
							alert('삭제되었습니다')	
							location.href='../camp/camp_detail.do?cno='+this.cno
						}
						
						
					}).catch(error=>{
						  console.log(error.response)
					  })
			    },
			    reviewUpdateDialog:function(no,bool){
			    	this.rUpShow=bool;
			    	axios.get('../camp/camp_review_update_data_vue.do',{
						params:{
							no:no
						}
					}).then(res=>{
						console.log(res.data)
						this.update_data=res.data
						this.subject=res.data.subject
						this.content=res.data.content
						this.no=res.data.no
						
			    	$('#dialogU').dialog({
						autoOpen:false,
						modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
						width:700,
						height:500
					}).dialog("open")
					})	    	
			    },
			    updateForm:function(){
					
				   if(this.subject=="")
				   {
					   this.$refs.subject.focus();
					   return;
				   }
				   if(this.content=="")
				   {
					   this.$refs.content.focus();
					   return;
				   }
				   
				   let form=new FormData();
				   form.append("subject",this.subject);
				   form.append("content",this.content);
				   form.append("no",this.$refs.no.value)
				   form.append("page",this.curpage)
				   form.append("cno",this.cno)
					
					 axios.post('../camp/camp_review_update_vue.do',form).then(response=>{
						  console.log(response.data)
						  alert('수정 되었습니다')
						  this.review_list=response.data
						  location.href='../camp/camp_detail.do?cno='+this.cno
					  }).catch(error=>{
						  console.log(error.response)
					  })
					
			    },
			    reserveList:function(bool){
			    		this.resShow=bool;
			    		this.reserveForm=false;
			    		
						axios.get('../camp/campsite_list.do',{
							params:{
								cno:this.cno
							}
						}).then(res=>{
							console.log(res.data)
							this.campsite_list=res.data
							
							$('#dialogReserve').dialog({
								autoOpen:false,
								modal:true, //다이어로그 실행중에는 다른 것은 실행 안되게
								width:600,
								height:800
							}).dialog("open")
						})		    	
			    },
			    reserveGo:function(no){
			    	this.reserveForm=true;
			    	axios.get('../camp/campsite_detail_vue.do',{
			    		params:{
			    			csno:no
			    		}
			    	}).then(res=>{
			    		this.campsite_detail=res.data
			    		this.csprice=this.campsite_detail.dbprice
			    	})
			    },
			    reserveOk:function(){
			    	
			    	
		    		if(this.name=="")
				   {
					   this.$refs.name.focus();
					   return;
				   }
				   if(this.email=="")
				   {
					   this.$refs.email.focus();
					   return;
				   }
				   if(this.msg=="")
				   {
					   this.$refs.msg.focus();
					   return;
				   } 
				   if(this.phone=="")
				   {
					   this.$refs.phone.focus();
					   return;
				   }
					   
					   let form=new FormData();
					   form.append("name",this.name);
					   form.append("id",this.id);
					   form.append("email",this.email);
					   form.append("msg",this.msg)
					   form.append("phone",this.phone)  
					   form.append("csno",this.$refs.csno.value)
					   form.append("fno",this.cno)
					   form.append("inwon",this.$refs.inwon.value)
					   form.append("dbsdate",this.sdate)
					   form.append("dbedate",this.edate)
					   form.append("price",this.csprice*this.dateCount)
					   form.append("page",1)
						
						 axios.post('../camp/camp_reserve_ok_vue.do',form).then(res=>{
							 	let rcheck=res.data
							 	if(rcheck==="OK")
							 	{
									location.href="../camp/camp_main.do"
									alert('예약이 완료되었습니다')
							 	}else{
							 		alert('예약을 다시 해주세요')
							 	}
								
						  }).catch(error=>{
							  console.log(error.response)
						  })
			    },
			    jjimInsert:function(){
			    	if(${sessionScope.id==null}){
						alert("로그인 후 사용 가능합니다.")
						return;
					}
			    	axios.get('../camp/camp_jjim_insert.do',{
			    		params:{
			    			id:this.id,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		this.jjimCount=res.data.jjimCount
			    		this.dataRecive();
			    	})
			    },
			    jjimDelete:function(){
			    	axios.get('../camp/camp_jjim_delete.do',{
			    		params:{
			    			id:this.id,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		this.jjimCount=res.data.jjimCount
			    		this.dataRecive();
			    	})
			    },
			    jjimCountData:function(){
			    	axios.get('../camp/camp_jjim_count.do',{
			    		params:{
			    			id:this.id,
			    			cno:this.cno
			    		}
			    	}).then(res=>{
			    		this.jjimCount=res.data.jjimCount
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
		                     content: '<div style="width:150px;text-align:center;padding:6px 5px;">'+name+'</div>'
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