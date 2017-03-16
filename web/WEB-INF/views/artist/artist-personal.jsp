<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<link href="${ctx}/static/css/artist/artist-personal.css" rel="stylesheet">

<script src="${ctx}/static/js/music/music-list.js"></script>
<script src="${ctx}/static/js/album/album-list.js"></script>

<script type="text/javascript">
    var id =${id};
    var findartist = '${ctx}/artist/findArtistById';
    var musicurl = '${ctx}/music/findMusicInfo';
    var findalbum = '${ctx}/album/findAlbum';
    var playmvurl = '${ctx}/page/mv-player';
    var playsongurl = '${ctx}/page/song-player';
    var albumurl = '${ctx}/page/album';
    var pagenum = 1;
    var mvpagesize = 8;
    var albumpagesize = 6;
    var songpagesize = 8;

    var getmv = function (mvpagesize, pagenum) {
        $('.artist-music').html('  <div id="mvlist" ></div><div class="page"></div>');
        $.post(musicurl, {
            artistid: id,
            type: 1,
            pagenum: pagenum,
            pagesize: mvpagesize
        }, function (data, stadius) {

            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 8);
                var start = data.data.pagenum;
                console.info(data);

                $('.page').css({
                    'margin-left': '350px'
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
        $('.artist-music').html('  <table class="table table-striped" id="songlist"> </table> <div class="songpage"></div>');

        $.post(musicurl, {
            pagesize: songpagesize,
            pagenum: pagenum,
            artistid: id,
            type: 0
        }, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 8);
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

    var getalbum = function (albumpagesize, pagenum) {
        $('.artist-music').html('  <div id="albumlist" ></div><div class="albumpage"></div>');
        $.post(findalbum, {
            pagesize: albumpagesize,
            pagenum: pagenum,
            artistid: id
        }, function (data, stadius) {

            var count = Math.ceil(data.data.total / 6);
            var start = data.data.pagenum;
            $('.albumpage').css({
                'margin-left': '350px'
            });
            if(count>=1) {
                albumlist(data.data.rows, albumurl);
                $(".albumpage").paginate({
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
                        getalbum(albumpagesize, page);
                    }
                });
            }else{
                $(".albumpage").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                $('#albumlist').html('')
            }

        })


    }

    $(function () {
        $.post(findartist, {
            id: id
        }, function (data, stadius) {
            console.info(data);
            var name = '姓名：' + data.name;
            var sexval = '性别：' + data.sexval;
            var birthday = '出生日期：' + data.birthday;
            var country = '国家：' + data.country;
            var watch = '关注度：' + data.watch;
            var info = '&nbsp;&nbsp;&nbsp;&nbsp;简介：' + data.info;
            var imgurl = data.imgurl;

            $('.artist-img').find('img').prop('src', imgurl);
            $('#artist-name-1').html(name);
            $('#artist-sexval-1').html(sexval);
            $('#artist-birthday-1').html(birthday);
            $('#artist-country-1').html(country);
            $('#artist-watch-1').html(watch);
            $('#artist-info-1').html(info);

        })

        $('#music-album').hide();


        $('#music-album').hover(function () {
            $('#music-album').animate({right: '50px'});
        }, function () {
            // $('#music-album').animate({right:'-150px'});
        }).stop(true, true);

        var mvstr = '<div id="mvlist"></div>';
        var songstr = '<div id="songlist"></div>';
        var albumstr = '<div id="albumlist"></div>';

        $('.changeshow').click(function () {
            var keyword = $(this).text();

            $('.changeshow').removeClass('showkey');
            $(this).addClass('showkey');
            // alert(id);
            $('#music-album').animate({right: '-150px'});
            ;

            if (keyword == '歌曲') {
                getsong(songpagesize, pagenum);
            } else if (keyword == 'MV') {
                getmv(mvpagesize, pagenum);
            } else {
                getalbum(albumpagesize, pagenum);
            }

        });

        $('#sh-bar').click(function () {
            $('#music-album').animate({right: '-150px'});
        });

        $('.artist-music').find('div').click(function () {
            var pagechange = $(this).text();
            if (pagechange == 'Ta的歌曲') {
                getsong(songpagesize, pagenum);
                $('.changeshow').eq(0).addClass('showkey');
            } else if (pagechange == 'Ta的MV') {
                getmv(mvpagesize, pagenum);

                $('.changeshow').eq(1).addClass('showkey');
            } else {
                getalbum(albumpagesize, pagenum);
                $('.changeshow').eq(2).addClass('showkey');
            }

            $('#music-album').show();
            $('#music-album').animate({
                right: '-150px',
                top: '100px'
            });
        });

    });
</script>


<div id="music-album">
    <a id="sh-bar"><span class="glyphicon glyphicon-align-justify"></span></a>
    <a class="changeshow">歌曲</a>
    <a class="changeshow">MV</a>
    <a class="changeshow">专辑</a>
</div>

<div class="artist-wrap">

    <div class="artist-detail col-md-4">
        <div class="artist-img col-md-5 ">
            <img/>
        </div>
        <div class="artist-other col-md-6 col-md-offset-1">
            <span id="artist-name-1"></span>
            <span id="artist-sex-1"></span>
            <span id="artist-birthday-1"></span>
            <span id="artist-country-1"></span>
            <span id="artist-watch-1"></span>
        </div>
        <div class="artist-info col-md-10 ">
            <span id="artist-info-1"></span>
        </div>
    </div>


    <div class="artist-music col-md-8">
        <div class="aaa">Ta的歌曲</div>
        <div class="aaa">Ta的MV</div>
        <div class="aaa">Ta的专辑</div>
    </div>


</div>