<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
  <c:when test="${sessionScope.sex eq 'M' }">
    <c:set var="defaultImageUrl" value="/img/pic/male.jpg"></c:set>
  </c:when>
  <c:when test="${sessionScope.sex eq 'F' }">
    <c:set var="defaultImageUrl" value="/img/pic/female.jpg"></c:set>
  </c:when>
</c:choose>
<div id="temp_title">
  <h1 id="navigationTitle"></h1>
<c:if test="${!empty sessionScope.seqPartner}">
  <a href="#" onclick="history.go(-1); return false" class="back">이전</a>
  <a href="#" class="hamburger">메뉴</a>
</c:if>
  <!-- Hamburger Menu -->
  <div class="article">
    <!-- Profile -->
    <div class="profile">
      <p class="pic"><img src="${sessionScope.imgUrl}" alt="" onError="this.onerror=null;this.src='${defaultImageUrl}';"></p>
      <div class="info">
        <p>${sessionScope.name}</p>
        <p>${sessionScope.email}</p>
      </div>
    </div>
    <!-- // Profile -->
    <div class="menu">
      <ul>
        <li><a href="/scheduleView/scheduleList" class="menuLink">스케줄</a></li>
        <li><a href="/reservation/index" class="menuLink">예약하기</a></li>
        <li><a href="/timeline/" class="menuLink">타임라인</a></li>
        <!-- li><a href="#" class="menuLink">설정</a></li-->
        <li><a href="/signMember/signOut" class="menuLink">로그아웃</a></li>
      </ul>
    </div>
    <div class="my_center">
      <ul>
        <c:forEach items="${sessionScope.memberInfo}" var="memberInfo">
          <li><a href="/reservation/selectPartner?seqPartner=${memberInfo.SEQ_PARTNER}&seqMember=${memberInfo.SEQ_MEMBER}" class="<c:if test="${memberInfo.SEQ_PARTNER eq seqPartner}">active</c:if>">${memberInfo.PARTNER_NAME}</a></li>
        </c:forEach>
      </ul>
    </div>
  </div>
  <!-- // Hamburger Menu -->
</div>
<!-- // 상단 고정 영역 -->
<script>
    var pathname = $(location).attr('pathname');

    if(pathname.indexOf('scheduleView') != -1) {
        $('.menuLink:eq(0)').addClass('active');
    } else if(pathname.indexOf('reservation') != -1) {
        $('.menuLink:eq(1)').addClass('active');
    } else if(pathname.indexOf('timeline') != -1) {
        $('.menuLink:eq(2)').addClass('active');
    } else {
//        $('.menuLink:eq(3)').addClass('active');
    }
</script>