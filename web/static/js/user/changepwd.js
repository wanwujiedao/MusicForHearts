/**
 * Created by dzx on 2016/3/28.
 */

$(function () {

    $('#pwd_form [type="password"]').change(function () {
        var thisval = $(this).val();
        var thisid = this.id;
        var pwd = $('#pwd_form #password').val();
        var repwd = $('#pwd_form #repassword').val();
        var oldpwd = $('#pwd_form #oldpassword').val();
        var filter = /^[\\@A-Za-z0-9\\!\\#\$\\%\^\\&\*\.\\~]{6,22}$/;
        if (this.id == 'oldpassword') {
            if(oldpwd==currentUser[0].password){
                $('#pwd_form').find('input').prop('disabled','');
                $('#pwd_form #oldpassword').prop('disabled','disabled');
                showimgsuccess('oldpassword_flag');
                clearMsg('pwd_form #oldpassword');
            }else{
                showimgerror('oldpassword_flag');
                showMsg('pwd_form #pldpassword', '原先密码不正确！');
            }
            
        } else {
            if (filter.test(thisval)) {
                if (repwd != '') {
                    if (pwd != '') {
                        if (pwd == repwd) {
                            showimgsuccess('password_flag');
                            clearMsg('pwd_form #password');
                            showimgsuccess('repassword_flag');
                            clearMsg('pwd_form #repassword');
                        } else {
                            showimgerror('repassword_flag');
                            showMsg('pwd_form #repassword', '两次输入密码不同');
                        }
                    } else {
                        showimgerror('password_flag');
                        showMsg('pwd_form #password', '密码未填写');
                    }
                } else {
                    clearMsg('pwd_form #repassword');
                }
            } else {

                showimgerror(thisid + '_flag');

                showMsg('pwd_form #' + thisid, '请输入合法密码（6~22位字符（字母+数字+特殊字符））');

            }
        }
    });



})
function showimgsuccess(argID) {
    $('#' + argID).html('<img alt="" src=' + $_ctx + '/static/img/onSuccess.gif />');
}

function showimgerror(argID) {
    $('#' + argID).html('<img alt="" src=' + $_ctx + '/static/img/onError.gif />');
}


function showMsg(argID, argMsg) {
    $('#' + argID).attr('data-toggle', 'popover');
    $('#' + argID).attr('data-trigger', 'fouck');
    $('#' + argID).attr('data-placement', 'top');
    $('#' + argID).attr('data-content', argMsg);
    $('#' + argID).popover('show');
}

function clearMsg(argID) {
    $('#' + argID).removeAttr('data-toggle');
    $('#' + argID).removeAttr('data-trigger');
    $('#' + argID).removeAttr('data-placement');
    $('#' + argID).removeAttr('data-content');
    $('#' + argID).popover('destroy');
}