<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="/sources/ico/manage.ico"  />
    <%@ include file="/WEB-INF/views/inc/link.jsp" %>

</head>
<body>
<%@ include file="/WEB-INF/views/manage/head.jsp" %>

<c:choose>
    <c:when test="${page eq pageutils.manage_user_show}">
        <!-- 引入用户管理界面-->
        <title>用户管理</title>
        <%@include file="/WEB-INF/views/manage/user/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/user/show.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_music_show}">
        <!-- 引入音乐管理界面-->
        <title>音乐管理</title>
        <%@include file="/WEB-INF/views/manage/music/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/music/show.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_music_add}">
        <!-- 引入增加音乐信息界面-->
        <title>添加音乐</title>
        <%@include file="/WEB-INF/views/manage/music/add.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_music_edit}">
        <!-- 引入音乐修改界面-->
        <title>音乐修改</title>
        <%@include file="/WEB-INF/views/manage/music/edit.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_advice_show}">
        <!-- 引入留言管理界面-->
        <title>留言管理</title>
        <%@include file="/WEB-INF/views/manage/advice/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/advice/show.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_noticy_show}">
        <!-- 引入通知信息管理界面-->
        <title>通知管理</title>
        <%@include file="/WEB-INF/views/manage/noticy/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/noticy/show.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_noticy_add}">
        <!-- 引入发布通知界面-->
        <title>发布通知</title>
        <%@include file="/WEB-INF/views/manage/noticy/add.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_noticy_edit}">
        <!-- 引入修改通知公告-->
        <title>修改通知</title>
        <%@include file="/WEB-INF/views/manage/noticy/edit.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_complain_show}">
        <!-- 引入用户管理-->
        <title>用户管理</title>
        <%@include file="/WEB-INF/views/manage/complain/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/complain/show.jsp"%>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${page eq pageutils.manage_super_show}">
        <!-- 引入超管界面-->
        <title>超级管理</title>
        <%@include file="/WEB-INF/views/manage/supermanage/look.jsp"%>
        <%@ include file="/WEB-INF/views/manage/supermanage/show.jsp"%>
    </c:when>
</c:choose>

</body>
</html>