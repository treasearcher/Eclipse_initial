<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,com.kms.po.Change"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
	//basePath : the  ROOT of this APP
	List<Change> list=(List<Change>)session.getAttribute("list");
	pageContext.setAttribute("list", list);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>部门管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	

  

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,300' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">

	<link rel="stylesheet" href="css/style.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		<div id="fh5co-header">
			<div class="top">
				<div class="container">
					<span> <a href="#"><i>@</i> info@freehtml5.co</a></span>
					<span> <a href="tel://+12345678910"><i class="icon-mobile3"></i> 123 4567 8910</a></span>
				</div>
			</div>
			<!-- end:top -->
			<header id="fh5co-header-section">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<h1 id="fh5co-logo"><a href="index.html">Welcome</a></h1>
						<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active">
								<a href="index.html">管理主页</a>
							</li>
							<!-- <li>
								<a href="portfolio.html">正式员工管理</a>
							</li> -->
							<li>
								<a style="cursor:pointer" class="fh5co-sub-ddown">员工管理</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="../administratorsView/jobInfo_list.action">员工调动管理</a></li>
								 	<li><a href="../work/worker_list">员工信息管理</a></li>
								 	<li><a href="../report/report_download.action?downloadType=2">生成在职员工报表</a></li>
								</ul>
							</li>
							<li>
								<a style="cursor:pointer" class="fh5co-sub-ddown">实习生管理</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="../probation/apply_applist.action">实习资格审核</a></li>
								 	<li><a href="../probation/probation_list">实习生调动管理</a></li>
								 	<li><a href="../report/report_download.action?downloadType=1">生成实习生报表</a></li>
								</ul>
							</li>
							<li>
								<a style="cursor:pointer" class="fh5co-sub-ddown">部门/岗位管理</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="../dept/dept_listdept.action">部门管理</a></li>
								 	<li><a href="../position/position_listposition.action">岗位管理</a></li>
								</ul>
							</li>
							<li>
								<a style="cursor:pointer" class="fh5co-sub-ddown">变更记录管理</a>
								 <ul class="fh5co-sub-menu">
								 	<li><a href="../change/change_listChange.action">变更记录查询</a></li>
								 	<li><a href="changeReport.html">生成变更记录报表</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
				</div>
			</header>
			
		</div>
		
		
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" style="background-image: url(images/work-1.jpg);">
				<div class="desc animate-box">
	<table class="table">
		<caption><h4>部门信息表</h4></caption>
		<thead>
			<th>部门编号</th>
			<th>部门名称</th>
			<th>部门员工数</th>
		</thead>
		<tbody>
			<c:if test="${ empty  requestScope.listDept}">
				<tr>
					<td colspan="3">没有部门信息</td>
				</tr>
			</c:if>
			<c:if test="${ not  empty  requestScope.listDept}">
				<c:forEach items="${  requestScope.listDept }" var="p">
					<tr>
						<td><b>${p.did }</b></td>
						<td> <b> id="${p.did }_1">${p.dnm }</b></td>
						<td> <b> id="${p.did }_2">${p.dnum }</b></td>
						
						<td> <b><a id="${p.did }"  onclick="writeEnable(this)" 
						style="cursor:pointer">编辑</a>
						<a name="${p.did }"  onclick="cancel(this)"
						style="cursor:pointer">取消编辑</a>
							<!-- <a name="${p.did }" onclick="keep(this)">保存</a> -->
							<!-- href="dept_update.action?did=${p.did }&dnm=${p.dnm}&dnum=${p.dnum}" -->
						<a name="${p.did }"  onclick="callAjax_del(this)"
						style="cursor:pointer">删除</a>
						<a href="dept_listperson.action?did=${p.did }">下属员工</a>
						</b></td>
						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot><a onclick="add()" style="cursor:pointer">添加</a></tfoot>
	</table>
				</div>
			</div>

		</div>
		<!-- END: header -->

		 <!-- <div id="fh5co-contact" class="animate-box">

			<div class="container">
				<form action="#">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Name">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Email">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<textarea name="" class="form-control" id="" cols="30" rows="7" placeholder="Message"></textarea>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<input type="submit" value="Send Message" class="btn btn-primary">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>  -->
		
		
		
		
		
	 <div id="fh5co-services">
			<div class="container">
				<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-browser"></i></span>
									<h3>Web Development</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-mobile"></i></span>
									<h3>Mobile Apps</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-tools"></i></span>
									<h3>UX Design</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-video"></i></span>
									<h3>Video Editing</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-search"></i></span>
									<h3>SEO Ranking</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="services animate-box">
									<span><i class="icon-cloud"></i></span>
									<h3>Cloud Based Apps</h3>
									<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								</div>
							</div>
						</div>
			</div>
		</div> 
		<!-- fh5co-work-section -->
		<!-- <div id="fh5co-start-project-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center animate-box">
						<h2>Start a Project</h2>
						<a href="#" class="btn btn-primary">Get in Touch</a>
					</div>
				</div>
			</div>
		</div>
		START a project

		<footer>
			<div id="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<p>Copyright 2016 Free Html5 <a href="#">Render</a>. All Rights Reserved. <br>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> / Demo Images: <a href="#">Unsplash</a></p>
						</div>
						<div class="col-md-6">
							<ul class="footer-menu">
								<li><a href="#">Home</a></li>
								<li><a href="#">Portfolio</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">About</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>
	

	</div>
	END fh5co-page

	</div> -->
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->

	<script src="${ basePath}js/jquery-min-1.12.4.js"></script>
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	</body>
	<script type="text/javascript">
var myLabel="";
var oldDnm=0;
var oldDnum=0;
var activeSum=0;

/**
 * 此函数供编辑操作用，当点击编辑按钮时，将对应行部门名称的html标签改为form表单使其可写并能传入后端
 */
	function writeEnable(label){
	/**
	 * activeSum代表正在编辑行的数目，如果它大于0(大于0的值一般是1)，则表示有一行编辑未完成，
	 * 提示用户将那一行的操作结束后再进行下一次编辑操作，既防止了页面出错也改善了用户体验
	 */
		if(activeSum>0){
			alert("请提交或取消您的编辑后再进行下一次编辑");
		}
		else{
			oldDnm=document.getElementById(label.id+"_1").innerHTML;
			document.getElementById(label.id+"_1").innerHTML="<form action=\"dept_update.action\" method=\"post\">"
			+"<input type=\"hidden\" name=\"did\" value=\""+label.id+"\" /><input name=\"dnm\" value=\""+ oldDnm+"\" /><input type=\"submit\" value=\"保存\" /></form>";
			myLabel=label;
			activeSum=1;
		}
	}
/**
 * 此函数供取消编辑操作用，当点击正在编辑行的取消编辑操作按钮时，对应在职信息行的部门编号、
 * 岗位编号和薪金处的html标签还原，并恢复编辑前的值，无需访问数据库
 */
	function cancel(label){
	//此处判断活动行是否大于0(为1)和点击取消编辑所在行和活动行是否为同一行，若成立，才允许取消操作进行
		if(activeSum>0&&myLabel.id==label.name){
			document.getElementById(label.name+"_1").innerHTML=oldDnm;
			//初始化供判断的值
			oldDnm=0;
			oldDnum=0;
			activeSum=0;
			myLabel="";
		}
	}
/**
 * //保存编辑结果
	function keep(label){
		if(activeSum>0&&myLabel.id==label.name){
			var newDnm=$("#_"+label.name+"_1").val();
			var newDnum=$("#_"+label.name+"_2").val();
			//初始化供判断的值
			oldDnm=0;
			oldDnum=0;
			activeSum=0;
			myLabel="";
			location="dept_update.action?did="+label.name+"&dnm="+newDnm+"&dnum="+newDnum;
		}
	}
 */
	
	
/**
 * 进行部门删除操作
 */
	/* function del(label){
		if(activeSum>0){
			alert("请编辑完成后再进行删除操作");
		}else{
			var flag=confirm("确定删除？");
			if(flag){
				location="dept_delete.action?dept.did="+label.name;
			}
		}
	} */
	var opObject;
	function getXMLHttpRequest(){
		return new XMLHttpRequest();
	}
	function responseAjax_del(){
		if(myRequest.readyState==4&&myRequest.status==200){
			opObject.remove();
		}else if(myRequest.readyState==4&&myRequest.status!=200){
			alert("删除失败");
		}
	}
	var myRequest=getXMLHttpRequest();
	function callAjax_del(label){
		if(activeSum>0){
			alert("请编辑完成后再进行删除操作");
		}else{
			var flag=confirm("确定删除？");
			if(flag){
				if(document.getElementById(label.name+"_2").innerHTML==0){
					opObject=$('#'+label.name).parent().parent();
					 var url="dept_delete.action?dept.did="+label.name;
					myRequest.open("GET",url,true);
					myRequest.onreadystatechange=responseAjax_del;
					myRequest.send(null);
				}else{
					alert('此部门还有员工，不能删除');
				}
			}
		}
	}
/**
 * 进行部门添加操作
 */
 	function add(){
		var flag=confirm("确定添加新部门？");
		if(flag)$("tfoot").before("<td></td><td><form action=\"dept_add.action\" method=\"post\">"
				+"<input name=\"dnm\" /><input type=\"submit\" value=\"保存\" /></form></td>")
		//if(flag)$("tfoot").before("<td></td><td><input /></td><td>0</td><td><a onclick=confirm()>保存</a></td>");
	}
 	//$("tfoot").before("<td></td><td><input /></td><td>0</td><td><a href=\"dept_add.action\" style=\"cursor:pointer\">保存</a></td>");
</script>
</html>
