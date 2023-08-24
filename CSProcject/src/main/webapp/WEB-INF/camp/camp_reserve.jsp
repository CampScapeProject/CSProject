<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 제목 칸 -->
<div class="where_togo_area" style="padding: 30px;">
    <div class="container" style="margin: 0 auto;">
    	<div class=row>
         <div class="col-lg-3">
             <div class="form_area">
                 <h1 style="color: white;text-align: center;font-weight: bold;font-family: 'Noto Sans KR', sans-serif;margin-top: 10px;">예약 정보</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!--  -->
<div class="default_width mt-5">
	<div class="row" style="margin: 0 auto !important;">
	  <div class="col-sm-8 reserve_left">
	    <b class="large_text">예약자 정보</b>
	      <div class="mt-5"><strong class="user_profile">예약자 이름</strong></div>
	      <input type="text" class="form-control form-control-lg mt-3" value="${member.name}" readonly>
	
	      <div class="mt-5">
	        <strong class="user_profile">휴대폰 번호</strong> <br>
	        <input type="text" class="form-control form-control-lg mt-3" value="${member.tel}" readonly>
	      </div>
	
	      <div class="mt-5" onclick="chkReserve()">
	        <div class="form-check">
	          <input type="checkbox" class="form-check-input" id="check1" name="option1" value="something" required>
	          <label class="form-check-label" for="check1">숙소이용규칙 및 취소/환불규정 동의</label>
	        </div>
	        <div class="form-check">
	          <input type="checkbox" class="form-check-input" id="check2" name="option2" value="something" required>
	          <label class="form-check-label" for="check2">개인정보 수집 및 이용 동의</label>
	        </div>
	        <div class="form-check">
	          <input type="checkbox" class="form-check-input" id="check3" name="option2" value="something" required>
	          <label class="form-check-label" for="check2">개인정보 제 3자 제공 동의</label>
	        </div>
	        
	      </div>
	  </div>
	
	  <div class="col-sm-4 reserve rounded">
	    <div class="reserve_body">
	      <p class="reserve_info">
	        <strong class="reserve_name">숙소이름</strong> <br>
	      </p>
	      <p class="reserve_info">
	        <strong class="reserve_name">객실타입</strong> <br>
	      </p>
	      <p class="reserve_info">
	        <strong class="reserve_name">체크인</strong> <br>
	      </p>
	      <p class="reserve_info">
	        <strong class="reserve_name">체크아웃</strong> <br>
		      </p>
	    </div>
	
	    <div class="reserve_body">
	      <strong class="reserve_name" style="color: black;">총 결제 금액</strong> <br>
	      <strong class="reserve_name" style="color: #ffc107; font-size: 30px;"><fmt:formatNumber  pattern="#,###" /></strong><strong class="reserve_name" style="color: black; font-size: 30px;"> 원</strong> <br>
	    </div>
	    <button class="btn" type="button" onclick="requestPay()" id="btn" disabled
	    	style="width: 100%; height: 56px; background: #ffc107; color: white; border: none;">결제하기</button>
	  </div>
	  
	</div>
</div>
</body>
</html>