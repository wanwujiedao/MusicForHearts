/**
 * Created by dzxon 2016/3/23.
 */

$(function () {
    var musicurl = $_ctx + '/music/userMusic';
    var playmvurl = $_ctx + '/page/mv-player';
    var playsongurl = $_ctx + '/page/song-player';
    var pagenum = 1;
    var mvpagesize = 12;
    var songpagesize = 10;
    try {
        var user_msg = currentUser[0];

        var user_id = user_msg.id;
        dealUserMsg(user_msg);
        $('.user-song').css({
            'margin-left': '100%'
        });

        $('#usercenter .dao-section').hide();
        $('#user-basicmsg').show();
        $('#usercenter-menu').find('a').eq(0).addClass('menuactive');
        $('.dao-slide').hide();

        $('.user-mv').show();
        $('#usercenter-menu').find('a').click(function () {
            $('#usercenter-menu').animate({
                left: '-200px'
            });
            if ($(this).attr('class') != 'menuactive') {
                var $name = $(this).attr('name');
                $('#usercenter-menu').find('a').removeClass('menuactive');
                $(this).addClass('menuactive');

                $('#usercenter .dao-section').animate({
                    'margin-top': '100%'
                });
                $('#usercenter .dao-section').hide();
                $($name).show();
                $($name).animate({
                    'margin-top': '0px'
                });
                if ($name == '#user-basicmsg') { //基本信息
                    //console.log('获取用户信息');


                } else if ($name == '#user-musiclist') { //音乐信息

                    if ($('.user-song').is(':hidden')) {//用户收藏MV
                        dealUserMusic(musicurl, playmvurl, {
                            userid: user_id,
                            type: 1,
                            pagesize: mvpagesize,
                            pagenum: pagenum
                        })
                    } else {//用户收藏SONG
                        dealUserMusic(musicurl, playsongurl, {
                            userid: user_id,
                            type: 0,
                            pagesize: songpagesize,
                            pagenum: pagenum
                        })
                    }
                } else if ($name == '#user-noticy') { //通知信息
                    getnoticydata(noticypagenum, noticypagesize);
                } else if ($name == '#user-apply') { //权限申请信息
                    var getadviceurl=$_ctx+'/say/getUserAdvice';
                    var isadvice= $.post(getadviceurl,{
                        userid:currentUser[0].id
                    },function(data){
                        if(data.data.total<1){
                            window.wxc.xcConfirm('系统信息：尊敬的用户，系统检测到您并没有对本网站做任何评价，所以禁止您申请管理员职位！', window.wxc.xcConfirm.typeEnum.info, {
                                title: "小提醒"
                            });
                            $('#toapply').prop('disabled','disabled');
                        }
                    }).responseText;
                }
            }
        });
        $('.slidemybtn').click(function () {
            var musicid = this.id;
            $('.dao-slide').animate({
                'margin-left': '100%'
            });
            $('.dao-slide').hide();
            $('.' + musicid).show();
            $('.' + musicid).animate({
                'margin-left': '0px'
            });
            if (musicid == 'user-song') { //歌曲
                dealUserMusic(musicurl, playsongurl, {
                    userid: user_id,
                    type: 0,
                    pagesize: songpagesize,
                    pagenum: pagenum
                })
            } else { //MV
                dealUserMusic(musicurl, playmvurl, {
                    userid: user_id,
                    type: 1,
                    pagesize: mvpagesize,
                    pagenum: pagenum
                })
            }
        });
        $('#usercenter-menu').hover(function () {
            $(this).animate({
                left: '-100px'
            });
        }, function () {
        }). stop(true, true);


    } catch (err) {
        window.wxc.xcConfirm('访问错误：当前未登陆不能访问此页面！', window.wxc.xcConfirm.typeEnum.error, {
            title: "错误"
        });
        setTimeout(function () {
            location.href = $_ctx + '/page/home'
        }, 1200);
    }

//获取用户基本信息


})
function dealUserMsg(user_msg) {
    //用户名
    if (user_msg.username != null && user_msg.username != '') {
        $('#user-username').removeClass('user-hide');
        $('#user-username span').text('用户名：' + user_msg.username);
    } else {
        $('#user-username').addClass('user-hide');
    }


//性别
    if (user_msg.sexval!= null && user_msg.sexval!= '') {
        $('#user-sex').removeClass('user-hide');
        $('#user-sex span').text('性别：' + user_msg.sexval);
    }
    else {
        $('#user-sex').addClass('user-hide');
    }


//邮箱
    if (user_msg.email != null && user_msg.email != '') {
        $('#user-email').removeClass('user-hide');
        $('#user-email span').text('邮箱：' + user_msg.email);
    }
    else {
        $('#user-email').addClass('user-hide');
    }


//真实姓名
    if (user_msg.name != null && user_msg.name != '') {
        $('#user-name').removeClass('user-hide');
        $('#user-name span').text('真实姓名：' + user_msg.name);
    } else {
        $('#user-name').addClass('user-hide');
    }


    //QQ
    if (user_msg.qq != null && user_msg.qq != '') {
        $('#user-qq').removeClass('user-hide');
        $('#user-qq span').text('QQ:' + user_msg.qq);
    }
    else {
        $('#user-qq').addClass('user-hide');
    }


    //手机号码
    if (user_msg.tel != null && user_msg.tel != '') {
        $('#user-tel').removeClass('user-hide');
        $('#user-tel span').text('手机号码：' + user_msg.tel);
    }
    else {
        $('#user-tel').addClass('user-hide');
    }


    //经验


    $('#user-experience span').html('经验值：' + user_msg.experience+'(<font color="#ff0000">等级：'+user_msg.grade+'</font>)');



    //权限
    if (user_msg.permission != null && user_msg.permission != '') {
        $('#user-permission').removeClass('user-hide');
        if (user_msg.permission == 1)
            $('#user-permission span').text('权限：' + user_msg.permission + '(普通用户)');
        else if (user_msg.permission == 2)
            $('#user-permission span').text('权限：' + user_msg.permission + '(管理员)');
        else if (user_msg.permission == 3)
            $('#user-permission span').text('权限：' + user_msg.permission + '(BOSS)');
        else {
            window.wxc.xcConfirm('访问错误：你已经是该网站的黑名单用户！', window.wxc.xcConfirm.typeEnum.error, {
                title: "错误"
            });
            setTimeout(function () {
                location.href = $_ctx + '/page/home'
            }, 1200);
        }


    } else {
        $('#user-permission').addClass('user-hide');
    }

    //简介
    if (user_msg.info != null && user_msg.info != '') {
        $('#user-info').removeClass('user-hide');
        $('#user-info span').html('&nbsp;&nbsp;&nbsp;&nbsp;' + user_msg.info);
    } else {
        $('#user-info').addClass('user-hide');
    }

    //图像
    if (user_msg.userposter != null && user_msg.userposter != '') {
        $('#user-avatar img').prop('src', user_msg.userposter);
    } else {
        $('#user-avatar img').prop('src', '/sources/useravatar/default_avatar');
    }

}


function dealUserMusic(musicurl, playurl, options) {
    $.post(musicurl, {
        userid: options.userid,
        type: options.type,
        pagesize: options.pagesize,
        pagenum: options.pagenum
    }, function (data, stadius) {
        if (stadius == 'success') {
            if (options.type == 1) {
                var count = Math.ceil(data.data.total / 12);
                var start = data.data.pagenum;
                //console.info(data);

                $('.page').css({
                    'margin-left': '420px'
                });
                if (count >= 1) {
                    musiclist(data.data.rows, 1, playurl);
                    $(".page").paginate({
                        count: count,
                        start: start,
                        display: 7,
                        border: false,
                        border_color: '#fff',
                        text_color: '#4F4F4F',
                        background_color: '#EEE9E9',
                        border_hover_color: '#8B8682',
                        text_hover_color: '#fff',
                        background_hover_color: '#8B8682',
                        images: false,
                        mouse: 'press',
                        onChange: function (page) {
                            dealUserMusic(musicurl, playurl, {
                                userid: options.userid,
                                type: options.type,
                                pagesize: options.pagesize,
                                pagenum: page
                            });
                        }
                    });
                }else{
                    $(".page").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $("#mvlist").html('');
                }

            } else {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;
                console.info(data);

                $('.songpage').css({
                    'margin-left': '450px'
                });
                if (count >= 1) {
                    musiclist(data.data.rows, 0, playurl);
                    $(".songpage").paginate({
                        count: count,
                        start: start,
                        display: 7,
                        border: false,
                        border_color: '#fff',
                        text_color: '#4F4F4F',
                        background_color: '#EEE9E9',
                        border_hover_color: '#8B8682',
                        text_hover_color: '#fff',
                        background_hover_color: '#8B8682',
                        images: false,
                        mouse: 'press',
                        onChange: function (page) {
                            dealUserMusic(musicurl, playurl, {
                                userid: options.userid,
                                type: options.type,
                                pagesize: options.pagesize,
                                pagenum: page
                            });
                        }
                    });
                }else{
                    $('.songpage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('#songlist').html('');
                }
            }
        }
    })

}


