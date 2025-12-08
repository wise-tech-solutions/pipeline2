<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TechLink Academy- Home Page</title>
<link href="images/techlink.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to LinkPay Web Application Project.</h1>
<h2 align="center">We are developing and supporting quality Software Solutions to clients globally.
	           We are raising billionaires IT professionals accross the nations of the World.
	We offer Training for DevOps with Linux, Kubernetes and Cloud, equipping IT Engineers for best performance.
        TechLink Academy - Your Link To A Bold New World of Technology.
	Session 102 will start on June 17, 2024.
        Please invite all your contacts and friends for this life changing course.
</h2>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
		
</h1>
	
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/techlink.jpg" alt="" width="150">
	</span>
	<span style="font-weight: bold;">
                TechLink Academy, 
		Dallas, Texas
		+1 309-610-0057,
		info@upgrade101.net
		<br>
		<a href="mailto:techlink237@gmail.com">Mail to TechLink Academy</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center> TechLink Academy - Consultant, Training and Software Development</p>
<p align=center><small>Copyrights 2024 by <a href="https://upgrade101.net/">TechLink Academy</a> </small></p>

</body>
</html>
