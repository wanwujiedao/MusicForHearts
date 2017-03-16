/**
 * Created by dzx on 2016/3/17.
 */

$(function () {

    $('.login-shadow').css({
        'position': 'fixed',
        'width': '100%',
        'height': ($(document).height()) + 'px',
        'background-color': '#A5A5A5',
        'opacity': '0.3',
        'top': '0px',
        'z-index': '100'
    });

    if ($('#username').val() != "") {
        $('#username').parent().children($('span')).addClass('glyphicon-ok');
        $('#username').parent().addClass('has-success');
    }
    $('[aria-describedby="ico"]').on('focusout', function () {
        $(this).parent().children($('span')).removeClass('glyphicon-warning-sign');
        $(this).parent().removeClass('has-warning');
        var filter = /^[\\@A-Za-z0-9\\!\\#\$\\%\^\\&\*\.\\~]{6,22}$/;
        if ($(this).attr('name') == 'password') {
            if (filter.test($(this).val())) {
                $(this).parent().children($('span')).removeClass('glyphicon-remove');
                $(this).parent().children($('span')).addClass('glyphicon-ok');
                $(this).parent().removeClass('has-error');
                $(this).parent().addClass('has-success');
            } else {
                $(this).parent().children($('span')).removeClass('glyphicon-ok');
                $(this).parent().children($('span')).addClass('glyphicon-remove');
                $(this).parent().removeClass('has-success');
                $(this).parent().addClass('has-error');
            }

        } else {


            if ($(this).val() == "") {
                $(this).parent().children($('span')).removeClass('glyphicon-ok');
                $(this).parent().children($('span')).addClass('glyphicon-remove');
                $(this).parent().removeClass('has-success');
                $(this).parent().addClass('has-error');
            } else {
                $(this).parent().children($('span')).removeClass('glyphicon-remove');
                $(this).parent().children($('span')).addClass('glyphicon-ok');
                $(this).parent().removeClass('has-error');
                $(this).parent().addClass('has-success');
            }
        }
    });
    $('[aria-describedby="ico"]').on('focus', function () {
        $(this).parent().children($('span')).addClass('glyphicon-warning-sign');
        $(this).parent().addClass('has-warning');
    });

    $('#close-login').click(function () {
        $('#login-wrap').fadeOut(1200);
    });

    $('#login-btn').click(function () {
        $('#login-wrap').slideDown(1200);
    });

})

function check(frm) {
    var v = getcheck(frm);
    for (var i = 0; i < frm.length; i++) {
        if (frm.elements[i].value == '' && frm.elements[i].getAttribute("required") == 'required') {         //Form的属性elements的首字e要小写
            window.wxc.xcConfirm(frm.elements[i].title + '不能为空!', window.wxc.xcConfirm.typeEnum.error, {
                title: "温馨提示"
            });
            frm.elements[i].focus();				//指定表单元素获取焦点
            v = false;
            return false;
        }
    }


    return v;
}
function getcheck(frm) {
    var vv = true;
    var pwd = '';
    for (i = 0; i < frm.length; i++) {

        if (frm.elements[i].getAttribute("name") == 'password') {
            var filter = /^[\\@A-Za-z0-9\\!\\#\$\\%\^\\&\*\.\\~]{6,22}$/;
            if (filter.test(frm.elements[i].value)) {
                pwd = frm.elements[i].value;
            } else {
                window.wxc.xcConfirm('密码格式不正确', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
                vv = false;
                frm.elements[i].focus();
                return false;
            }

        }
        else if (frm.elements[i].getAttribute("name") == 'password2') {
            if (frm.elements[i].value == pwd) {
                console.info('验证通过');
            } else {
                window.wxc.xcConfirm('两次密码不一样', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
                vv = false;
                frm.elements[i].focus();
                return false;
            }
        }
        else if (frm.elements[i].getAttribute("name") == 'email') {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (filter.test(frm.elements[i].value)) {
                console.info('验证通过');
            } else {
                window.wxc.xcConfirm('邮箱格式不正确', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
                vv = false;
                frm.elements[i].focus();
                return false;
            }
        }

        else if (frm.elements[i].getAttribute("name") == 'qq') {
            var filter = /^\d{5,12}$/;
            if (filter.test(frm.elements[i].value)) {
                console.info('验证通过');
            } else {
                window.wxc.xcConfirm('QQ号位数不正确', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
                vv = false;
                frm.elements[i].focus();
                return false;
            }
        } else if (frm.elements[i].getAttribute("name") == 'tel') {
            var filter = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
            if (filter.test(frm.elements[i].value)) {
                console.info('验证通过');
            } else {
                window.wxc.xcConfirm('电话格式不正确', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
                vv = false;
                frm.elements[i].focus();
                return false;
            }
        }


    }
    return true;
}