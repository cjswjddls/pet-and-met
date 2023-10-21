<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% String pagePath = "./"; %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>500 Not Found</title>
	<link href="<%= pagePath %>resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="<%= pagePath %>resources/css/sb-admin-2.min.css" rel="stylesheet">
	</head>
	<body>
		<%@ include file="../../views/common/header.jsp" %>

		<div class="container" style="height: 600px;">
			<div class="container-fluid" style="height: 100%;">
                <div class="text-center" style="height: 100%; padding: 15%;">
                    <div class="error mx-auto" data-text="500">500</div>
                    <p class="lead text-gray-800 mb-5">Page Error Found</p>
                    <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
                    <a href="<%= contextPath %>/" style="color:red;"><h4>&larr; 홈으로</h4></a>
                </div>
            </div>
		</div>

		<%@ include file="../../views/common/footer.jsp" %>
	</body>
</html>