/**
 * Created by admin on 2016/4/27.
 */

var noticylist = function (mydata, sty) {

    var str = '<tr> <th width="40%">标题</th><th>发布者</th><th>发布时间</th>';
    if (sty == 0) {
        str += '</tr>';
    } else if (sty == 1) {
        str += '<th>阅读状态</th></tr>';
    }
    var cont = new Array();
    var cid = new Array();
    $.each(mydata, function (index, item) {
        str += '<tr id="' + index + '" class="noticy" flag="' + item.noticyflag + '" ><td class="te">' + item.title + '</td><td class="ce">' + item.creatorname + '</td><td class="ae">' + item.addtime + '</td>';
        if (sty == 0) {
            str += '</tr>';
        } else if (sty == 1) {
            if (item.noticyflag == 1) {
                str += '<td class="nf"><label style="color: #FF0000" >未读</label></td></tr>';
            } else {
                str += '<td class="nf"> <label style="color: #00CC00" >已读</label></td></tr>';
            }
        }

        cont.push(item.notice);
        cid.push(item.id);
    });
    $('#noticy-list').html(str);


    $('.noticy').css({
        'cursor': 'hand'
    });
    $('.noticy').parents('table').find('th').css({
        'text-align': 'center'
    })
    $('.noticy td').css({
        'text-align': 'center'
    })
    var flag = -1;
    var ind = -1;
    $('.noticy').click(function () {
        $('.noticy-detail h2').text($(this).find('.te').text());
        $('.noticy-detail .noticy-cont').html('&nbsp;&nbsp;&nbsp;&nbsp;' + cont[this.id]);
        $('.releasetime').text('发布时间：' + $(this).find('.ae').text());
        $('.noticy-creator').text('发布者：' + $(this).find('.ce').text());
        if (sty == 1) {
            $('span.dao-ope').attr('noid', cid[this.id]);
            flag = $(this).attr('flag');
            ind = this.id;
            $(this).find('td.nf').html('<label style="color: #00CC00" >已读</label></td>');
            $.post($_ctx + '/noticy/ope', {
                id: cid[this.id],
                noticyflag: 2,
            })
        }
        $('.noticy-wrap').show();
        $('.noticy-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).addClass('addClick');


    });
    $('.noticy-dao .btn-dao').click(function () {
        $('.noticy-wrap').animate({'left': '100%'});
        $('.noticy').removeClass('addClick')
        $('.noticy-wrap').hide(500);
    });
    $('.dao-ope').click(function () {
        if (flag == 0) {
            $('tr#' + ind).remove();
            $.post($_ctx + '/noticy/ope', {
                id: $(this).attr('noid'),
                noticyflag: 2,
            })
        } else if (flag == 1 || flag == 2) {
            $('tr#' + ind).remove();
            $.post($_ctx + '/noticy/ope', {
                id: $(this).attr('noid'),
                noticyflag: 0,
            })
        }
        $('.noticy-wrap').animate({'left': '100%'});
        $('.noticy').removeClass('addClick')
        $('.noticy-wrap').hide(500);
    });

}


var noticyall = function (mydata) {

    var str = '';

    var cont = new Array();
     cid = new Array();
    $.each(mydata, function (index, item) {
        str += '<tr id="' + index + '" cid="'+item.id+'"  flag="' + item.noticyflag + '" >';
        if (currentUser[0].permission == 3 || currentUser[0].id == item.creator) {

            str +=' <td><input type="checkbox" class="noticy"></td>';
        }else{
            str += '<td><img src="/sources/otherimg/forbidden.png" style="width: 18px"/></td>';
        }
        str += '<td class="te look">' + item.title + '</td><td class="ce look">' + item.creatorname + '</td><td class="ae look">' + item.addtime + '</td>';
        if (currentUser[0].permission == 3 || currentUser[0].id == item.creator) {
                str+='<td class="noticy-edit"><img src="/sources/otherimg/1187318.png" style="width: 18px"/></td>';
        }else{
            str+='<td class="can-not"><img src="/sources/otherimg/1187317.png" style="width: 18px"/></td>';
        }
        str += '</tr>';
        cont.push(item.notice);
        cid.push(item.id);
    });
    $('#noticy-list tbody').html(str);
    $('.noticy-edit').css({
        'cursor':'pointer'
    })
    $('.can-not').css({
        'cursor':'not-allowed'
    })



    $('.noticy').parents('table').find('th').css({
        'text-align': 'center'
    })
    $('td').css({
        'text-align': 'center'
    })

    $('.look').click(function () {
        $('.noticy-detail h2').text($(this).parents('tr').find('.te').text());
        $('.noticy-detail .noticy-cont').html('&nbsp;&nbsp;&nbsp;&nbsp;' + cont[$(this).parents('tr').attr('id')]);
        $('.releasetime').text('发布时间：' + $(this).parents('tr').find('.ae').text());
        $('.noticy-creator').text('发布者：' + $(this).parents('tr').find('.ce').text());
        $('.noticy-wrap').show();
        $('.noticy-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).parents('tr').addClass('addClick');


    });
    $('.noticy-dao .btn-dao').click(function () {
        $('.noticy-wrap').animate({'left': '100%'});
        $('tr').removeClass('addClick');
        $('.noticy-wrap').hide(500);
    });
    $('.noticy-edit').click(function(){
    location.href=$_ctx+'/manage/noticy-edit?id='+$(this).parents('tr').attr('cid');
    });

}