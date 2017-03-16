/**
 * Created by admin on 2016/5/25.
 */
/**
 * Created by admin on 2016/5/10.
 */
var makeuserlist = function (mydata) {

    var str = '';
    $.each(mydata, function (index, item) {
        str += '<tr id="' + item.id + '">';
        if (item.permission == 1) {

            str += ' <td><input type="checkbox" class="user"></td>';
        } else {
            str += '<td><img src="/sources/otherimg/forbidden.png" style="width: 18px"/></td>';
        }
        str += '<td class="look one">' + item.username + '</td> <td class="look">' + item.name + '</td> <td class="look">' + item.sexval + '</td><td class="look">' + item.addtime + '</td><td class="look">';
        if (item.permission == 3) {
            str += '超级管理员';
        } else if (item.permission == 2) {
            str += '管理员';

        } else if (item.permission == 1) {
            str += '普通用户';

        } else {
            str += '拉黑用户';
        }
        str += '</td></tr>';
    });
    $('.users').find('tbody').html(str);

    $('td').css({
        'text-overflow': 'ellipsis',
        'white-space': 'nowrap',
        'overflow': 'hidden'
    });

    $('.look').click(function () {
        $('.noticy-wrap').show();
        $('.noticy-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).parents('tr').addClass('addClick');

        $.post($_ctx + '/user/findById', {
            id: $(this).parents('tr').attr('id')
        }, function (data, stadius) {
            if (stadius == 'success') {

                dealUserMsg(data);
            }

        });


    });

    $('.noticy-dao .btn-dao').click(function () {
        $('.noticy-wrap').animate({'left': '100%'});
        $('tr').removeClass('addClick');
        $('.noticy-wrap').hide(500);
    });
}

function dealUserMsg(user_msg) {
    //用户名
    if (user_msg.username != null && user_msg.username != '') {
        $('#user-username').removeClass('user-hide');
        $('#user-username span').text('用户名：' + user_msg.username);

    } else {
        $('#user-username').addClass('user-hide');
    }


//性别
    if (user_msg.sexval != null && user_msg.sexval != '') {
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


    $('#user-experience span').html('经验值：' + user_msg.experience + '(<font color="#ff0000">等级：' + user_msg.grade + '</font>)');


    //权限
    if (user_msg.permission != null && user_msg.permission != '') {
        $('#user-permission').removeClass('user-hide');
        $('.noticy-dao .pt').removeClass('user-hide');
        $('.noticy-dao .dao-qxlh').addClass('user-hide');
        if (user_msg.permission == 1) {
            $('#user-permission span').text('权限：' + user_msg.permission + '(普通用户)');
        } else if (user_msg.permission == 2) {
            $('#user-permission span').text('权限：' + user_msg.permission + '(管理员)');
        } else if (user_msg.permission == 3) {
            $('#user-permission span').text('权限：' + user_msg.permission + '(BOSS)');

        }

    } else {
        $('#user-permission span').text('权限：' + user_msg.permission + '(黑名单用户)');

        $('.noticy-dao .pt').addClass('user-hide');
        $('.noticy-dao .dao-qxlh').prop('id',user_msg.username);
        $('.noticy-dao .dao-qxlh').removeClass('user-hide')
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