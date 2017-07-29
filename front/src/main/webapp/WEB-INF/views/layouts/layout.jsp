<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no" />
	<title>BODY CODI for Members</title>

	<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>">
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/jquery-ui.min.css'/>"/>

	<script src="<c:url value='/jquery/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/jquery/jquery-ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ui.js'/>"></script>
	<script src="<c:url value='/jquery/jquery.scrollstop.js'/>"></script>
</head>
<body>

<div id="wrap">
	<!-- tiles header -->
	<tiles:insertAttribute name="header" />
	<!-- // tiles header -->

	<!-- ì½íì¸  ìì­ -->
	<!-- tiles body -->
	<tiles:insertAttribute name="body" />
	<!-- // tiles body -->
	<!-- //ì½íì¸  ìì­ -->
</div>

</body>
</html>