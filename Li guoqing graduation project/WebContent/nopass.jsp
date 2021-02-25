<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>考试模式</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://fonts.googleapis.com/css?family=Montserrat:700" rel="stylesheet">


<link rel="stylesheet" href="css/style.css">


<script type="text/javascript">
var time = 10;

function returnUrlByTime() {

	window.setTimeout('returnUrlByTime()', 1000);

	time = time - 1;

	document.getElementById("layer").innerHTML = time;
}
</script>

</head>

<body οnlοad="returnUrlByTime()">

<h1 data-text="很遗憾，考试失败"><span>很遗憾，考试失败</span></h1>
 
<%
	//转向语句
	response.setHeader("Refresh", "10;URL=index.jsp");
%>
  
  
</body>
</html>