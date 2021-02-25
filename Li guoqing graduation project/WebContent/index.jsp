<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>毕业设计</title>
<script>
	function TestJump(){
 		window.location.href="Test.jsp";
	}
	function PracticeJump(){
	 	window.location.href="Practice.jsp";
	}

	<%-- <%
	Object obj =application.getAttribute("counter");
	if(obj==null){
	    application.setAttribute("counter", new Integer(1));
	  	out.print("该页面已被访问1次！");
	}else{
	    int count=Integer.parseInt(obj.toString());
	    count++;
	    out.print("该页面已被访问了"+count+"次！");
	    application.setAttribute("counter", count);
	}
	%>  --%>
	 <%
	 if(application.getAttribute("count")==null){
	 application.setAttribute("count",0);
	 }
	 %>
	 <%
	 int count=Integer.parseInt(application.getAttribute("count").toString());
	 count++;
	 application.setAttribute("count", count);
	 %>

	
	
</script>
<style type="text/css">
	.Ts {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}	
	.Ts1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}
	.Ts1:hover {
    background-color: #4CAF50;
    color: white;
}

	.Prc {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}
	.Prc2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}
	.Prc2:hover {
    background-color: #008CBA;
    color: white;
}
	.btn {
		position: absolute;   
        top: 50%;   
        left: 50%;   
        -webkit-transform: translate(-50%, -50%);   
        -moz-transform: translate(-50%, -50%);   
        -ms-transform: translate(-50%, -50%);   
        -o-transform: translate(-50%, -50%);   
        transform: translate(-50%, -50%);   
		text-align:center;
	}
	.h{
		color:#FFFFFF;
		font-size:60px;
	}
	body {
		background-image:url(images/index.jfif);
		background-size:100%;
	}
	.bottom1 {
		color:#FFFFFF;
		font-size:30px;
	}
	.bottom {
		color:#FFFFFF;
		font-size:30px;
	}
	.all {
		margin-top:400px;
	}
	.p3 {
		margin-top:5px;
	}
	.num {
		color:#FFFFFF;
		position:absolute;
		top:15px;
		letf:15px;
	}
</style>
</head>

<body>
	<div class="h" align="center" id="head" style="margin-top:110px;">低压电工模拟盘测试操作仿真系统</div>
	
	<div class="btn">
	<button onclick=javascrtpt:TestJump() class="Ts Ts1" >考试模式</button>
	<button onclick=javascrtpt:PracticeJump() class="Prc Prc2" >练习模式</button>
	</div>
	<div class="all" >
	<div class="bottom1" align="center" >山东交通学院新能源汽车研究所出品</div>
	<div class="bottom" align="center" >开发人：刘新磊、李国庆</div>
	</div>
	
	
	
	 <div id="num" class="num">访客总量：<%=application.getAttribute("count") %></div>
	
</body>
</html>