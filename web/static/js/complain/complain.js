/**
 * Created by admin on 2016/5/10.
 */
var makecomplainlist = function (mydata) {

    var str = '';
    $.each(mydata, function (index, item) {
        str += '<tr id="' + item.id + '"><td ><input type="checkbox" class="complain" ></td><td class="look ott">' + item.objtxt + '</td><td class="look one">' + item.objname + '</td> <td class="look oct">' + item.objcontent + '</td> <td class="look ae">' + item.addtime + '</td></tr>';
    });
    $('.complains').find('tbody').html(str);

    $('td').css({
        'text-overflow': 'ellipsis',
        'white-space': 'nowrap',
        'overflow': 'hidden'
    });

    $('.look').click(function () {
        $('.noticy-detail h2').text('举报');
        $('.noticy-detail .noticy-cont').html('举报类型：<font color="#ff1493">' + $(this).parents('tr').find('.ott').text()+'</font><br /><br />'+'举报对象：<font color="#ff1493">' + $(this).parents('tr').find('.one').text()+'</font><br /><br />'+'举报内容：<font color="#ff1493">' + $(this).parents('tr').find('.oct').text()+'</font>');

        $('.releasetime').text('发布时间：' + $(this).parents('tr').find('.ae').text());



        $('.noticy-wrap').show();
        $('.noticy-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).parents('tr').addClass('addClick');


    });

    $('.noticy-dao .btn-dao').click(function () {
        $('.noticy-wrap').animate({'left': '100%'});
        $('.complain').parents('tr').removeClass('addClick')
        $('.noticy-wrap').hide(500);
    });
}