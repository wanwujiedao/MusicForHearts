<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<script src="${ctx}/static/js/mv/video.dev.js" type="text/javascript" charset="utf-8"></script>--%>
<script src="${ctx}/static/js/mv/video.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx}/static/js/mv/draggabilly.pkgd.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/mv/video-js.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/mv/player.css"/>


<!--mv播放器-->
<div class="mv-wrap">
    <div id="myplayer">

        <video id="myvideo" class="video-js vjs-default-skin" autoplay="true" controls preload="none" data-setup="{}"
               loop="loop">
            <%--<source id="sou1" type='video/mp4'/>--%>
        </video>
    </div>

</div>


<div class="mv_action col-md-11 col-md-offset-1">
    <div class="share navbar-left">
        <span>分享到:</span>

        <div class="bshare-custom">
            <a title="分享到QQ空间" class="bshare-qzone"></a>
            <a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
            <a title="分享到人人网" class="bshare-renren"></a>
            <a title="分享到腾讯微博" class="bshare-qqmb"></a>
            <a title="分享到网易微博" class="bshare-neteasemb"></a>
            <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span
                class="BSHARE_COUNT bshare-share-count">0</span></div>

        <script type="text/javascript" charset="utf-8"
                src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>


    </div>

    <div id="mv-title" class=" col-md-6"></div>

    <div class="other_action navbar-right">
        <a id="artist" title="歌手" class="btn"><i
                class="glyphicon glyphicon-star"></i>&nbsp;<span></span></a>
        <a id="collect" title="收藏" class="btn"><i
                class="glyphicon glyphicon-heart"></i>&nbsp;<span></span></a>
        <a id="play" title="播放" class="btn" style="cursor: not-allowed"><i
                class="glyphicon glyphicon-play"></i><span></span></a>
        <a id="download" title="下载" class="btn"><i class="glyphicon glyphicon-save"></i>&nbsp;<span></span></a>
    </div>
</div>

<script type="text/javascript">


    var id = '${mv_id}';
    var playmusicurl = '${ctx}/music/toPlay';
    var addplay = '${ctx}/music/update';
    var addcollect = '${ctx}/music/addCollectcount';
    var downurl = '${ctx}/music/download';
    $(function () {
        $('#myvideo').css({
            'width': '1000px',
            'height': '550px'
        });


        $.post(playmusicurl, {
            id: id
        }, success);


        function success(data, status) {
            if (status == 'success') {
                $('#myvideo_html5_api').prop('src', data.url);
//
//
                $('#mv-title').text(data.name);
                $('#collect').find('span').text(data.collectcount);
                $('#play').find('span').text(data.playcount + 1);
                $('#download').find('span').text(data.downloadcount);
                $('#artist').find('span').text(data.artistname);
                $('#artist').attr('key',data.artistid);
                $.post(addplay, {
                    id: id,
                    playcount: data.playcount
                }, function () {
                    $('#getmvrd').trigger('click')
                })
            }

        }

        var draflag = 0;
        $(window).bind("scroll", function () {

            if ($(document).scrollTop() + $(window).height() > 2484) {
                if (draflag == 0) {

                    $('#myvideo').addClass('smallplayer');
                    $('#myvideo').prepend('<div class="mv-sd"></div>');
                    $('#myvideo_html5_api').addClass('smallplayer1');
                //    $('.mv-sd').css({ 'cursor': 'move'});
                    $('#myvideo').draggabilly();
                    draflag = 1;
                }

            } else {
                if (draflag == 1) {
                    $('#myvideo').removeClass('smallplayer');
                    $('#myvideo_html5_api').removeClass('smallplayer1');
                    $('.mv-sd').remove();
                    $('#myvideo').draggabilly('destroy');
                    draflag = 0;
                }
            }
        });


        var temp;

        $('[class="other_action navbar-right"]').children('a').hover(
                function () {
                    temp = $(this).children('span').text();
                    $(this).children('span').text(this.title);

                }, function () {
                    $(this).children('span').text(temp);
                });
    })
    $('#collect').click(function () {
        $.post(addcollect, {
            id: id,
        }, function (data, stadius) {
            if (stadius == 'success') {
                $('#collect').find('span').text(parseInt($('#collect').find('span').text()) + 1);
                window.wxc.xcConfirm('收藏成功', window.wxc.xcConfirm.typeEnum.info, {
                    title: "消息"
                });
            }

        });
    });
    $('#download').click(function () {
        $('#download').find('span').text(parseInt($('#download').find('span').text())+ 1);
        window.open(downurl + '?id=' + id);


    });
    $('#artist').click(function(){
        location.href=$_ctx+'/page/artist?id='+$(this).attr('key');
    });

</script>
