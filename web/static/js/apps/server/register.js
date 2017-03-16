$('#register_form #username').change(function () {
    $.post($_ctx + '/user/usernameIsNew', {username: $(this).val()}, function (data, stadius) {
        console.info(data);
        if (data == true) {
            imgSeccess('username_flag');
        } else {
            $('#register_form #username').prop('value', '');
            imgError('username_flag');
            window.wxc.xcConfirm('注册信息：用户名已存在！', window.wxc.xcConfirm.typeEnum.error, {
                title: "错误"
            });
            $('#register_form #username').focus();
        }
    });
});

$('#register_form [type="password"]').change(function () {
    var thisval = $(this).val();
    var thisid = this.id;
    var pwd = $('#register_form #password').val();
    var repwd = $('#register_form #password2').val();

    var filter = /^[\\@A-Za-z0-9\\!\\#\$\\%\^\\&\*\.\\~]{6,22}$/;
    if (filter.test(thisval)) {
        if (repwd != '') {
            if (pwd != '') {
                if (pwd == repwd) {
                    imgSeccess('password_flag');
                    cleanErrorMsg('register_form #password');
                    imgSeccess('password2_flag');
                    cleanErrorMsg('register_form #password2');
                } else {
                    imgError('password2_flag');
                    showErrorMsg('register_form #password2', '两次输入密码不同');
                }
            } else {
                imgError('password_flag');
                showErrorMsg('register_form #password', '密码未填写');
            }
        }else{
            cleanErrorMsg('register_form #password2');
        }
    } else {

        imgError(thisid + '_flag');

        showErrorMsg('register_form #'+thisid, '请输入合法密码（6~22位字符（字母+数字+特殊字符））');

    }

});

$("#photos").change(function() {
    var objUrl = getObjectURL(this.files[0]);
    console.log("objUrl = " + objUrl);
    if (objUrl) {
        $("#imgpre").attr("src", objUrl);
    }
});

$('#email').change(function () {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test($(this).val())) {
        imgSeccess('email_flag');
        cleanErrorMsg('eamil');
    }
    else {
        imgError('email_flag');
        showErrorMsg('email', '请输入正确的邮箱');
    }
});

$('#tel').change(function () {
    var filter = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
    if (filter.test($(this).val())) {

        imgSeccess('tel_flag');
        cleanErrorMsg('tel');
    } else {
        imgError('tel_flag');
        showErrorMsg('tel', '请输入正确的手机号码');
    }
})

$('#qq').change(function () {
    var filter = /^\d{5,12}$/;
    if (filter.test($(this).val())) {
        imgSeccess('qq_flag');
        cleanErrorMsg('qq');
    } else {
        imgError('qq_flag');
        showErrorMsg('qq', '请输入正确的QQ号码');
    }
});


$('#name').change(function () {
    if ($('#name').prop('value') != undefined && $('#name').prop('value') != '') {
        $('#name').popover('hide');
        flag = true;
    }
});


function imgSeccess(argID) {
    $('#' + argID).html('<img alt="" src=' + $_ctx + '/static/img/onSuccess.gif />');
}

function imgError(argID) {
    $('#' + argID).html('<img alt="" src=' + $_ctx + '/static/img/onError.gif />');
}


function showErrorMsg(argID, argMsg) {
    $('#' + argID).attr('data-toggle', 'popover');
    $('#' + argID).attr('data-trigger', 'fouck');
    $('#' + argID).attr('data-placement', 'top');
    $('#' + argID).attr('data-content', argMsg);
    $('#' + argID).popover('show');
}

function cleanErrorMsg(argID) {
    $('#' + argID).removeAttr('data-toggle');
    $('#' + argID).removeAttr('data-trigger');
    $('#' + argID).removeAttr('data-placement');
    $('#' + argID).removeAttr('data-content');
    $('#' + argID).popover('destroy');
}

//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}