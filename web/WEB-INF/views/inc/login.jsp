<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script type="text/javascript" src="${ctx}/static/js/inc/login.js"></script>
<link rel="stylesheet" href="${ctx}/static/css/inc/login.css"/>

<div id="login-wrap">
    <div class="login-shadow">
    </div>
    <div class="row">
        <div class="col-sm-4  col-sm-offset-4 login">
            <div style="color:red">
                <span id="close-login" class="glyphicon glyphicon-remove"></span>
                <h1>请登录账号</h1>

            </div>
            <form id="login-frm" action="${ctx}/user/islogin" class="form-horizontal" method="post" onsubmit="return check(this)">
                <div class="form-group  has-feedback">
                    <label for="username" class="control-label col-sm-3"><font color="#FFFFFF">登录名:</font></label>

                    <div class="col-sm-8">

                        <input name="username" id="username" type="text" value="" class="form-control"required="required" aria-describedby="ico" placeholder="请输入用户名"  title="登录名" />
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>

                    </div>
                </div>

                <div class="form-group  has-feedback">
                    <label for="password" class="control-label col-sm-3"><font color="#FFFFFF">密码:</font></label>
                    <div class="col-sm-8">
                        <input name="password" id="password" type="password" class="form-control" placeholder="请输入密码"  title="密码" aria-describedby="ico" required="required"/>
                        <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
                    </div>
                </div>

                <%--<input class="hidden" name="page" value="${page}"/>--%>

                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-1">
                        <input type="checkbox" name="remenberme" id="remenberme" value="remenberme" />

                        <label for="remenberme" class="control-label" checked>记住我</label>
                    </div>
                </div>
                <div class="col-sm-8 col-sm-offset-2">
                    <a  id="tologin" class="btn btn-success btn-block" >登录</a>
                </div>
                <div class="col-sm-8 col-sm-offset-2">
                    <a class="btn btn-info btn-block" onclick="javascript:location.href='${ctx}/page/register'">注册账号</a>
                </div>
            </form>

        </div>
    </div>

</div>