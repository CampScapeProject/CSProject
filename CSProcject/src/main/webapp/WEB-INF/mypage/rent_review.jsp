<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
<div class="el">
	<div class=row style="padding-top: 40px;padding-left: 20px;margin-bottom: 30px;">
		<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
			<h3 style="margin: 0">내가 작성한 리뷰</h3>
		</div>
		
		<div class="col-lg-12">
			
			<div class="section-top-border" style="padding: 20px 0;">
				<div class="progress-table-wrap" style="overflow:hidden;">
					<div class="progress-table" style="background-color: white;">
					
						<div class="table-head">
							<div class="serial"></div>
							<div class="visit">차량명</div>
							<div class="percentage">내용</div>
							<div class="serial text-left">평점</div>
							<div class="visit text-left">작성날짜</div>
						</div>
						
						<div class="table-row" v-for="vo in review_list">
							<div class="serial">
								<img :src="vo.image" style="width: 70px;height: 60px;">
							</div>
							<div class="visit">{{vo.car_name}}</div>
							<div class="percentage">{{vo.content}}</div>
							<div class="serial">{{vo.rating}}</div>
							<div class="visit">{{vo.dbday}}</div>
						</div>
						
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<script>
	new Vue({
		el:'.el',
		data:{
			curpage:1,
			review_list:[]
		},
		mounted:function(){
			axios.get('../rent/review_list_vue.do',{
				params:{
					id:'${sessionScope.id}',
					curpage:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.review_list=res.data
			})
		}
	})
</script>

</body>
</html>