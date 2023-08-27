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

<style type="text/css">
	.page{
		cursor: pointer;
	}
	.activePage{
		font-weight: bold;
	}
	.update:hover{
		cursor: pointer;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="el">

	
	<div class=row style="padding-top: 40px;padding-left: 20px;padding-bottom: 150px;">
		<div v-show="show">
			<div class="col-lg-12 text-left" style="margin-bottom: 20px;">
				<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;">렌터카 목록</span>
			</div>
			
			<div class="col-lg-6 text-left" style="margin-bottom: 10px;">
				<input type="text" placeholder="차량명을 입력하세요" v-model="fd" @keyup.enter="findData()">
				<input type="button" value="검색" @click="findData()">
			</div>
			<div class="col-lg-6 text-right" style="margin-bottom: 10px;">
				<input type="button" value="차량등록" @click="showChange()">
			</div>
			
			<div class="col-lg-12">
				
				<div class="section-top-border" style="padding: 0;">
					<div class="progress-table-wrap" style="overflow:hidden;">
						<div class="progress-table" style="background-color: white;padding-bottom: 5px">
						
							<div class="table-head">
								<div class="serial"></div>
								<div class="visit">차량명</div>
								<div class="serial text-left">브랜드</div>
								<div class="visit text-left">차종</div>
								<div class="serial text-left">최대인원</div>
								<div class="serial text-left">연료</div>
								<div class="serial text-left">가격</div>
							</div>
							
							<div class="table-row" v-for="vo,index in rent_list">
								<div class="serial">
									<img :src="vo.image" width="65px" height="55px">
								</div>
								<div class="visit"><span @click="updateForm(index)" class="update">{{vo.car_name}}</span></div>
								<div class="serial">{{vo.maker}}</div>
								<div class="visit">{{vo.car_type}}</div>
								<div class="serial">{{vo.inwon}}</div>
								<div class="serial">{{vo.fuel}}</div>
								<div class="serial">{{vo.price}}</div>
							</div>
							
						</div>
					</div>
				</div>
				
			</div>
	   		<div class="col-lg-12 text-center" style="color: #E86A33;margin-top: 10px;font-size: 18px;">
	   			<span class="page" @click="prev()" v-if="startpage>1">&lt;</span>&nbsp;
	   			<span class="page" 
	   				:class="curpage==(startpage+i-1)?'activePage':''" 
	   			 	v-for="i in (endpage-startpage+1)"
	   				@click="pageSelect((startpage+i-1))"
	   			>
	   				{{startpage+i-1}}&nbsp;
	   			</span>
	   			<span class="page" @click="next()" v-if="totalpage>endpage">&gt;</span>&nbsp;
	   		</div>
   		</div>
   		
   		<div v-show="show==false">
   			<!-- 차량 등록 칸 -->
	   		<div class="col-lg-12" style="padding: 30px">
	   			<div class="text-left">
	   			<span style="font-size: 22px; font-weight:bold; margin-bottom: 10px;" id="subTitle">차량 등록</span>
	   			</div>
	   			
	   			<form @submit.prevent="submitForm">
	   				<div class="col-lg-4 text-left" style="padding:30px;">
	   					<div style="width: 320px; height: 280px; background-color: white;  display: grid;place-items: center;border:1px solid black;">
								<input type="file" id="chooseFile" name="chooseFile" accept="image/*"  ref="image"
									@change="getFileName($event.target.files)" style="display: none;"
								>
								<label for="chooseFile" style="width: 20%;height: 20%;margin: 0 " id="previewLabel">
								    <img id="preview" src="../layout/img/imgUpload.png" style="width: 100%;height: 100%;">
								</label>
	   					</div>
	   					<div style="height: 5px;"></div>
						<span id="filename"></span>
	   				</div>
	   				
	   				<div class="col-lg-8 text-right" style="padding:30px;">
	   					<table class="table">
	   						<tr>
		   						<th class="text-center" width=15%>차량명</th>
		   						<td width=85%>
		   							<input type=text ref="car_name" v-model="car_name" style="width: 250px" class="input-sm form-control">
		   							<input type="hidden" ref="rno" name="rno" v-model="rno">
		   						</td>
	   						</tr>
	   						<tr>
		   						<th class="text-center" width=15%>차종</th>
		   						<td width=85%>
		   							<input type=text ref="car_type" v-model="car_type" style="width: 100px" class="input-sm form-control">
		   						</td>
	   						</tr>
	   						<tr>
		   						<th class="text-center" width=15%>브랜드</th>
		   						<td width=85%>
		   							<input type=text ref="maker" v-model="maker" style="width: 100px" class="input-sm form-control">
		   						</td>
	   						</tr>
	   						<tr>
		   						<th class="text-center" width=15%>최대인원</th>
		   						<td width=85%>
		   							<input type=number min="0" ref="inwon" v-model="inwon" style="width: 100px" class="input-sm form-control">
		   						</td>
	   						</tr>
	   						<tr>
		   						<th class="text-center" width=15%>연료</th>
		   						<td width=85% class="text-left">
									<select v-model="fuel" style="width: 70px;height: 25px">
										<option value="휘발유">휘발유</option>
										<option value="경유">경유</option>
										<option value="LPG">LPG</option>
										<option value="전기차">전기차</option>
									</select>
		   						</td>
	   						</tr>
	   						<tr>
		   						<th class="text-center" width=15%>가격</th>
		   						<td width=85%>
		   							<input type=text ref="price" v-model="price" style="width: 100px" class="input-sm form-control">
		   						</td>
	   						</tr>
	   						<tr>
	   							<th colspan=2>
	   								<div class=row>
	   									<div class="col-lg-8 text-left" >
	   										차량 옵션
	   									</div>
	   									<div class="col-lg-4 text-right" style="font-size: 20px;">
	   										<i class="fa-solid fa-plus" @click="addOptionInput" style="cursor: pointer;"></i> 
	   										<i class="fa-solid fa-minus" @click="removeOptionInput" style="cursor: pointer;"></i>
	   									</div>
	   									
	   									<div class="col-lg-12" style="margin-top: 10px">
	   										<div class=row>
			   									<div
										            v-for="(input, index) in optionInputs"
										            :key="index"
										            class="col-lg-3"
										            style="padding: 0 5px; margin-bottom: 5px"
										        >
			   										· <input type=text style="width: 70%;text-align: right" v-model="input.value">
			   										<input type="button" style="width: 16%;" value="-" @click="removeInput(index)" />
			   									</div>
	   										</div>
	   									</div>
	   									
	   								</div>
	   							</th>
	   						</tr>
	   					</table>
	   				</div>
	   				<div class="col-lg-12">
	   					<span v-show="insert_update"><input type="button" value="등록" class="btn btn-default btn-lg" @click="insertBtn()">&nbsp;</span>
	   					<span v-show="insert_update==false"><input type="button" value="수정" class="btn btn-default btn-lg" @click="updateBtn()">&nbsp;</span>
	   					<input type="button" value="취소" class="btn btn-default btn-lg" @click="showChange()">
	   				</div>
	   			</form>
	   		</div>
   		</div>
   		
	</div>
	
</div>

<script>


	new Vue({
		el:'.el',
		data:{
			rno:0,
			show:true,
			insert_update:true,
			curpage:1,
			fd:'',
			rent_list:[],
			totalpage:0,
			startpage:0,
			endpage:0,
			fileName:'',
			car_name:'',
			car_type:'',
			maker:'',
			inwon:0,
			fuel:'휘발유',
			price:'',
			car_option:'',
			optionInputs: [{value:""}],
			
		},
		mounted:function(){
			this.listData()
		},
		methods:{
			listData(){
				axios.get('../rent/admin_rent_list_vue.do',{
					params:{
						curpage:this.curpage,
						fd:this.fd
					}
				}).then(res=>{
					console.log(res.data)
					this.rent_list=res.data.list
					this.totalpage=res.data.totalpage
					this.startpage=res.data.startpage
					this.endpage=res.data.endpage
				})
			},
		    pageSelect(page){
		    	this.curpage=page
		    	this.listData()
		    },
		    prev(){
		    	this.curpage=this.startpage-1
		    	this.listData()
		    },
		    next(){
		    	this.curpage=this.endpage+1
		    	this.listData()
		    },
		    findData(){
		    	this.curpage=1;
		    	this.listData()
		    },
		    //차량옵션
		    addOptionInput() {
		        this.optionInputs.push({value:""});
		    },
		    removeOptionInput() {
		        if (this.optionInputs.length > 1) {
		           	this.optionInputs.pop();
		        }
		    },
		    removeInput(index) {
		    	if (this.optionInputs.length > 1){
		        	this.optionInputs.splice(index, 1);
		    	}
	        },
	        //화면 이동
	       	showChange(){
	        	this.show=!this.show
	        	
	        	if(this.show){
		        	this.insert_update=true
	    			this.car_name=''
	    			this.car_type=''
	    			this.maker=''
	    			this.inwon=0
	    			this.fuel='휘발유'
	    			this.price=''
	    			this.optionInputs=[{value:""}]
		        	$('#filename').text("")
		        	$('#preview').attr("src", "../layout/img/imgUpload.png")
	    	      	$('#previewLabel').width('20%')
	    	      	$('#previewLabel').height('20%')
	    	      	$('#subTitle').text("차량 등록")
		        	

	        	}
	        },
	        //파일 미리보기
	        async getFileName(files) {
	        	  this.fileName = files[0]
	        	  await this.base64(this.fileName)
	        },
	        base64(file) {
	        	  // 비동기적으로 동작하기 위하여 promise를 return 해준다.
	        	  return new Promise(resolve => {
	        	    // 업로드된 파일을 읽기 위한 FileReader() 객체 생성
	        	    let a = new FileReader()
	        	    // 읽기 동작이 성공적으로 완료됐을 때 발생
	        	    a.onload = e => {
	        	      resolve(e.target.result)
	        				// 썸네일을 보여주고자 하는 <img>에 id값을 가져와 src에 결과값을 넣어준다.
	        	      const previewImage = document.getElementById('preview')
	        	      previewImage.src = e.target.result
	        	      $('#filename').text(this.fileName.name)
	        	      $('#previewLabel').width('320px')
	        	      $('#previewLabel').height('280px')
	        	    }
	        			// file 데이터를 base64로 인코딩한 문자열. 이 문자열을 브라우저가 인식하여 원래 데이터로 만들어준다.
	        	    a.readAsDataURL(file)
	        	  })
	        },
	        //input값들 변환
	        carOption() {
	        	let temp=''
	            for (const input of this.optionInputs) {
		              console.log("Input value:", input.value);
		              if(input.value != ""){
		            	  temp= temp+input.value+","
		              }
	            }
	        	temp=temp.substring(0,temp.lastIndexOf(","))
	        	this.car_option=temp
	        },
	        insertBtn(){
	        	this.carOption()
				if(this.car_name.trim()==""){
					this.$refs.car_name.focus()
					return
				}
				if(this.car_type.trim()==""){
					this.$refs.car_type.focus()
					return
				}
				if(this.maker.trim()==""){
					this.$refs.maker.focus()
					return
				}
				if(this.inwon==0){
					this.$refs.inwon.focus()
					return
				}
				if(this.price.trim()==""){
					this.$refs.price.focus()
					return
				}
				if(this.fileName==""){
					alert("이미지를 등록해 주세요")
					return
				}

				let form=new FormData();
				form.append("car_name", this.car_name)
				form.append("car_type", this.car_type)
				form.append("maker", this.maker)
				form.append("inwon", this.inwon)
				form.append("fuel", this.fuel)
				form.append("price", this.price)
				form.append("car_option", this.car_option)
				form.append("imagefile", this.fileName)
				
				axios.post('../admin_rent_insert_vue.do',form,{
					header:{
						'Content-Type':'multipart/form-data'
					}
				}).then(res=>{
					alert("등록이 완료되었습니다.")
					location.href="../adminpage/rent_list.do"
				}).catch(error=>{
					console.log(error.response)
				}) 
				
				
	        },
	        updateForm(index){
	        	this.show=false
	        	this.insert_update=false
	        	this.rno=this.rent_list[index].rno
    			this.car_name=this.rent_list[index].car_name
    			this.car_type=this.rent_list[index].car_type
    			this.maker=this.rent_list[index].maker
    			this.inwon=this.rent_list[index].inwon
    			this.fuel=this.rent_list[index].fuel
    			this.price=this.rent_list[index].price
    			this.optionInputs=[]
    			let option=this.rent_list[index].car_option.split(",")
    			for(let o of option){
    		        this.optionInputs.push({value:o});
    			}
	        	let imgName=this.rent_list[index].image
	        	imgName=imgName.substring(imgName.lastIndexOf("/")+1)
	        	$('#filename').text(imgName)
	        	$('#preview').attr("src", this.rent_list[index].image)
    	      	$('#previewLabel').width('320px')
    	      	$('#previewLabel').height('280px')
    	      	$('#subTitle').text("차량 수정")
    	      	
    	        this.$nextTick(() => {
    	            // 이 시점에서 this.fuel 값이 변경되어 select 요소의 값도 변경되어야 함
    	            // 추가적인 처리 작업을 수행할 수 있음
    	        	console.log("Updated this.fuel:", this.fuel);
    	        });
	        },
	        updateBtn(){
	        	this.carOption()
				if(this.car_name.trim()==""){
					this.$refs.car_name.focus()
					return
				}
				if(this.car_type.trim()==""){
					this.$refs.car_type.focus()
					return
				}
				if(this.maker.trim()==""){
					this.$refs.maker.focus()
					return
				}
				if(this.inwon==0){
					this.$refs.inwon.focus()
					return
				}
				if(this.price==""){
					this.$refs.price.focus()
					return
				}

				let form=new FormData();
				form.append("rno", this.rno)
				form.append("car_name", this.car_name)
				form.append("car_type", this.car_type)
				form.append("maker", this.maker)
				form.append("inwon", this.inwon)
				form.append("fuel", this.fuel)
				form.append("price", this.price)
				form.append("car_option", this.car_option)
				form.append("image", $('#preview').attr("src"))
				form.append("imagefile", this.fileName)
				
				axios.post('../admin_rent_update_vue.do',form,{
					header:{
						'Content-Type':'multipart/form-data'
					}
				}).then(res=>{
					alert("등록이 완료되었습니다.")
					location.href="../adminpage/rent_list.do"
				}).catch(error=>{
					console.log(error.response)
				}) 
	        }
		}
	})
</script>
</body>
</html>