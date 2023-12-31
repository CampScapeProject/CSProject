<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 정보</title>

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<style type="text/css">
/* body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
} */

.clearfix {
  content: "";
  display: table;
  clear: both;	
}

#site-header h1 {
	font-size: 31px;
	font-weight: 300;
	padding: 28px 0;
	position: relative;
	margin: 0;
	text-align: left;
}

a {
	color: #000;
	text-decoration: none;

	-webkit-transition: color .2s linear;
	-moz-transition: color .2s linear;
	-ms-transition: color .2s linear;
	-o-transition: color .2s linear;
	transition: color .2s linear;
}

a:hover {
	color: #53b5aa;
}

#site-header h1 span {
	color: #53b5aa;
}

#site-header h1 span.last-span {
	background: #fff;
	padding-right: 150px;
	position: absolute;
	left: 217px;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

#site-header h1:hover span.last-span, #site-header h1 span.is-open {
	left: 363px;
}

#site-header h1 em {
	font-size: 16px;
	font-style: normal;
	vertical-align: middle;
}

.container {
	font-family: 'Open Sans', sans-serif;
	margin: 0 auto;
	width: 980px;
}

#cart {
	width: 100%;
}

#cart h1 {
	font-weight: 300;
}

#cart a {
	color: #53b5aa;
	text-decoration: none;

	-webkit-transition: color .2s linear;
	-moz-transition: color .2s linear;
	-ms-transition: color .2s linear;
	-o-transition: color .2s linear;
	transition: color .2s linear;
}

#cart a:hover {
	color: #000;
}

.product.removed {
	margin-left: 980px !important;
	opacity: 0;
}

.product {
	border: 1px solid #eee;
	margin: 20px 0;
	width: 100%;
	height: 195px;
	position: relative;

	-webkit-transition: margin .2s linear, opacity .2s linear;
	-moz-transition: margin .2s linear, opacity .2s linear;
	-ms-transition: margin .2s linear, opacity .2s linear;
	-o-transition: margin .2s linear, opacity .2s linear;
	transition: margin .2s linear, opacity .2s linear;
}

.product img {
	width: 100%;
	height: 100%;
}

.product header, .product .content {
	background-color: #eee;
	border: 1px solid #ccc;
	border-style: none none solid none;
	float: left;
}

.product header {
	background: #000;
	margin: 0 1% 20px 0;
	overflow: hidden;
	padding: 0;
	position: relative;
	width: 24%;
	height: 195px;
}

.product header:hover img {
	opacity: .7;
}

.product header:hover h3 {
	bottom: 73px;
}

.product header h3 {
	background: #53b5aa;
	color: #fff;
	font-size: 22px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;
	position: absolute;
	bottom: -50px;
	right: 0;
	left: 0;

	-webkit-transition: bottom .2s linear;
	-moz-transition: bottom .2s linear;
	-ms-transition: bottom .2s linear;
	-o-transition: bottom .2s linear;
	transition: bottom .2s linear;
}

.remove {
	cursor: pointer;
}

.product .content {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 140px;
	padding: 0 20px;
	width: 75%;
}

.product h1 {
	color: #53b5aa;
	font-size: 25px;
	font-weight: 300;
	margin: 17px 0 20px 0;
}

.product footer.content {
	height: 50px;
	margin: 6px 0 0 0;
	padding: 0;
}

.product footer .price {
	background: #fcfcfc;
	color: #000;
	float: right;
	font-size: 15px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;
}

.product footer .full-price {
	background: #53b5aa;
	color: #fff;
	float: right;
	font-size: 22px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;

	-webkit-transition: margin .15s linear;
	-moz-transition: margin .15s linear;
	-ms-transition: margin .15s linear;
	-o-transition: margin .15s linear;
	transition: margin .15s linear;
}

#site-footer {
	margin: 30px 0 0 0;
}

#site-footer {
	padding: 40px;
}

#site-footer h1 {
	background: #fcfcfc;
	border: 1px solid #ccc;
	border-style: none none solid none;
	font-size: 24px;
	font-weight: 300;
	margin: 0 0 7px 0;
	padding: 14px 40px;
	text-align: center;
}

#site-footer h2 {
	font-size: 24px;
	font-weight: 300;
	margin: 10px 0 0 0;
}

#site-footer h3 {
	font-size: 19px;
	font-weight: 300;
	margin: 15px 0;
}

.left {
	float: left;
}

.right {
	float: right;
}

.btn {
	background: #53b5aa;
	border: 1px solid #999;
	border-style: none none solid none;
	cursor: pointer;
	display: block;
	color: #fff;
	font-size: 20px;
	font-weight: 300;
	padding: 16px 0;
	width: 290px;
	text-align: center;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

.btn:hover {
	color: #fff;
	background: #429188;
}

.type {
	background: #fcfcfc;
	font-size: 13px;
	padding: 10px 16px;
	left: 100%;
}

.type, .color {
	border: 1px solid #ccc;
	border-style: none none solid none;
	position: absolute;
}

.color {
	width: 40px;
	height: 40px;
	right: -40px;
}

.red {
	background: #cb5a5e;
}

.yellow {
	background: #f1c40f;
}

.blue {
	background: #3598dc;
}

.minused {
	margin: 0 50px 0 0 !important;
}

.added {
	margin: 0 -50px 0 0 !important;
}

#footer_price {
	text-align: right;
    font-size: 22px;
}
#cateName{
    border: 1px solid;
    padding: 12px;
    border-radius: 12px;
    color: white;
    background: #53b5aa;
}
</style>

<body>

	  <header id="Bheader" class="container">
	    <h1>Product Manager</h1>
	    <ul class="breadcrumb">
	      <li>AdminPage</li>
	      <li>물품 정보</li>
	    </ul>
	  </header>
<div class="shop_admin" style="padding-top: 40px;padding-left: 20px;">

	<header id="site-header">
        <div class="row justify-content-center">
            <div class="col-lg-11">
                <div class="section_title text-center mb_70">
                    <div class="button-container">
	                    <a v-for="c in shop_cate" @click="getList(c.cateno)" style="margin:5px;border:none" id="cateName">{{c.cname}}</a>
                    </div>
                </div>
            </div>
        </div>
	</header>

	<div class="container">
		<div style="text-align:right">
		    <input type="button" value="검색" @click="findData()">
		    <input type="text" placeholder="이름으로 검색하세요." size=30 v-model="productName" @keyup.enter="findData()">
		</div>    
		<section id="cart"> 
			<article class="product" v-for="(s, index) in shop_all" :key="index" v-if="index <= 12">
				<header>
					<a class="remove">
						<img :src="s.image">
						<h3 @click="deleteProduct(s.sno)">Remove product</h3>
					</a>
				</header>
					<div class="content">
						<h1>{{s.brand}}</h1>
						{{s.name}}
					</div>
	
					<footer class="content">
						<span id="footer_price">가격 : {{s.price.toLocaleString()}}원</span>
						<h2 class="full-price">
							<a :href="'../adminpage/shop_update.do?sno='+s.sno" style="color:white">수정</a>
						</h2>
					</footer>
			</article>
		</section>
	</div>
	
	 <nav class="blog-pagination justify-content-center d-flex" style="margin-top:40px;margin-bottom:40px">
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

<script>

	
 new Vue({
	el:'.shop_admin',
	data:{
		productName:'',
        shop_cate:[],
        shop_all:[],
        page_list:{},
        curpage:1,
        totalpage:0,
        startpage:0,
        endpage:0,
        curCate:1,
        fd:''
	},
    mounted: function(){
    	this.productList()
     },
     methods: {
    	productList(){
    		axios.get('../shop/shop_cateList_vue.do')
            .then(res => {
               this.shop_cate = res.data;
            }).catch(error => {
               console.error(error);
            });
         this.getList(1)
    	}, 
    	findData(){
    		this.getList(this.curCate)
    	},
    	deleteProduct(sno) {
    		axios.get('../adminpage/product_delete_vue.do',{
    			params:{
    				sno:sno
    			}
    		}).then(res=>{
    			if(res.data==='ok') {
    				alert('삭제가 완료되었습니다.')
    				location.href='../adminpage/shop_goods.do';
    			}
    		})
    	},
        getList(cateno) {
           axios.get('../shop/shop_cateAllList_vue.do',{
              params:{
                 cateno:cateno,
                 page:this.curpage,
                 fd:this.productName
              }
           }).then(res => {
        	   /* console.log(res.data) */
                 this.shop_all = res.data;
        	   	 this.curCate=cateno
              }).catch(error => {
                 console.error(error);
              })

           axios.get('../shop/page_list_vue.do',{
	           params:{
	           		page:this.curpage,
	           		cateno:cateno,
	           		fd:this.productName
	           }
           }).then(res=>{
           		this.page_list=res.data
				this.curpage=this.page_list.curpage
				this.totalpage=this.page_list.totalpage
				this.startpage=this.page_list.startpage
				this.endpage=this.page_list.endpage				
           }).catch(error=>{
           	console.log(error)
           })
        },
        range(start,end){
	       	let arr=[];
	       	let length=end-start
		       	for(let i=0;i<=length;i++) {
		       		 arr[i]=start
		       		 start++;
		       	}
	        return arr;
        },
        pageChange(page){
            this.curpage = page;
            this.getList(this.curpage);
        },
        prev(){
	        this.curpage = this.startpage - 1;
	        this.getList(this.curpage);
        },
        next(){
            this.curpage = this.endpage + 1;
            this.getList(this.curpage);
        }
     }
 })
 
</script>
</body>
</html>