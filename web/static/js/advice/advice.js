/**
 * Created by admin on 2016/5/10.
 */
var makeadvicelist = function (mydata) {

    var str = '';
    $.each(mydata, function (index, item) {
        str += '<tr id="'+item.id+'"><td ><input type="checkbox" class="advice" ></td><td class="look ce">'+item.username+'</td> <td class="look ct">'+item.content+'</td> <td class="look ae">'+item.addtime+'</td></tr>';
    });
    $('.advices').find('tbody').html(str);

    $('.look').click(function () {
        $('.noticy-detail h2').text('留言');
        $('.noticy-detail .noticy-cont').html('&nbsp;&nbsp;&nbsp;&nbsp;' + $(this).parents('tr').find('.ct').text());
        $('.releasetime').text('发布时间：' + $(this).parents('tr').find('.ae').text());
        $('.noticy-creator').text('发布者：' + $(this).parents('tr').find('.ce').text());


        $('.noticy-wrap').show();
        $('.noticy-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).parents('tr').addClass('addClick');


    });

    $('.noticy-dao .btn-dao').click(function () {
        $('.noticy-wrap').animate({'left': '100%'});
        $('.advice').parents('tr').removeClass('addClick')
        $('.noticy-wrap').hide(500);
    });
}