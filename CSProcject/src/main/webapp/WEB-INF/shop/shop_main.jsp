<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampScape Shopping</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 

<style type="text/css">
.blog-pagination {
  margin-top: 80px;
}

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

<div class="shop_main">	
	<div class="where_togo_area" style="padding: 30px;">
	    <div class="container" style="margin: 0 auto;">
	    	<div class=row>
	         <div class="col-lg-3">
	             <div class="form_area">
	                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">Shop</h1>
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
                        <a v-for="c in shop_cate" class="genric-btn primary radius" @click="getList(c.cno)">{{c.cname}}</a>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6" v-for="(s, index) in shop_all" :key="index" v-if="index <= 12">
                    <div class="single_place">
                        <div class="thumb">
                            <img :src="s.image" alt="">
                        </div>
                        <div class="place_info">
                            <a :href="'../shop/shop_detail.do?sno='+s.sno"><h3>{{s.name}}</h3></a>
                            <p>{{s.brand}}</p>
                            <div class="rating_days d-flex justify-content-between">
<!--                                 <span class="d-flex justify-content-center align-items-center">
                                     <i class="fa fa-star"></i> 
                                     <i class="fa fa-star"></i> 
                                     <i class="fa fa-star"></i> 
                                     <i class="fa fa-star"></i> 
                                     <i class="fa fa-star"></i>
                                     <a href="#">(20 Review)</a>
                                </span> -->
                                <div class="days">
                                    <i class="fa fa-clock-o"></i>
                                    <a href="#" class="prise">{{s.price.toLocaleString()}}원</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>    

 <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item" v-if="startPage>1">
                                    <a href="#" class="page-link" aria-label="Previous" @click="prev()">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li v-for="page in range(startPage,endPage)" :class="page==curpage?'page-item active':'page-item'">
                                    <a href="#" class="page-link" @click="pageChange(page)">{{page}}</a>
                                </li>
                                <li class="page-item" v-if="endPage<totalpage">
                                    <a href="#" class="page-link" aria-label="Next" @click="next()">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>

<script>

   new Vue({
      el:'.shop_main',
      data:{
         shop_cate:[],
         shop_all:[],
         page_list:{},
         curpage:1,
         totalpage:0,
         startPage:0,
         endPage:0
      },
      mounted: function(){
         axios.get('../shop/shop_cateList_vue.do')
            .then(res => {
         /*       console.log(res.data) */
               this.shop_cate = res.data;
            }).catch(error => {
               console.error(error);
            });
         this.getList(1)
      },
      methods: {
         getList(cno) {
            axios.get('../shop/shop_cateAllList_vue.do',{
               params:{
                  cno: cno,
                  page:this.curpage
               }
            }).then(res => {
                  /* console.log(res.data) */
                  this.shop_all = res.data;
               }).catch(error => {
                  console.error(error);
               })
            
            // 페이지
            axios.get('../shop/page_list_vue.do',{
            	params:{
            		page:this.curpage,
            		cno:cno
            	}
            }).then(res=>{
            	/* console.log(res.data) */
            	this.page_list=res.data
				this.curpage=this.page_list.curpage
				this.totalpage=this.page_list.totalpage
				this.startPage=this.page_list.startPage
				this.endPage=this.page_list.endPage				
            }).catch(error=>{
            	console.log(error)
            })
         },
         range(start,end){
        	 let arr=[];
        	 for(let i=start;i<end;i++) {
        		 arr.push(i);
        	 }
        	 return arr;
         },
         pageChange(page){
             this.curpage = page;
             this.getList(this.curpage);
          },
          prev(){
             this.curpage = this.startPage - 1;
             this.getList(this.curpage);
          },
          next(){
             this.curpage = this.endPage + 1;
             this.getList(this.curpage);
          }
      }
   })

</script>


</body>
</html>