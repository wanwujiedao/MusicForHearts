<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">
    var albumid =${albumid};

    var musicurl = '${ctx}/music/findMusicInfo';
    var playmvurl = '${ctx}/page/mv-player';
    var playsongurl = '${ctx}/page/song-player';
    var pagenum = 1;
    var mvpagesize = 12;
    var songpagesize = 10;

    var getmv = function (mvpagesize, pagenum) {
        $('.album-music').html('  <div id="mvlist" ></div><div class="page"></div>');
        $.post(musicurl, {
            albumid: albumid,
            type: 1,
            pagenum: pagenum,
            pagesize: mvpagesize
        }, function (data, stadius) {

            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 12);
                var start = data.data.pagenum;
                console.info(data);

                $('.page').css({
                    'margin-left': '500px'
                });
                if (count >= 1) {
                    musiclist(data.data.rows, 1, playmvurl);
                    $(".page").paginate({
                        count: count,
                        start: start,
                        display: 7,
                        border: false,
                        border_color: '#fff',
                        text_color: '#4F4F4F',
                        background_color: '#EEE9E9',
                        border_hover_color: '#8B8682',
                        text_hover_color: '#fff',
                        background_hover_color: '#8B8682',
                        images: false,
                        mouse: 'press',
                        onChange: function (page) {
                            getmv(mvpagesize, page);
                        }
                    });
                } else {
                    $(".page").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $("#mvlist").html('');
                }
            }
        });
    }


    var getsong = function (songpagesize, pagenum) {
        $('.album-music').html('  <table class="table table-striped" id="songlist"> </table> <div class="songpage"></div>');

        $.post(musicurl, {
            pagesize: songpagesize,
            pagenum: pagenum,
            albumid: albumid,
            type: 0
        }, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;
                console.info(data);

                $('.songpage').css({
                    'margin-left': '400px'
                });
                if (count >= 1) {
                    musiclist(data.data.rows, 0, playsongurl);
                    $(".songpage").paginate({
                        count: count,
                        start: start,
                        display: 7,
                        border: false,
                        border_color: '#fff',
                        text_color: '#4F4F4F',
                        background_color: '#EEE9E9',
                        border_hover_color: '#8B8682',
                        text_hover_color: '#fff',
                        background_hover_color: '#8B8682',
                        images: false,
                        mouse: 'press',
                        onChange: function (page) {
                            getsong(songpagesize, page);
                        }
                    });
                } else {
                    $(".songpage").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('#songlist').html('');
                }
            }
        });
    }

    $(function () {
        getmv(mvpagesize, pagenum);

        $('#amv').click(function () {
            pagenum = 1;
            $(this).hide();
            $('#asong').show();

            getmv(mvpagesize, pagenum);
        });
        $('#asong').click(function () {
            pagenum = 1;
            $(this).hide();
            $('#amv').show();

            getsong(songpagesize, pagenum)
        });
    })
</script>
<style type="text/css">
    .album-music {
        margin-top: 80px;
    }

    .bar {
        position: absolute;
        top: 100px;
        width: 100px;
        height: 100px;
        right: 100px;
    }

    #amv, #asong {

        font-size: 80px;
        background-color: #4f5d6b;
        margin-top: 10px;
        margin-left: 10px;
        border-radius: 12px;
        display: block;

        cursor: hand;
        -webkit-transition: all 1.5s ease;
        -moz-transition: all 1.5s ease;
        -o-transition: all 1.5s ease;
        transition: all 1.5s ease;
    }

    #amv {
        color: #00CC00;
        display: none;

    }

    #asong {
        color: #eef258;
    }

    #amv:hover, #asong:hover {
        background-color: #0d1215;

    }

</style>
<div class="bar">
    <span class="glyphicon glyphicon-film" id="amv"></span>
    <span class="glyphicon glyphicon-music" id="asong"></span>
</div>
<div class="col-md-10 col-md-offset-1 album-music">
</div>