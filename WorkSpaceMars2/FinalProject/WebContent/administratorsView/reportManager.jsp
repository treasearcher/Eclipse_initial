

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
	//basePath : the  ROOT of this APP
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- do NOT move Pre 3 metas tag -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="tcal.css" />
	<script type="text/javascript" src="tcal.js"></script> 

<title>公司主页</title>

<!-- Bootstrap -->
<link href="${ basePath}css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript">
	function generateProbationReport(){
		var flag=confirm("确定生成实习生报表？");
		if(flag)condition(1);
	}
	function generateWorkerReport(){
		var flag=confirm("确定生成在职员工报表？");
		if(flag)condition(2);
	}
	function generateNoWorkerReport(){
		var flag=confirm("确定生成离职员工报表？");
		if(flag)condition(3);
	}
	function generateChangeReport(){
		var flag=confirm("确定生成变更记录报表？");
		if(flag)condition(4);
	}
	function condition(downloadType){
		document.getElementById('div').innerHTML="<form action=\"../report/report_download.action?downloadType="+downloadType+"\" method=\"post\">"
			+"<input name=\"dnm\" /><input type=\"submit\" value=\"保存\" /></form><button onclick=\"cancel()\" value=\"取消\">取消</button>";
	}
	function cancel(){
		document.getElementById('div').innerHTML="";
	}
</script>
</head>
<body style="background-color:#F0F8FF">
	<!-- HTML HERE -->
	<!-- HTML HERE -->
<ul id="myTab" class="nav nav-tabs">
    <li><a onclick="generateProbationReport()" data-toggle="tab">生成实习生报表</a></li>
    <li><a onclick="generateWorkerReport()" data-toggle="tab">生成在职员工报表</a></li>
    <li><a onclick="generateNoWorkerReport()" data-toggle="tab">生成离职员工报表</a></li>
    <li><a onclick="generateChangeReport()" data-toggle="tab">生成变更记录报表</a></li>
</ul>
<form action="#">
		<!-- add class="tcal" to your input field -->
		<div><input type="text" name="date" class="tcal" value="" />
			<input type="text" name="date" class="tcal" value="" />
		</div>
	</form>

	<!-- END HTML -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="${ basePath}js/jquery-min-1.12.4.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->