<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/inc/meta.jsp" %>

<link rel="stylesheet" type="text/css" href="${ctx}/static/css/user/register.css"/>

<div id="myParCont">
    <div class="row" id="content">
        <div class="vbox">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-8" id="register_content">
                    <!--头像信息-->
                    <div class="clearfix text-center m-t">
                        <div class="inline">
                            <div class="easypiechart" data-percent="75" data-line-width="5" data-bar-color="#4cc0c1" data-track-Color="#f5f5f5" data-scale-Color="false" data-size="134" data-line-cap='butt' data-animate="1000">
                                <div class="thumb-lg" id="userposter">
                                    <img src="${currentUser.userposter}" class="img-circle" width="150" height="150" alt="...">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <!-- 基本信息填写 -->
                    <small class="text-muted m-b">
                        <form action="${ctx}/user/changepwd" class="bs-example form-horizontal" id="pwd_form"  method="post" enctype="multipart/form-data" onsubmit="return check(this)">

                            <div class="form-group" style="display: none">
                                <label class="col-lg-2 col-md-2 control-label" for="username">用户名：</label>
                                <div class="col-lg-9 col-md-9">
                                    <input type="text" name="username" id="username" class="form-control" value="${currentUser.username}" title="用户名"  placeholder="请填写用户名" required="required">
                                </div>
                                <div class="col-lg-1 col-md-1 flag-img-box" id="username_flag">

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="oldpassword">原先密码：</label>
                                <div class="col-lg-9 col-md-9">
                                    <input type="password" name="oldpassword" id="oldpassword"  title="密码" class="form-control" value="" placeholder="请填写原先密码密码" required="required">
                                </div>
                                <div class="col-lg-1 col-md-1 flag-img-box" id="oldpassword_flag">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="password">新密码：</label>
                                <div class="col-lg-9 col-md-9">
                                    <input type="password" name="password" disabled="disabled" id="password"  title="密码" class="form-control" value="" placeholder="请填写密码" required="required">
                                </div>
                                <div class="col-lg-1 col-md-1 flag-img-box" id="password_flag">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="password">确认新密码：</label>
                                <div class="col-lg-9 col-md-9">
                                    <input type="password" name="repassword" id="repassword" disabled="disabled"  title="密码" class="form-control" value="" placeholder="请确认密码" required="required">
                                </div>
                                <div class="col-lg-1 col-md-1 flag-img-box" id="repassword_flag">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-9 col-md-offset-2 col-md-9">
                                    <input type="submit" id="sumbit" class="btn btn-primary text-right" disabled="disabled" value="修改密码"/>
                                </div>
                            </div>
                        </form>
                    </small>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
        <script src="${ctx}/static/js/user/changepwd.js" type="text/javascript" charset="utf-8"></script>
    </div>
</div>


