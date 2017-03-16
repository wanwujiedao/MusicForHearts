<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script src="${ctx}/static/js/user/usercenter.js"></script>
<link href="${ctx}/static/css/user/user-center.css" rel="stylesheet"/>


<ul id="usercenter-menu" class="col-xs-10 col-xs-offset-1">
    <li data-menuanchor="user-basicmsg"><a name="#user-basicmsg">我的档案</a></li>
    <li data-menuanchor="user-musiclist"><a name="#user-musiclist">我的音乐</a></li>
    <li data-menuanchor="user-noticy"><a name="#user-noticy">我的通知</a></li>
    <li data-menuanchor="user-apply"><a name="#user-apply">我的申请</a></li>
</ul>
<div id="usercenter">
    <div class="dao-section" id="user-basicmsg">

        <%@include file="/WEB-INF/views/user/user-basicmsg.jsp" %>

    </div>

    <div class="dao-section" id="user-musiclist">
        <div class="dao-slide user-mv">
            <button class="slidemybtn" id="user-song">song</button>
            <div class="mvlist-wrap  col-xs-offset-1">
                <div id="mvlist" ></div><div class="page"></div>
            </div>
        </div>
        <div class="dao-slide user-song">
            <button class="slidemybtn" id="user-mv">mv</button>
            <div class="songlist-wrap col-xs-10 col-xs-offset-1">
                <table class="table table-striped" id="songlist"> </table> <div class="songpage"></div>
            </div>

        </div>
    </div>

    <div class="dao-section" id="user-noticy">
       <%@ include file="/WEB-INF/views/user/user-noticy.jsp" %>

    </div>

    <div class="dao-section" id="user-apply"> <%@ include file="/WEB-INF/views/user/user-apply.jsp" %></div>
</div>

