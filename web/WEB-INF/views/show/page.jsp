
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="/sources/ico/${page}.ico"  />
    <%@ include file="/WEB-INF/views/inc/link.jsp" %>

</head>
<body>

<!-- 引入主页头部 -->
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

<c:choose>
    <c:when test="${page eq pageutils.home}">
        <!-- 引入主页界面 -->
        <title>欢迎您！请欣赏音乐</title>
        <%@ include file="/WEB-INF/views/container/home.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.mvshowall}">
        <!-- 引入所有MV界面 -->
        <title>所有MV</title>
        <%@ include file="/WEB-INF/views/container/mv-showall.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.mvranking}">
        <!-- 引入MV排行榜界面 -->
        <title>MV排行</title>
        <%@ include file="/WEB-INF/views/container/mv-ranking.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.mvgroups}">
        <!-- 引入MV分类界面 -->
        <title>MV分类</title>
        <%@ include file="/WEB-INF/views/container/mv-groups.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.songshowall}">
        <!-- 引入所有歌曲界面 -->
        <title>所有歌曲</title>
        <%@ include file="/WEB-INF/views/container/song-showall.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.songranking}">
        <!-- 引入歌曲排行界面 -->
        <title>歌曲排行</title>
        <%@ include file="/WEB-INF/views/container/song-ranking.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.songgroups}">
        <!-- 引入歌曲分类界面 -->
        <title>歌曲分类</title>
        <%@ include file="/WEB-INF/views/container/song-groups.jsp" %>
    </c:when>

    <%--<c:when test="${page eq pageutils.personalsong}">--%>
        <%--<!-- 引入一展歌喉界面 -->--%>
        <%--<%@ include file="/WEB-INF/views/container/personal-song.jsp" %>--%>
    <%--</c:when>--%>

    <%--<c:when test="${page eq pageutils.personalmv}">--%>
        <%--<!-- 引入唯美画面界面 -->--%>
        <%--<%@ include file="/WEB-INF/views/container/personal-mv.jsp" %>--%>
    <%--</c:when>--%>

    <c:when test="${page eq pageutils.allartist}">
        <!-- 引入所有歌手界面 -->
        <title>所有歌手</title>
        <%@ include file="/WEB-INF/views/container/artist-showall.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.advice}">
        <!-- 引入评价和建议界面-->
        <title>评价与建议</title>
        <%@ include file="/WEB-INF/views/container/say-advice.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.complain}">
        <!-- 引入举报界面-->
        <title>请慎重举报</title>
        <%@ include file="/WEB-INF/views/container/say-complain.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.search}">
        <!-- 引入搜索界面-->
        <title>查询结果</title>
        <%@ include file="/WEB-INF/views/container/search.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.notice}">
        <!-- 引入通知公告界面 -->
        <title>通知公告</title>
        <%@ include file="/WEB-INF/views/container/notice.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.register}">
        <!-- 引入注册界面 -->
        <title>注册用户</title>
        <%@ include file="/WEB-INF/views/container/register.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.usercenter}">
        <!-- 引入个人中心界面 -->
        <title>个人中心</title>
        <%@ include file="/WEB-INF/views/container/user-center.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.usersetting}">
        <!-- 引入设置中心界面-->
        <title>设置中心</title>
        <%@ include file="/WEB-INF/views/container/user-setting.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.mvplayer}">
        <!-- 引入MV播放界面 -->
        <title>正在播放MV</title>
        <%@ include file="/WEB-INF/views/container/mv-player.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.songplayer}">
        <!-- 引入单首歌曲播放界面 -->
        <title>正在播放歌曲</title>
        <%@ include file="/WEB-INF/views/container/song-player.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.album}">
        <!-- 引入专辑界面-->
        <title>专辑</title>
        <%@ include file="/WEB-INF/views/container/album.jsp" %>
    </c:when>

    <c:when test="${page eq pageutils.artist}">
        <!-- 引入单个歌手界面-->
        <title>歌手</title>
        <%@ include file="/WEB-INF/views/container/artist.jsp" %>
    </c:when>
</c:choose>



<%--引入播放器--%>
<%@ include file="/WEB-INF/views/inc/player.jsp" %>

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
</body>
</html>