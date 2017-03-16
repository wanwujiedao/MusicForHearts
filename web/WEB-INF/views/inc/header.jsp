<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<%@ include file="/WEB-INF/views/inc/login.jsp" %>
<nav class="navbar navbar-inverse">


    <div class="row" id="mainmenu">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header col-lg-3 ">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/page/home">音乐&nbsp;<font color="#FF0000"><span
                    class="glyphicon glyphicon-headphones"></span></font>&nbsp;唯懂我心
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <div class="col-lg-5">
                <ul class="nav navbar-nav">
                    <li><a><font color="#5CB85C"><span
                            class="glyphicon glyphicon-film"></span></font>&nbsp;MV</a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/page/mv-showall"><font color="#228B22"><span
                                    class="glyphicon glyphicon-leaf"></span></font>&nbsp;所有MV</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ctx}/page/mv-ranking"><font color="#FF0000"><span
                                    class="glyphicon glyphicon-fire"></span></font>&nbsp;MV热榜</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ctx}/page/mv-groups"><font color="#00AA88"><span
                                    class="glyphicon glyphicon-list"></span></font>&nbsp;MV分类</a></li>
                        </ul>
                    </li>


                    <li><a><font color="#FFFF00"><span
                            class="glyphicon glyphicon-music"></span></font>&nbsp;MUSIC</a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/page/song-showall"><font color="#228B22"><span
                                    class="glyphicon glyphicon-leaf"></span></font>&nbsp;所有音乐</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ctx}/page/song-ranking"><font color="#FF0000"><span
                                    class="glyphicon glyphicon-fire"></span></font>&nbsp;音乐热榜</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ctx}/page/song-groups"><font color="#00AA88"><span
                                    class="glyphicon glyphicon-list"></span></font>&nbsp;音乐分类</a></li>
                        </ul>
                    </li>



                    <li><a><font color="#3A5FCD"><span
                            class="glyphicon glyphicon-link"></span></font>&nbsp;友情链接</a>
                        <ul class="dropdown-menu">
                            <li><a href="http://www.ttpod.com/" target="_blank"><img
                                    src="/sources/header/ttdt.png" width="18px"/>&nbsp;天天动听</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="http://www.kuwo.cn/" target="_blank"><img
                                    src="/sources/header/kuwo.png" width="18px"/>&nbsp;酷我音乐</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="http://www.kugou.com/" target="_blank"><img
                                    src="/sources/header/kugou.png" width="18px"/>&nbsp;酷狗音乐</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="http://music.163.com/#/user/home?id=1"
                                   target="_blank"><img src="/sources/header/wangyiyun.jpg"
                                                        width="18px"/>&nbsp;网易云音乐</a></li>

                        </ul>
                    </li>

                    <li><a href="${ctx}/page/artist-showall"><img src="/sources/header/hzhb.png"
                                                                  width="18px">&nbsp;歌手</a></li>

                    <li><a><img src="/sources/header/message.png" width="18px">&nbsp;留言天地</a>
                        <ul class="dropdown-menu">
                            <li><a href="${ctx}/page/say-advice"><font color="#374E0C"><span
                                    class="glyphicon glyphicon-edit"></span></font>&nbsp;建议与评价</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${ctx}/page/say-complain"><font color="#EE0000"><span
                                    class="glyphicon glyphicon-info-sign"></span></font>&nbsp;举报中心</a></li>

                        </ul>
                    </li>
                </ul>
            </div>

            <li class="navbar-form navbar-left" role="search">
                <div class="input-group">

                    <input id="keyword" type="text" class="form-control" name="keyword"
                           placeholder="请输入关键字进行搜索" value="${musickeyword}"> <span class="input-group-btn">

						<button type="button" class="btn btn-link" id="search">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
					</span>
                </div>
            </li>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="${ctx}/page/notice"><font color="#F0FFF0"><span
                        class="glyphicon glyphicon-bell" id="noticy"></span></font>&nbsp;公告</a></li>

                <li id="logintrue"><a href="javasript:void(0);"><img width="18px"
                                                                     style="height: 18px; border-radius: 50%"
                                                                     id="logintrue-poster">&nbsp;<span
                        id="logintrue-username"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/page/user-center"><font color="#CD0000"><span
                                class="glyphicon glyphicon-heart"></span></font>&nbsp;个人中心</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${ctx}/page/user-setting"><font color="#000000"><span
                                class="glyphicon glyphicon-cog"></span></font>&nbsp;设置中心</a></li>
                        <li role="separator" class="divider"></li>
                        <c:if test="${currentUser.permission!=1}">
                            <li id="manage"><a href="${ctx}/page/user-manage"><font color="#00FF00"><span
                                    class="glyphicon glyphicon-briefcase"></span></font>&nbsp;管理专区</a></li>
                            <li role="separator" class="divider"></li>
                        </c:if>

                        <li><a id="exitlogin"><font color="#32CD32"><span
                                class="glyphicon glyphicon-log-out"></span></font>&nbsp;退出登录</a></li>
                    </ul>
                </li>


                <li id="loginfalse"><a><font color="#008B8B"><span
                        class="glyphicon glyphicon-user"></span></font>&nbsp;游客选项</a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0);" id="login-btn"><font color="#32CD32"><span
                                class="glyphicon glyphicon-log-in"></span></font>&nbsp;登录</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${ctx}/page/register"><font color="#FA8072"><span
                                class="glyphicon glyphicon-plus"></span></font>&nbsp;注册</a></li>
                    </ul>
                </li>

            </ul>

        </div>

    </div>

</nav>
<script type="text/javascript">
    var currentpage = '${page}';
    var islogin = '${islogintrue}';
    var toHome = '${toHome}';
    var tologinurl = '${ctx}/user/islogin';
    var logined = '${ctx}/user/logined';
    var exitlogin = '${ctx}/user/exitlogin';
    $(function () {

        if (currentUser[0] != null && currentUser[0] != '') {
            $('#logintrue-username').text(currentUser[0].username);
            $('#logintrue-poster').prop('src', currentUser[0].userposter);
            $('#logintrue').show();
            $('#loginfalse').hide();

        } else {
            $('#logintrue').hide();
            $('#loginfalse').show();
        }

        if (islogin == "islogintrue") {
            $('#login-wrap').fadeIn(1200);
        }


        $('#tologin').click(function () {
            var isok = check(document.getElementById('login-frm'));
            if (isok) {
                var username = $('#login-frm #username').val();
                var password = $('#login-frm #password').val();
                $.post(tologinurl, {
                    username: username,
                    password: password
                }, function (data, stadius) {
                    if (stadius == 'success' && data != null && data != '') {
                        $('#logintrue-username').text(data.username);
                        $('#logintrue-poster').prop('src', data.userposter);
                        $('#logintrue').show();
                        if (data.permission == 2 || data.permission == 3) {
                            $('#manage').show();
                        } else {
                            $('#manage').hide();
                        }
                        $('#loginfalse').hide();
                        $('#login-wrap').slideUp(1200);
                        if (currentpage == 10) {
                            location.reload();
                        }
                    } else {
                        //$('#login-wrap').slideUp(2000);
                        window.wxc.xcConfirm('登录信息：用户名或密码错误！', window.wxc.xcConfirm.typeEnum.error, {
                            title: "错误"
                        });
                    }

                })
            }
        });

        $('#exitlogin').click(function () {
            $.post(exitlogin, function (data, stadius) {
                if (stadius == 'success') {
                    $('#logintrue').hide();
                    $('#loginfalse').show();
                    if (toHome == 'toHome') {
                        window.wxc.xcConfirm('您已经退出登陆！即将跳往主页', window.wxc.xcConfirm.typeEnum.info, {
                            title: "温馨提示",
                            onOk:function(v){
                                console.info(v);
                                location.href = $_ctx + '/page/home'
                            }
                        });

                    }
                    if (currentpage == 10) {
                        location.reload();
                    }
                } else {
                    window.wxc.xcConfirm('登录信息：服务器错误！', window.wxc.xcConfirm.typeEnum.error, {
                        title: "错误"
                    });
                }
            });
        });

    })


</script>

