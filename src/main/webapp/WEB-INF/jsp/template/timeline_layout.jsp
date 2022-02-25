<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banagram</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<!--  css -->
<link rel="stylesheet" type="text/css" href="/css/timeline_style.css">
<link rel="stylesheet" type="text/css" href="/css/modal_style.css">
<!--  fontawesome -->
<script src="https://kit.fontawesome.com/6c0fa0c849.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<section class="contents">
			<nav class="d-flex bg-white justify-content-center">
				<jsp:include page="../include/timeline_gnb.jsp" />
			</nav>
			<div class="d-flex justify-content-center">
				<jsp:include page="../${viewPath}.jsp" />
			</div>
		</section>
	</div>
	

</body>
</html>