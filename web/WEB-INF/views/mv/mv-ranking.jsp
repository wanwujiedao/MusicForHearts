<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" src="${ctx}/static/js/mv/mv-ranking.js"></script>
<script type="text/javascript" charset="utf-8">
    $(function () {
        var mvrankingurl = '${ctx}/music/ranking';
        var myurl = '${ctx}/page/mv-player';
        var i = 1;
        var pagetotal = 10;
        $.post(mvrankingurl,{
            type:1
        }, function (data,stadius) {
            pagetotal=Math.ceil(data.data.total/10);
            mvranking(data, myurl);
        });

        $(window).bind("scroll", function () {
//            alert($(window).height()); //浏览器时下窗口可视区域高度

            if ($(document).scrollTop() >= $(window).height() - 800) {//到底部时加载
                i++;
                if (i <=pagetotal) {
                    $.getJSON(mvrankingurl, {
                        pagenum: i,
                        type:1
                    }, function (data) {
                        console.info(pagetotal);


                        mvranking(data, myurl);
                    });
                }
            }
        });
    });
</script>
<div id="mv-ranking"></div>

