/**
 * Created by dzxon 2016/3/23.
 */

$(function () {
    var musicurl=$_ctx+'/music/userMusic';
    var pagenum=1;
    var pagesize=10;
    try {
        var user_msg = currentUser[0];

        var user_id = user_msg.id;

        $('.user-song').css({
            'margin-left': '100%'
        });

        $('#usercenter .dao-section').hide();
        $('#user-basicmsg').show();
        $('#usercenter-menu').find('a').eq(0).addClass('menuactive');
        $('.dao-slide').hide();

        $('.user-msg').show();
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
                    console.log('获取用户信息');


                } else if ($name == '#user-musiclist') { //音乐信息
                    console.info($('.user-msg').is(':hidden'))
                    if ($('.user-pwd').is(':hidden')) {//基本信息
                        dealUserMusic(musicurl,playmvurl,{
                            userid: user_id,
                            type:1,
                            pagesize:mvpagesize,
                            pagenum:pagenum
                        })
                    } else {//用户收藏SONG
                        dealUserMusic(musicurl,playsongurl,{
                            userid: user_id,
                            type:0,
                            pagesize:songpagesize,
                            pagenum:pagenum
                        })
                    }
                } else if ($name == '#user-noticy') { //通知信息
                    getnoticydata(noticypagenum, noticypagesize);
                } else if ($name == '#user-apply') { //权限申请信息
                }
            }
        });
        $('.slidemybtn').click(function () {
            var usermsgid = this.id;
            $('.dao-slide').animate({
                'margin-left': '100%'
            });
            $('.dao-slide').hide();
            $('.' + usermsgid).show();
            $('.' + usermsgid).animate({
                'margin-left': '0px'
            });
            if (usermsgid == 'user-pwd') { //歌曲

            } else { //MV

            }
        });
        $('#usercenter-menu').hover(function () {
            $(this).animate({
                left: '-100px'
            });
        }, function () {
        }). stop(true, true);


    }catch (err){
        window.wxc.xcConfirm('访问错误：当前未登陆不能访问此页面！', window.wxc.xcConfirm.typeEnum.error, {
            title: "错误"
        });
        setTimeout(function(){location.href=$_ctx+'/page/home'},1200);
    }

//获取用户基本信息




})
