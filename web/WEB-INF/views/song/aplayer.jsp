<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" href="${ctx}/static/plugs/APlayer/dist/APlayer.min.css">
<script src="${ctx}/static/plugs/APlayer/dist/APlayer.min.js"></script>
<style>
    .myplayer-wrap {

        width: 60%;
        margin: 30px auto;
        height: 350px;

    }

    #song_player {
        height: 350px;
    }

    .other_action a {
        display: block;
        border: 1px solid #006400;
        background-color: #8B814C;
        float: right;
        margin-right: 15px;
        width: 80px;
        line-height: 20px;
        transition: 0.2s ease-out;
        -moz-transition: 0.2s ease-out;
        -webkit-transition: 0.2s ease-out;
    }

    .other_action a:hover {
        transform: scale(1.1);
        background-color: #CAFF70;
        -ms-transform: scale(1.1);
        -moz-transform: scale(1.1);
        -webkit-transform: scale(1.1);
        -ms-transform: scale(1.1);
    }

</style>
<script>
    var song_id =${song_id};
    var playmusicurl = '${ctx}/music/toPlay';
    var addplay = '${ctx}/music/update';
    var addcollect = '${ctx}/music/addCollectcount';
    var downurl = '${ctx}/music/download';
    var playsong = function () {
        $.post(playmusicurl, {
            id: song_id
        }, function (data, stadius) {
            if (stadius == 'success') {

                $('#song_info').html('&nbsp;&nbsp;&nbsp;&nbsp;'+data.info);
                $('#artist').find('span').text(data.artistname);
                $('#artist').attr('key',data.artistid);
                $('#album').find('span').text(data.albumname);
                $('#album').attr('key',data.albumid);
                $('#collect').find('span').text(data.collectcount);
                $('#play').find('span').text(data.playcount + 1);
                $('#download').find('span').text(data.downloadcount);
                $.post(addplay, {
                    id: song_id,
                    playcount: data.playcount
                }, function () {
//                    $('#getmvrd').trigger('click')
                })


                if (data.lrcurl == 'nolrc') {
                    $('#song_player').css({'height': '106px'});
                    $('.myplayer-wrap').css({'height': '106px'});
                    var ap3 = new APlayer({
                        element: document.getElementById('song_player'),
                        narrow: false,
                        showlrc: false,
                        autoplay: true,
                        music: {
                            title: data.name,
                            author: data.artistname,
                            url: data.url,
                            pic: data.posterurl
                        }
                    });
                    ap3.init();
                } else {
                    htmlobj = $.ajax({
                        url: data.lrcurl,
                        async: false
                    }); //获取test1.txt内容并赋值
                    $('.aplayer-lrc-content').html(htmlobj.responseText); //替换标签内的html

                    var ap3 = new APlayer({
                        element: document.getElementById('song_player'),
                        narrow: false,
                        showlrc: true,
                        autoplay: true,
                        music: {
                            title: data.name,
                            author: data.artistname,
                            url: data.url,
                            pic: data.posterurl
                        }
                    });
                    ap3.init();
                }

            }
        })
    }

    $(function () {
        playsong();
        $('#collect').click(function () {
            $.post(addcollect, {
                id: song_id,
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
            $('#download').find('span').text(parseInt($('#download').find('span').text()) + 1);
            window.open(downurl + '?id=' + song_id);


        });

        $('#artist').click(function(){
            location.href=$_ctx+'/page/artist?id='+$(this).attr('key');
        });
        $('#album').click(function(){

            location.href=$_ctx+'/page/album?albumid='+$(this).attr('key');
        });

    });
</script>
<div class="myplayer-wrap">

    <div id="song_player" class="aplayer col-d-10">
        <pre class="aplayer-lrc-content"></pre>
    </div>
</div>
<div class="col-md-10 col-md-offset-1">
    <div id="song_info"></div>
</div>


<div class="col-md-8 col-md-offset-2" style="margin-top: 50px">
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

    <div class="other_action navbar-right ">
        <a id="artist" title="歌手" class="btn"><i
                class="glyphicon glyphicon-star"></i>&nbsp;<span></span></a>
        <a id="album" title="专辑" class="btn"><i
                class="glyphicon glyphicon-book"></i>&nbsp;<span></span></a>
        <a id="collect" title="收藏" class="btn"><i
                class="glyphicon glyphicon-heart"></i>&nbsp;<span></span></a>
        <a id="play" title="播放" class="btn" style="cursor: not-allowed"><i
                class="glyphicon glyphicon-play"></i><span></span></a>
        <a id="download" title="下载" class="btn"><i class="glyphicon glyphicon-save"></i>&nbsp;<span></span></a>
    </div>
</div>



