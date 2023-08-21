<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.row2 {
		margin: 0px auto;
		text-align: center;
	}
	
	.card-carousel-wrapper {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin: 20px 0 40px;
	  color: #666a73;
	}
	
	.card-carousel {
	  display: flex;
	  justify-content: center;
	  width: 800px;
	}
	
	.card-carousel--overflow-container {
	  overflow: hidden;
	}
	
	.card-carousel-cards {
	  display: flex;
	  transition: transform 150ms ease-out;
	  transform: translatex(0px);
	}
	
	.card-carousel-cards .card-carousel--card {
	  margin: 0 10px;
	  cursor: pointer;
	  box-shadow: 0 4px 15px 0 rgba(40, 44, 53, 0.06), 0 2px 2px 0 rgba(40, 44, 53, 0.08);
	  background-color: #fff;
	  border-radius: 4px;
	  z-index: 3;
	  margin-bottom: 2px;
	}
	
	.card-carousel-cards .card-carousel--card:first-child {
	  margin-left: 0;
	}
	
	.card-carousel-cards .card-carousel--card:last-child {
	  margin-right: 0;
	}
	
	.card-carousel-cards .card-carousel--card img {
	  vertical-align: bottom;
	  border-top-left-radius: 4px;
	  border-top-right-radius: 4px;
	  transition: opacity 150ms linear;
	  user-select: none;
	}
	.card-carousel-cards .card-carousel--card img:hover {
	  opacity: 0.6;
	}
	.card-carousel-cards .card-carousel--card--footer {
	  border-top: 0;
	  padding: 7px 15px;
	}
	.card-carousel-cards .card-carousel--card--footer p {
	  padding: 3px 0;
	  margin: 0;
	  margin-bottom: 2px;
	  font-size: 19px;
	  font-weight: 500;
	  color: #2c3e50;
	  user-select: none;
	}
</style>
</head>
<body>

	<!-- 레시피 상단 -->
	<div class="container" style="padding: 80px; background-color: ">
		<div class="row2" style="text-align: center">

		</div>
	</div>
	
	<!-- 레시피 본문 -->

	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="card-carousel-wrapper">
				    <div class="card-carousel">
				      <div class="card-carousel--overflow-container">
				        <div class="card-carousel-cards">
				          <div class="card-carousel--card"><img src="https://placehold.it/200x200"/>
				            <div class="card-carousel--card--footer">
				              <p>이름</p>
				            </div>
				          </div>
				        </div>
				      </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>