<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="${ctx}/static/js/user/usersetting.js"></script>
<link href="${ctx}/static/css/user/user-center.css" rel="stylesheet"/>


<ul id="usercenter-menu" class="col-xs-10 col-xs-offset-1">
    <li data-menuanchor="user-basicmsg"><a name="#user-basicmsg">资料管理</a></li>
    <li data-menuanchor="user-musiclist"><a name="#user-musiclist">音乐管理</a></li>
    <li data-menuanchor="user-noticy"><a name="#user-noticy">消息回收</a></li>
</ul>
<div id="usercenter">
    <div class="dao-section" id="user-basicmsg">
        <div class="dao-slide user-msg">
            <button class="slidemybtn" id="user-pwd">密码修改</button>
            <%@include file="/WEB-INF/views/user/userbasicmsg-setting.jsp" %>
        </div>
        <div class="dao-slide user-pwd">
            <button class="slidemybtn" id="user-msg">基本资料</button>

            <%@include file="/WEB-INF/views/user/userpwd-setting.jsp" %>
        </div>


    </div>

    <div class="dao-section" id="user-musiclist">

    </div>

    <div class="dao-section" id="user-noticy">

        <%@include file="/WEB-INF/views/user/usernoticy-setting.jsp" %>
    </div>


</div>

