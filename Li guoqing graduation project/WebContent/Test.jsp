<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta charset="utf-8">
<title>考试模式</title>
<script type="text/javascript" src="./jquery-3.4.1.js"></script>
<script type="text/javascript">
	

	
	
	/*测试jquery是否导入成功
	$(function(){
		alert($('#rightdi').offset().top);
	}) */
	
	//定义一个全局数组来收集用户操作的顺序
	var arrayList2 = []
	
	/**第一步 检查指示牌是否悬挂在电源箱上，确认无误后按下标志牌悬挂确认按钮。**/
	function ConfirmationSign(){
		//alert("确认挂牌已悬挂");
		document.getElementById("confirmationsign").style.display="none"; 
		arrayList2.push(1);
	}; 
	
	//这里定义画线的一些属性
	function drawline(beginx,beginy,endx,endy,ctx){
		ctx.strokeStyle=color;
		ctx.lineWidth=linewidth;
		ctx.beginPath();
		ctx.moveTo(beginx,beginy);
		ctx.lineTo(endx,endy);
		ctx.closePath();
		ctx.stroke();
	};

	
window.onload=function(){	//window.onload网页加载完成之后立即执行的操作
	//定义canvas画布
	var canvas = document.getElementById("canvas");
	//canvas.width= window.innerWidth;
	//canvas.height=window.innerHeight;
	canvas.width= window.innerWidth;
	canvas.height=window.innerHeight;
	//判断是否能够找到canvas对象
	if(!canvas.getContext){
		return; 
	}
	var ctx = canvas.getContext("2d");
	/**第二步的操作：这里实现的是地线右边插孔的接线操作**/
	var rightdiisClick = false;
	document.getElementById("rightdi").onclick=function(){
		if (rightdiisClick == false) {
			//设置drawline的颜色
			color="rgb(128,64,0)";
			linewidth=8;
			//画一条由(x,y)到另一个点(x,y)的线段
			drawline($('#rightdi').offset().left+6,$('#rightdi').offset().top,$('#rightdi').offset().left+6,650,ctx);
			drawline($('#rightdi').offset().left+6,650,$('#rightdi2').offset().left+6,650,ctx);
			arrayList2.push(2);
			rightdiisClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=9;
			drawline($('#rightdi').offset().left+6,$('#rightdi').offset().top,$('#rightdi').offset().left+6,650,ctx);
			drawline($('#rightdi').offset().left+6,650,$('#rightdi2').offset().left+6,650,ctx);
			arrayList2.push(25);
			rightdiisClick = false;
			
			if (red2isClick == true) {
				//alert("画红线");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			} else {

			}
			if (green2isClick == true) {
				//alert("画绿线");
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else {

			}
			if (yellow2isClick == true) {
				//alert("画黄线");
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else {

			}
		}
	
	};
	
	/**第三步的操作 将电源地线的另一插头插入电源箱的地线**/
	var rightdi2isClick = false;
	document.getElementById("rightdi2").onclick=function(){
		if (rightdi2isClick == false) {
			color="rgb(128,64,0)";
			linewidth=8;
			drawline($('#rightdi2').offset().left+6,650,$('#rightdi2').offset().left+6,$('#rightdi2').offset().top,ctx);
			arrayList2.push(3);
			rightdi2isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=9;
			drawline($('#rightdi2').offset().left+6,650,$('#rightdi2').offset().left+6,$('#rightdi2').offset().top,ctx);
			arrayList2.push(24);
			rightdi2isClick = false;
			
			if (red2isClick == true) {
				//alert("画红线");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			} else {

			}
			if (green2isClick == true) {
				//alert("画绿线");
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else {

			}
			if (yellow2isClick == true) {
				//alert("画黄线");
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else {

			}
		}
		
	};
	
	/**第四步的操作 将电机地线插头插至电源地线插头背面孔内**/
	var leftdiisClick = false;
	document.getElementById("leftdi").onclick=function(){
		if (leftdiisClick == false) {
			color="rgb(128,64,0)";
			linewidth=8;
			drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
			drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			arrayList2.push(4);
			leftdiisClick = true;
		}else {
			color="rgb(199,236,205)";
			linewidth=9;
			drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
			drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			arrayList2.push(23);
			leftdiisClick = false;
			//画电源箱的线
			if (red2isClick == true) {
				//alert("画红线");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			} else {

			}
			if (green2isClick == true) {
				//alert("画绿线");
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else {

			}
			if (yellow2isClick == true) {
				//alert("画黄线");
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else {

			}
			//画接线端子板的线
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
			if (green3isClick == true) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			} else {

			}
			if (red3isClick == true) {
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			} else {

			}
		}
		
	};
	var leftdi2isClick = false;
	document.getElementById("leftdi2").onclick=function(){
		if (leftdi2isClick == false) {
			color="rgb(128,64,0)";
			linewidth=8;
			drawline($('#leftdi2').offset().left+6,$('#leftdi2').offset().top,$('#leftdi2').offset().left+6,650,ctx);
			arrayList2.push(4);
			leftdi2isClick = true;
		}else {
			color="rgb(199,236,205)";
			linewidth=9;
			drawline($('#leftdi2').offset().left+6,$('#leftdi2').offset().top,$('#leftdi2').offset().left+6,650,ctx);
			arrayList2.push(23);
			leftdi2isClick = false;
		}
		
	};
	
	/**第五步将电机的黄色电源线接至接线端子板上。将电机的绿色电源线接至接线端子板上.将电机的红色电源线接至接线端子板上。(不分先后顺序)**/
	//<!--电机的黄线 接 接线端子板 -->
	var yellow3isClick = false;
	document.getElementById("yellow3").onclick=function(){
		if (yellow3isClick == false) {
			color="rgb(255,255,0)";
			linewidth=5;
			drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			arrayList2.push(5);
			yellow3isClick = true;
		} else {
			//alert("被点击过");
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			arrayList2.push(22);
			yellow3isClick = false;
			
			//这里写的是当黄线取消之后，对于其他线路遮挡关系的演示，写的比较繁琐，全部情况有64种情况
			if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("   4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("  3  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("  3 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("  3 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("  34 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 2   6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 2  5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 2 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert(" 2 4  ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 2 4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert(" 2 45 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert(" 2 456");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 23  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 23 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 23 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 234 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("23456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1     6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1   56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1  4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1  4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1  45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1  456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1 3   ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1 3  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1 3 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1 3 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1 34 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1 34 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1 345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1 3456 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("12");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("12   6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("12  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("12  56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("12 4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				/* //画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("12 4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12 45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("12 456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("123");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("123  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				/* //画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("123 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("123 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1234");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1234 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("123456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("2");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("23");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			}else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("234");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("2345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("3");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("34");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("3456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("4");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("45");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("5");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("56");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("6");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}
			
			
		}
		
	};
	var yellowisClick = false;
	document.getElementById("yellow").onclick=function(){
		if (yellowisClick == false) {
			color="rgb(255,255,0)";
			linewidth=5;
			drawline($('#yellow').offset().left+6,$('#yellow').offset().top,$('#yellow').offset().left+6,700,ctx);
			drawline($('#yellow').offset().left+6,700,$('#yellow3').offset().left+6,700,ctx);
			arrayList2.push(5);
			yellowisClick = true;
		} else {
			//alert("被点击过");
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#yellow').offset().left+6,$('#yellow').offset().top,$('#yellow').offset().left+6,700,ctx);
			drawline($('#yellow').offset().left+6,700,$('#yellow3').offset().left+6,700,ctx);
			arrayList2.push(22);
			yellowisClick = false;
		}
		
	};
	//<!--电机的绿色线 接 接线端子板 -->
	var green3isClick = false;
	document.getElementById("green3").onclick=function(){
		if (green3isClick == false) {
			color="rgb(0,255,0)";
			linewidth=5;
			drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			arrayList2.push(5);
			green3isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			arrayList2.push(22);
			green3isClick = false;
			
			//这里写的是当黄线取消之后，对于其他线路遮挡关系的演示，写的比较繁琐，全部情况有64种情况
			if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("   4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("  3  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("  3 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("  3 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("  34 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 2   6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 2  5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 2 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert(" 2 4  ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 2 4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert(" 2 45 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert(" 2 456");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 23  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 23 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 23 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 234 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("23456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1     6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1   56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1  4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1  4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1  45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1  456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1 3   ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1 3  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1 3 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1 3 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1 34 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1 34 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1 345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1 3456 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("12");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("12   6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("12  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("12  56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("12 4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				/* //画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("12 4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12 45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("12 456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("123");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("123  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				/* //画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("123 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("123 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1234");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1234 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("123456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("2");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("23");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			}else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("234");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("2345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("3");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("34");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("3456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("4");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("45");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("5");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("56");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("6");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}
		}
		
	};
	var greenisClick = false;
	document.getElementById("green").onclick=function(){
		if (greenisClick == false) {
			color="rgb(0,255,0)";
			linewidth=5;
			drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
			drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			arrayList2.push(5);
			greenisClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
			drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			arrayList2.push(22);
			greenisClick = false;
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
		}
		
	};
	//<!--电机的红色线 接 接线端子板 -->
	var red3isClick = false;
	document.getElementById("red3").onclick=function(){
		if (red3isClick == false) {
			color="rgb(255,0,0)";
			linewidth=5;
			drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			arrayList2.push(5);
			red3isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			arrayList2.push(22);
			red3isClick = false;
			
			//这里写的是当黄线取消之后，对于其他线路遮挡关系的演示，写的比较繁琐，全部情况有64种情况
			if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1");
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("   4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("  3  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("  3 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("  3 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("  34 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 2   6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 2  5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 2 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert(" 2 4  ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 2 4 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert(" 2 45 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert(" 2 456");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert(" 23  6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert(" 23 5 ");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert(" 23 56");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert(" 234 6");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("23456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1     6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1   56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1  4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1  4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1  45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1  456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("1 3   ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("1 3  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("1 3 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("1 3 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1 34 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1 34 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("1 345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("1 3456 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("12");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("12   6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("12  5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("12  56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("12 4  ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				/* //画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("12 4 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12 45 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("12 456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("123");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("123  6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				/* //画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("123 5 ");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx); */
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("123 56");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}  else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("1234");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == true ) {
				//alert("1234 6");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("12345");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == true && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("123456");
				//画上电源的红线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("2");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("23");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			}else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("234");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == true && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("2345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == false && redisClick == false && greenisClick == false ) {
				//alert("3");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("34");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("345");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == true && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("3456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == false && greenisClick == false ) {
				//alert("4");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == false ) {
				//alert("45");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == true && redisClick == true && greenisClick == true ) {
				//alert("456");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx);
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == false ) {
				//alert("5");
				//画上电源的红线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == true && greenisClick == true ) {
				//alert("56");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			} else if (red2isClick == false && green2isClick == false && yellow2isClick == false && leftdiisClick == false && redisClick == false && greenisClick == true ) {
				//alert("6");
				//画上电源的红线
			/* 	color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
				drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
				drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx); */
				//画上电源的绿线
				/* color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
				drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
				drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx); */
				//画上电源的黄线
				/* color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
				drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
				drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx); */
				//画上左边地线
				/* color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
				drawline($('#leftdi').offset().left+6,650,$('#leftdi2').offset().left+6,650,ctx); */
				//画上电机的红色线
				/* color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
				drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx); */
				//画上电机的绿色线
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green').offset().left+6,$('#green').offset().top,$('#green').offset().left+6,690,ctx);
				drawline($('#green').offset().left+6,690,$('#green3').offset().left+6,690,ctx);
			}
		}
		
	};
	var redisClick = false;
	document.getElementById("red").onclick=function(){
		if (redisClick == false) {
			color="rgb(255,0,0)";
			linewidth=5;
			drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
			drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			arrayList2.push(5);
			redisClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=6;
			drawline($('#red').offset().left+6,$('#red').offset().top,$('#red').offset().left+6,680,ctx);
			drawline($('#red').offset().left+6,680,$('#red3').offset().left+6,680,ctx);
			arrayList2.push(22);
			redisClick = false;
			
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
			if (green3isClick == true) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			} else {

			}
		}
		
	};
	
	/**第六步 将黄色电源线一端接至操作台接线端子板上。将绿色电源线一端接至操作台接线端子板上。将红色电源线一端接至操作台接线端子板上。(不分先后顺序) **/
	//<!--将黄色电源线一端接至操作台接线端子板上--> 
	var yellow4isClick = false;
	document.getElementById("yellow4").onclick=function(){
		if (dianbi.value == "电笔") {
			if (yellow4isClick == false) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow4').offset().left+6,$('#yellow4').offset().top,$('#yellow4').offset().left+6,630,ctx);
				arrayList2.push(6);
				yellow4isClick = true;
			} else {
				//撤去黄线
				//alert("被点击过");
				color="rgb(199,236,205)";
				linewidth=6;
				drawline($('#yellow4').offset().left+6,$('#yellow4').offset().top,$('#yellow4').offset().left+6,631,ctx);
				yellow4isClick = false;
				arrayList2.push(21);
			}
		} else {
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
		}
		
	}; 
	//<!--将绿色电源线一端接至操作台接线端子板上-->
	var green4isClick = false;
	document.getElementById("green4").onclick=function(){
		if (dianbi.value == "电笔") {
			if (green4isClick == false) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green4').offset().left+6,$('#green4').offset().top,$('#green4').offset().left+6,620,ctx);
				arrayList2.push(6);
				green4isClick = true;
			} else {
				//撤去绿线
				//alert("被点击过");
				color="rgb(199,236,205)";
				linewidth=6;
				drawline($('#green4').offset().left+6,$('#green4').offset().top,$('#green4').offset().left+6,621,ctx);
				green4isClick = false;
				arrayList2.push(21);
			}
		} else {
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
		}
		
	}; 
	//<!--将红色电源线一端接至操作台接线端子板上-->
	var red4isClick = false;
	document.getElementById("red4").onclick=function(){
		if (dianbi.value == "电笔") {
			if (red4isClick == false) {
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red4').offset().left+6,$('#red4').offset().top,$('#red4').offset().left+6,610,ctx);
				arrayList2.push(6);
				red4isClick = true;
			} else {
				//撤去红线
				color="rgb(199,236,205)";
				linewidth=6;
				drawline($('#red4').offset().left+6,$('#red4').offset().top,$('#red4').offset().left+6,611,ctx);
				arrayList2.push(21);
				red4isClick = false;
			}
		} else {
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
		}
		 
	};
	
	/**第七步 将红色电源线一端接至电源箱红色插孔上。**/
	var red2isClick = false;
	document.getElementById("red2").onclick=function(){
		if (red2isClick == false) {
			color="rgb(255,0,0)";
			linewidth=5;
			drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
			drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
			drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			arrayList2.push(7);
			red2isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=8;
			drawline($('#red2').offset().left+6,$('#red2').offset().top+6,$('#red2').offset().left+80,$('#red2').offset().top+6,ctx);
			drawline($('#red2').offset().left+80,$('#red2').offset().top+6,$('#red2').offset().left+80,610,ctx);
			drawline($('#red2').offset().left+80,610,$('#red4').offset().left+6,610,ctx);
			arrayList2.push(21);
			red2isClick = false;
			
			//这里的我太难了，拆了东墙补西墙。跟个大傻子一样
			if (rightdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi').offset().left+6,$('#rightdi').offset().top,$('#rightdi').offset().left+6,650,ctx);	
			} else {

			}
			if (rightdi2isClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi2').offset().left+6,650,$('#rightdi2').offset().left+6,$('#rightdi2').offset().top,ctx);
			} else {

			}
			if (leftdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
			} else {

			}
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
			if (green3isClick == true) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			} else {

			}
			if (red3isClick == true) {
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			} else {

			}
			
		}
		
	};
	
	/**第八步 将绿色电源线一端接至电源箱绿色插孔上。**/
	var green2isClick = false;
	document.getElementById("green2").onclick=function(){
		if (green2isClick == false) {
			color="rgb(0,255,0)";
			linewidth=5;
			drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
			drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
			drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			arrayList2.push(8);
			green2isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=8;
			drawline($('#green2').offset().left+6,$('#green2').offset().top+6,$('#green2').offset().left+90,$('#green2').offset().top+6,ctx);
			drawline($('#green2').offset().left+90,$('#green2').offset().top+6,$('#green2').offset().left+90,620,ctx);
			drawline($('#green2').offset().left+90,620,$('#green4').offset().left+6,620,ctx);
			arrayList2.push(21);
			green2isClick = false;
			if (rightdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi').offset().left+6,$('#rightdi').offset().top,$('#rightdi').offset().left+6,650,ctx);	
			} else {

			}
			if (rightdi2isClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi2').offset().left+6,650,$('#rightdi2').offset().left+6,$('#rightdi2').offset().top,ctx);
			} else {

			}
			if (leftdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
			} else {

			}
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
			if (green3isClick == true) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			} else {

			}
			if (red3isClick == true) {
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			} else {

			}
		}
		
	};
	
	/**第九步 将黄色电源线一端接至电源箱黄色插孔上。**/
	var yellow2isClick = false;
	document.getElementById("yellow2").onclick=function(){
		if (yellow2isClick == false) {
			color="rgb(255,255,0)";
			linewidth=5;
			drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
			drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
			drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			arrayList2.push(9);
			yellow2isClick = true;
		} else {
			color="rgb(199,236,205)";
			linewidth=8;
			drawline($('#yellow2').offset().left+6,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,$('#yellow2').offset().top+6,ctx);
			drawline($('#yellow2').offset().left+100,$('#yellow2').offset().top+6,$('#yellow2').offset().left+100,630,ctx);
			drawline($('#yellow2').offset().left+100,630,$('#yellow4').offset().left+6,630,ctx);
			arrayList2.push(21);
			yellow2isClick = false;
			
			if (rightdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi').offset().left+6,$('#rightdi').offset().top,$('#rightdi').offset().left+6,650,ctx);	
			} else {

			}
			if (rightdi2isClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#rightdi2').offset().left+6,650,$('#rightdi2').offset().left+6,$('#rightdi2').offset().top,ctx);
			} else {

			}
			if (leftdiisClick == true) {
				color="rgb(128,64,0)";
				linewidth=8;
				drawline($('#leftdi').offset().left+6,$('#leftdi').offset().top,$('#leftdi').offset().left+6,650,ctx);
			} else {

			}
			if (yellow3isClick == true) {
				color="rgb(255,255,0)";
				linewidth=5;
				drawline($('#yellow3').offset().left+6,$('#yellow3').offset().top,$('#yellow3').offset().left+6,700,ctx);
			} else {

			}
			if (green3isClick == true) {
				color="rgb(0,255,0)";
				linewidth=5;
				drawline($('#green3').offset().left+6,$('#green3').offset().top,$('#green3').offset().left+6,690,ctx);
			} else {

			}
			if (red3isClick == true) {
				color="rgb(255,0,0)";
				linewidth=5;
				drawline($('#red3').offset().left+6,$('#red3').offset().top,$('#red3').offset().left+6,680,ctx);
			} else {

			}
		}
	
	};
	
	/**第十步 按报告按钮请求考官送电。**/
	document.getElementById("requesttosend").onclick=function(){
		document.getElementById("requesttosend").style.display="none";
		document.getElementById("bulb").style.display="block";
		arrayList2.push(10);
	};
	
	/**第十一步 摘指示牌并挂在挂柱上，指示牌插头插入反扣插孔。**/
	document.getElementById("inreverse").onclick=function(){
		document.getElementById("zhishipai").style.display="none";
		document.getElementById("zhishipai2").style.display="block";
		var inreverse = window.document.getElementById("inreverse");
			//alert(inreverse.value);
			//文档就绪函数
			$(function () {
			    //鼠标指针移动时发生 mousemove 事件
			    $(document).mousemove(function (e) {
			        //获取鼠标坐标：
			        var X = e.pageX;
			        var Y = e.pageY;
			        //获取鼠标坐标e.pageX e.pageY，给图片添加绝对位置 position:absolute  改变图片大小
			        $(".zhishipai2").css({ "width": "115px", "height": "150px", "display":"block" , "position": "absolute", "left": e.pageX, "top": e.pageY-110, "z-index":"9" });
			        //alert(inreverse.value);
				});
			});
		document.getElementById("fangzhizhishipai").onclick=function(){
			var fangzhizhishipai = window.document.getElementById("fangzhizhishipai");
			if (fangzhizhishipai.value == "挂牌放置") {
				//alert(11);
				$(document).unbind('mousemove');
				fangzhizhishipai.value = "放回指示牌";
				arrayList2.push(11);
			 } else {
				 /**第十九步 指示牌正面朝外挂回 **/
				 //alert(19);
				$(document).unbind('mousemove');
				document.getElementById("zhishipai").style.display="block";
				document.getElementById("zhishipai2").style.display="none";
				fangzhizhishipai.value = "挂牌放置";
				arrayList2.push(19);
			}  
		};
	};
	
	/**第十二步 打开总电源开关上电。**/
	var poweron1 = 0;
	document.getElementById("poweron1").onclick=function(){
		document.getElementById("poweroff").style.display="none";
		document.getElementById("poweron").style.display="block";
		arrayList2.push(12);
		poweron1 = 1;	
		//alert(poweron1);
	};
	
	/**第十八步 关闭总电源开关**/
	document.getElementById("poweroff1").onclick=function(){
		document.getElementById("poweron").style.display="none";
		document.getElementById("poweroff").style.display="block";
		arrayList2.push(18);
		poweron1 = 0;
	};
	
	/**第十三步 打开模拟盘内开关。**/
	var onit = 0;
	document.getElementById("onit").onclick=function(){
		document.getElementById("off").style.display="none";
		document.getElementById("on").style.display="block";
		arrayList2.push(13);
		onit = 1;
	};
	

	/**第十七步 模拟盘内开关关闭**/
	document.getElementById("offit").onclick=function(){
		document.getElementById("on").style.display="none";
		document.getElementById("off").style.display="block";
		arrayList2.push(17);
		onit = 0;
	};
	
	/**第十四步 用电笔测主电路的接触器接入点有没有电**/	
	document.getElementById("dianbi").onclick=function(){
		var dianbi = window.document.getElementById("dianbi");
		if(dianbi.value == "电笔"){
			dianbi.value = "回复电笔";
			//alert("电笔");
			//文档就绪函数
			$(function () {
			    //鼠标指针移动时发生 mousemove 事件
			    $(document).mousemove(function (e) {
			        //获取鼠标坐标：
			        var X = e.pageX;
			        var Y = e.pageY;
			        //获取鼠标坐标e.pageX e.pageY，给图片添加绝对位置 position:absolute  改变图片大小
			        $(".image_XY").css({ "width": "40px", "height": "280px", "position": "absolute", "left": e.pageX, "top": e.pageY-360, "z-index":"9" });
			    });
			});
		}else{
			dianbi.value = "电笔";
			//alert(dianbi.value);
			//解除跟随鼠标的移动事件
			$(document).unbind('mousemove');
		}
		
		document.getElementById("jiechuqi1").onclick=function(){
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				//alert("线路接通");
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				//alert("线路没有接通");
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
			arrayList2.push(14);
		};
		document.getElementById("jiechuqi2").onclick=function(){
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				//alert("线路接通");
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				//alert("线路没有接通");
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
			arrayList2.push(14);
		};
		document.getElementById("jiechuqi3").onclick=function(){
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				//alert("线路接通");
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				//alert("线路没有接通");
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
			arrayList2.push(14);
		};
		
		/**第十五步 用电笔测控制电路支路的熔断器输出点有没有电**/
		document.getElementById("rongduanqi1").onclick=function(){
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				//alert("线路接通");
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				//alert("线路没有接通");
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
			arrayList2.push(15);
		};
		document.getElementById("rongduanqi2").onclick=function(){
			if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
				//alert("线路接通");
				document.getElementById("current").style.display="block";
				document.getElementById("nocurrent").style.display="none";
			} else {
				//alert("线路没有接通");
				document.getElementById("nocurrent").style.display="block";
				document.getElementById("current").style.display="none";
			}
			arrayList2.push(15);
		};
		
		
		/**第二十步 用电笔对模拟盘电源输入端验电**/
		 document.getElementById("yellow4").onclick=function(){
			 if (dianbi.value == "电笔") {
				 if (yellow4isClick == false) {
						color="rgb(255,255,0)";
						linewidth=5;
						drawline($('#yellow4').offset().left+6,$('#yellow4').offset().top,$('#yellow4').offset().left+6,630,ctx);
						yellow4isClick = true;
						arrayList2.push(6);
					} else {
						//撤去黄线
						//alert("被点击过");
						color="rgb(199,236,205)";
						linewidth=6;
						drawline($('#yellow4').offset().left+6,$('#yellow4').offset().top,$('#yellow4').offset().left+6,631,ctx);
						yellow4isClick = false;
						arrayList2.push(21);
					}
			} else {
				if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
					document.getElementById("current").style.display="block";
					document.getElementById("nocurrent").style.display="none";
				} else {
					document.getElementById("nocurrent").style.display="block";
					document.getElementById("current").style.display="none";
				}
				arrayList2.push(20);
			}
			
		}; 
	
		document.getElementById("green4").onclick=function(){
			if (dianbi.value == "电笔") {
				if (green4isClick == false) {
					color="rgb(0,255,0)";
					linewidth=5;
					drawline($('#green4').offset().left+6,$('#green4').offset().top,$('#green4').offset().left+6,620,ctx);
					green4isClick = true;
					arrayList2.push(6);
				} else {
					//撤去绿线
					//alert("被点击过");
					color="rgb(199,236,205)";
					linewidth=6;
					drawline($('#green4').offset().left+6,$('#green4').offset().top,$('#green4').offset().left+6,621,ctx);
					green4isClick = false;
					arrayList2.push(21);
				}
			} else {
				if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
					document.getElementById("current").style.display="block";
					document.getElementById("nocurrent").style.display="none";
				} else {
					document.getElementById("nocurrent").style.display="block";
					document.getElementById("current").style.display="none";
				}
				arrayList2.push(20);
			}
			
		};
		document.getElementById("red4").onclick=function(){
			if (dianbi.value == "电笔") {
				if (red4isClick == false) {
					color="rgb(255,0,0)";
					linewidth=5;
					drawline($('#red4').offset().left+6,$('#red4').offset().top,$('#red4').offset().left+6,610,ctx);
					arrayList2.push(6);
					red4isClick = true;
				} else {
					//撤去红线
					color="rgb(199,236,205)";
					linewidth=6;
					drawline($('#red4').offset().left+6,$('#red4').offset().top,$('#red4').offset().left+6,611,ctx);
					red4isClick = false;
					arrayList2.push(21);
				}
			} else {
				if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true) {
					document.getElementById("current").style.display="block";
					document.getElementById("nocurrent").style.display="none";
				} else {
					document.getElementById("nocurrent").style.display="block";
					document.getElementById("current").style.display="none";
				}
				arrayList2.push(20);
			}
		}; 
		
	}; 
	
	/**第十六步 按控制电机的按钮开关启动键，如电机工作正常，再按停止键。**/
	document.getElementById("dianjikai").onclick=function(){
		if (poweron1 == 1 && onit == 1 && yellow4isClick == true && yellow2isClick == true && green4isClick == true && green2isClick == true && red4isClick == true && red2isClick == true 
				&& yellowisClick == true && yellow3isClick == true && greenisClick == true && green3isClick == true && redisClick == true && red3isClick == true ) {
			document.getElementById("dianjizhuandong").style.display="block";
			document.getElementById("dianjitingzhi").style.display="none";
		} else {
			document.getElementById("dianjizhuandong").style.display="none";
			document.getElementById("dianjitingzhi").style.display="block";
		}		
		arrayList2.push(16);
	};
	document.getElementById("dianjiguan").onclick=function(){
		document.getElementById("dianjitingzhi").style.display="block";
		document.getElementById("dianjizhuandong").style.display="none";
		arrayList2.push(16);
	};
	
	
	
	/**第十九步 指示牌正面朝外挂回 嵌入到第十一步中 **/
	/**第二十步 用电笔对模拟盘电源输入端验电 嵌入到第十四步中**/
	/**第二十一步 从总电源箱拔出黄色电源线插头		从总电源箱拔出绿色电源线插头	从总电源箱拔出红色电源线插头**/
	/**第二十二步 拆黄色电机电源线。拆绿色电机电源线。拆绿色电机电源线。 **/
	/**第二十三步 拆电机地线。**/
	/**第二十四步 拆电源地线，先拨总电源开关箱的地线插头。**/
	/**第二十五步 拆电源地线，再拔出操作盘上的地线插头。**/
	/**第二十六步 按指示牌确认按钮，这一步没有设计，直接通过结束按钮就结束了**/
	
	
	
	
	
	
};



	
	
	
	//跳转到首页的方法
	function IndexJump(){
		window.location.href="index.jsp";
	};
	//开始操作按钮的一些功能
	function StartGame(){
		//这里是为了清除没有点开始操作的操作
		/* if(location.href.indexOf('#reloaded')==-1){ //判断是否有刷新标记
		    location.href=location.href+"#reloaded";//没有添加标记
		    location.reload();//刷新
		    alert('请再次点击"开始考试"按钮，进行考试');
		}else{ */
		var s = window.document.getElementById("startgame");
		if(isClick = true){
			if(s.value == "开始操作"){
				if (arrayList2.length == 0) {
					alert("开始考试，祝您考试顺利！");
				} else {
					location.reload();
				}
				
			}else{
				//这里定义一个全局的数组来有序的存储操作步骤的序号，并进行判定成绩是否是合格
				<%-- <%!ArrayList<Integer> arrayList1 = new ArrayList<Integer>();%>
						<%for(int i = 1; i < 26; i++){
							arrayList1.add(i);
						} 
						//System.out.println(arrayList1);						
						%> --%>
				
				
				//alert(arrayList1[3]);
				//alert(arrayList2);
				//去除数组2中重复的数字
				//获取数组2中的每一个元素
				for(var i=0 ; i<arrayList2.length ; i++){
					//console.log(arrayList2[i]);
					/*获取当前元素后的所有元素*/
					for(var j=i+1 ; j<arrayList2.length ; j++){
						//console.log("---->"+arr[j]);
						//判断两个元素的值是否相等
						if(arrayList2[i] == arrayList2[j]){
							//如果相等则证明出现了重复的元素，则删除j对应的元素
							arrayList2.splice(j,1);
							//当删除了当前j所在的元素以后，后边的元素会自动补位
							//此时将不会在比较这个元素吧，我需要在比较一次j所在位置的元素
							//使j自减
							j--;
						}
					}
				}
				//alert(arrayList2);
				//定义一个新的用来做对比的数组
				var arrayList1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
				//var arrayList1 = [1]
				//这里是判断考试考么考过
				arrayList1 = arrayList1.toString();
				arrayList2 = arrayList2.toString();
				if(arrayList2 == arrayList1){
					//alert("恭喜你！考试通过！");
					location.href="pass.jsp";
				}else {
					//alert("抱歉，考试未通过");
					location.href="nopass.jsp"
				}
			
					
				//IndexJump();
			}		
		}else{
			/*这个地方需要写一些用户没有点击开始考试的情况下需要执行的操作  (待添加)*/
			alert("点击开始按钮，开始考试");
		}
		s.value = "结束操作";
		
	/* } */
	
	};
	
</script>

<style type="text/css">
	.Idx {
		position:absolute;
        left: 1400px;
        margin-top: 520px;
        height:38px;
        width:90px;
	}
	.startgame {
		position:absolute;
        left: 1400px;
        margin-top: 400px;
        /*transform: translate(-50%, -50%);*/
        height:38px;
        width:90px;
	}
	.requesttosend {
		position:absolute;
        left: 1400px;
        margin-top: 300px;
        height:38px;
        width:100px;
	}
	.inreverse {
		position:absolute;
		left: 1135px;
        margin-top: 90px;
        height:30px;
        width:115px;
	}
	
	body {
		background-image:url(images/bg.png);
		background-size:100%;
		margin:0;
		padding:0;
	}
	div { margin:0; padding:0;}
	.confirmationsign {
		position:absolute;
		left: 1135px;
        margin-top: 280px;
       /* transform: translate(-50%, -50%); */ 
        height:38px;
        width:115px;
	}
	
	.fangzhizhishipai {
		position:absolute;
        left: 1370px;
        margin-top: 70px;
       	
	}
	
	.zhishipai{
		position:absolute;
		left:1135px;
        margin-top: 125px;
       /* transform: translate(-50%, -50%);*/
        height:150px;
        width:115px;
	}
	
	.dianji img {
		position:absolute;
		width:180px;
		height:110px;
		margin-top:500px;
		padding-left:20px;
	}
	.jiexianduanziban img{
		position:absolute;
		width:541px;
		height:180px;
		margin-top:420px;
		padding-left:550px;
	}
	
	.gsocket {
		position:absolute;
		padding-left:1000px; 
		margin-top:500px;	
		height:18px;
        width:70px;
       
	}
	.dixianchakong {
		border:2px solid #808080;
	}
	
	.leftzhishipai {
		position:absolute;
		left:1260px;
        margin-top: 125px;
	}
	
	.dianjidi {
		position:absolute;
		padding-left:200px; 
		margin-top:580px;
	}
	
	.table1 {
		position:absolute;
		margin-top:10px;  /* 外边距50px */
		margin-left:430px;
		border:5px solid blue;
		border-collapse:collapse;
	}
	
	tr {
		border:10px solid blue;
		cellspacing:0px;
		cellpadding:0px;
	}
	
	.dianjichakou {
		position:absolute;
		padding-left:50px; 
		margin-top:610px;
	}
	
	.jieduanban1 {
		position:absolute;
		margin-top:562px;
		padding-left:730px; 
		
	}
	.jieduanban2 {
		position:absolute;
		margin-top:564px;
		padding-left:550px; 
	}
	
	.off {
		width:177px;
		height:125px;
	}
	.on {
		width:177px;
		height:125px;
		display:none;
	}

	.fuseprotector1,img {
		width:173px;
		height:125px;
	}
	.fuseprotector2 {
		width:173px;
		height:125px;
	}
	
	.bulb {
		position:absolute;
		left: 1400px;
        margin-top: 300px;
        width:50px;
        height:50px;
       	display: none;
	}
	.zhishipai2 {
		position:absolute;
		left:1135px;
        margin-top: 125px;
       /* transform: translate(-50%, -50%);*/
        height:150px;
        width:115px;
        display: none;
	}
	.powerc {
		position:absolute;
		left:1100px;
        margin-top: 182px;
       
	}
	.poweroff {
		position:absolute;
		left:1135px;
        margin-top: 125px;
       /* transform: translate(-50%, -50%);*/
        height:150px;
        width:115px;
	}
	.poweron {
		position:absolute;
		left:1135px;
        margin-top: 125px;
       /* transform: translate(-50%, -50%);*/
        height:150px;
        width:115px;
        display:none;
	}
	.dianbi {
		position:absolute;
		left:1140px;
        margin-top:350px;
        height:25px;
        width:80px;
	}
	.image_XY {
		position:absolute;
		left:1162px;
        margin-top:380px;
        height:260px;
        width:40px;
	}
	.contactor {
		width:172px;
		height:110px;
	}
	.thermalrelay{
		width:190px;
		height:125px;
	}
	.jiechuqi {
		display:inline;
		position:absolute;
		left:231px;
		top:157px;
	}
	.current {
		position:absolute;
		left:220px;
        margin-top:150px;
        width:240px;
        height:160px;
      	display:none;
	}
	.nocurrent {
		position:absolute;
		left:220px;
        margin-top:150px;
        width:240px;
        height:160px;
        display:none;
	}
	.dianjizhuandong {
		position:absolute;
		left:10px;
        margin-top:400px;
        width:200px;
        height:80px;
        display:none;
	}
	.dianjitingzhi {
		position:absolute;
		left:10px;
        margin-top:400px;
        width:200px;
        height:80px;
        display:none;
	}
	.rongduanqi {
		position:absolute;
		left:434px;
        margin-top:86px;
	}
	.motorswitch {
		position:absolute;
		border:2px solid #9999CC;
		background-color:#C7ECCD;
		left:1030px;
        margin-top:420px;
	}
	.motorswitch,img {
		width:30px;
		height:30px;
	}
</style>
</head>

<body>
	<img src="images/dianbi.jpg" class="image_XY" />
	
	<button onclick=javascrtpt:IndexJump() class="Idx" >返回首页</button>
	<input class="startgame" id="startgame" type="button" value="开始操作" onclick="javascrtpt:StartGame(this)" /> 
	<input class="confirmationsign" id="confirmationsign" type="button" value="确认挂牌已悬挂" onclick="javascrtpt:ConfirmationSign(this)" />
	<input class="fangzhizhishipai" id="fangzhizhishipai" type="button" value="挂牌放置" />
	<input class="requesttosend" id="requesttosend" type="button" value="报告请求送电" onclick="javascrtpt:void(0)" />
	<input class="inreverse" id="inreverse" type="button" value="反扣指示牌" onclick="javascrtpt:InReverse(this)" />
	<input class="dianbi" id="dianbi" type="button" value="电笔" onclick="" />
	
	<div>
		<img class="poweroff" id="poweroff" src="images/poweroff.png" />
	</div>
	<div>
		<img class="poweron" id="poweron" src="images/poweron.png" />	
	</div>
	<div class="powerc">
		<div><input class="poweron1" id="poweron1" type="button" value="开"/></div><br>
		<div><input class="poweroff1" id="poweroff1" type="button" value="关"/></div>
	</div>
	<div>
		<img class="zhishipai" id="zhishipai"src="images/zhishipai.jpg"/>
	</div>
	<div class="dianji">
		<img  src="images/dianji.jpg" />
	</div>
	<div class="jiexianduanziban">
		<img alt="" src="images/jiexianduanziban.png" />
	</div>
	<div>
		<img class="bulb" id="bulb" src="images/bulb.jpg" />
	</div>
	<div>
		<img class="current" id="current" src="images/current.png" />
	</div>
	<div>
		<img class="nocurrent" id="nocurrent" src="images/nocurrent.png" />
	</div>
	<div>
		<img class="dianjizhuandong" id="dianjizhuandong" src="images/dianjizhuandong.png" />
	</div>
	<div>
		<img class="dianjitingzhi" id="dianjitingzhi" src="images/dianjitingzhi.png" />
	</div>
	<div>
		<img class="zhishipai2" id="zhishipai2" src="images/zhishipai2.jpg" />
	</div>

	<table class="table1" align='center'>
		<tbody>
		<tr>
			<td>
			<div class="onit"><input id="onit" type="button" name="buttion1" value="开" onclick=""/></div><br/>
			<div class="offit"><input id="offit" type="button" name="buttion2"  value="关" onclick=""/></div>
			</td>
			<td>
			<div><img class="off" id="off" src="images/off.png" /></div>
			<div><img class="on" id="on" src="images/on.png" /></div>
			</td>
			<td>
			<div><img class="fuseprotector1" src="images/fuseprotector1.png"/></div>
			</td>
			<td>
			<div class="rongduanqi" >
			<input class="rongduanqi1" id="rongduanqi1" type="radio" value="1"/>
			<input class="rongduanqi2" id="rongduanqi2" type="radio" value="2"/>
			</div>
			<div><img class="fuseprotector2" src="images/fuseprotector2.png"/></div>
			</td>
		</tr>
		
		<tr>
		<td></td>
		<td></td>
		<td>
		<div class="jiechuqi" >
			<input class="jiechuqi1" id="jiechuqi1" type="radio" value="1"/>
			<input class="jiechuqi2" id="jiechuqi2" type="radio" value="2"/>
			<input class="jiechuqi3" id="jiechuqi3" type="radio" value="3"/>
		</div>
		<div><img class="contactor" src="images/second.jpg"/></div>
		</td>
		<td></td>
		</tr>
		
		<tr>
		<td></td>
		<td></td>
		<td><div><img class="thermalrelay" src="images/third.jpg"/></div></td>
		<td></td>
		</tr>
		</tbody>
	</table>
	
	<table class="motorswitch">
		<tr><td><img src="images/green.png" /></td><td><input class="dianjikai" id="dianjikai" type="button" value="开启电机" /></td></tr>
		<tr><td><img src="images/red.png" /></td><td><input class="dianjiguan" id="dianjiguan" type="button" value="关闭电机" /></td></tr> 
	</table>
	

	<!--这里画连接线  -->
	<!--<div id="canvastest">canvas测试</div>  -->
	<div class="gsocket" id="gsocket" style="display:inline">
	<div> 地线插孔</div>
	<div class="dixianchakong">
	<input class="leftdi" id="leftdi" type="radio"   value=""/>
	<input class="rightdi" id="rightdi" type="radio" style="float:right" value=""/>
	</div>
	</div>
	
	<div class="dianjidi">地线接口<br/><input class="leftdi2" id="leftdi2" type="radio"/></div>
	
	<div class="leftzhishipai">
	<div>黄<input class="yellow2" id="yellow2" type="radio" value="1"/></div><br>
	<div>绿<input class="green2" id="green2" type="radio" value="2"/></div><br>
	<div>红<input class="red2" id="red2" type="radio" value="3"/></div><br>
	<div><input class="rightdi2" id="rightdi2" type="radio" value="4"/></div>
	</div>
	
	<div class="jieduanban1" style="display:inline">
	<input class="yellow3" id="yellow3" type="radio" value="1" style="margin-right:6px;"/>
	<input class="green3" id="green3" type="radio" value="2" style="margin-right:9.5px;"/>
	<input class="red3" id="red3" type="radio" value="3"/>
	</div>
	
	<div class="jieduanban2" style="display:inline">
	<input class="yellow4" id="yellow4" type="radio" name="yellow4" value="1" style="margin-right:6px;"/>
	<input class="green4" id="green4" type="radio" value="2" style="margin-right:9.5px;"/>
	<input class="red4" id="red4" type="radio" value="3"/>
	</div>
	
	<div class="dianjichakou" style="display:inline">
	<input class="yellow" id="yellow" type="radio" value="1"/>黄  
	<input class="green" id="green" type="radio" value="2"/>绿  
	<input class="red" id="red" type="radio" value="3"/>红 
	</div>
	
	<canvas id="canvas"></canvas>
</body>
</html>