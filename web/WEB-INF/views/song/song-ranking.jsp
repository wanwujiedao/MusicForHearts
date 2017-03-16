<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="${ctx}/static/js/song/song-ranking.js"></script>

<script type="text/javascript">
    $(function () {
        var songrankingurl = '${ctx}/music/ranking';
        var playurl = '${ctx}/page/song-player';
        var i = 1;
        var pagenum = 1;
        var pagesize = 10;
        var getdata = function (pagesize, pagenum) {
            $.post(songrankingurl, {
                pagesize: pagesize,
                pagenum: pagenum,
                type: 0
            }, function (data, stadius) {
                if (stadius == 'success') {
                    var count = Math.ceil(data.data.total / 10);
                    var start = data.data.pagenum;
                    console.info(data);

                    $('.songpage').css({
                        'margin-left': '600px'
                    });
                    if (count >= 1) {
                        songranking(data.data.rows, 3, playurl);
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
                                getdata(pagesize, page);
                            }
                        });

                    }
                }else{
                    $(".songpage").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('#songlist').html('');
                }
            });
        }

        getdata(pagesize, pagenum);
    });
</script>

<table class="table table-striped" id="songlist">


</table>
<div class="songpage"></div>