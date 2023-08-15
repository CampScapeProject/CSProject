<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Travelo</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../layout/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="../layout/css/bootstrap.min.css">
    <link rel="stylesheet" href="../layout/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../layout/css/magnific-popup.css">
    <link rel="stylesheet" href="../layout/css/font-awesome.min.css">
    <link rel="stylesheet" href="../layout/css/themify-icons.css">
    <link rel="stylesheet" href="../layout/css/nice-select.css">
    <link rel="stylesheet" href="../layout/css/flaticon.css">
    <link rel="stylesheet" href="../layout/css/gijgo.css">
    <link rel="stylesheet" href="../layout/css/animate.css">
    <link rel="stylesheet" href="../layout/css/slick.css">
    <link rel="stylesheet" href="../layout/css/slicknav.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../layout/css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
<body>
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	<div style="min-height: 700px;">
		<tiles:insertAttribute name="home"/>
	</div>
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>
	
	
	  <!-- Modal -->
	  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered" role="document">
	      <div class="modal-content">
	        <div class="serch_form">
	            <input type="text" placeholder="Search" >
	            <button type="submit">search</button>
	        </div>
	      </div>
	    </div>
	  </div>
	    <!-- link that opens popup -->
<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    
    <!-- JS here -->
    <script src="../layout/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="../layout/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../layout/js/popper.min.js"></script>
    <script src="../layout/js/bootstrap.min.js"></script>
    <script src="../layout/js/owl.carousel.min.js"></script>
    <script src="../layout/js/isotope.pkgd.min.js"></script>
    <script src="../layout/js/ajax-form.js"></script>
    <script src="../layout/js/waypoints.min.js"></script>
    <script src="../layout/js/jquery.counterup.min.js"></script>
    <script src="../layout/js/imagesloaded.pkgd.min.js"></script>
    <script src="../layout/js/scrollIt.js"></script>
    <script src="../layout/js/jquery.scrollUp.min.js"></script>
    <script src="../layout/js/wow.min.js"></script>
    <script src="../layout/js/nice-select.min.js"></script>
    <script src="../layout/js/jquery.slicknav.min.js"></script>
    <script src="../layout/js/jquery.magnific-popup.min.js"></script>
    <script src="../layout/js/plugins.js"></script>
    <script src="../layout/js/gijgo.min.js"></script>
    <script src="../layout/js/slick.min.js"></script>
   

    
    <!--contact js-->
    <script src="../layout/js/contact.js"></script>
    <script src="../layout/js/jquery.ajaxchimp.min.js"></script>
    <script src="../layout/js/jquery.form.js"></script>
    <script src="../layout/js/jquery.validate.min.js"></script>
    <script src="../layout/js/mail-script.js"></script>


    <script src="../layout/js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
    </script>
</body>


</html>