<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">
    var musicurl = '${ctx}/music/findMusicInfo';
    var playurl = '${ctx}/page/mv-player';
    var pagenum = 1;
    var pagesize = 12;
    $(function () {
        var getdata = function (pagesize, pagenum) {
            $.post(musicurl, {
                pagesize: pagesize,
                pagenum: pagenum,
                type: 1
            }, function (data, stadius) {
                if (stadius == 'success') {
                    var count = Math.ceil(data.data.total / 12);
                    var start = data.data.pagenum;
                    console.info(data);

                    $('.page').css({
                        'margin-left': '450px'
                    });
                    if (count >= 1) {
                        musiclist(data.data.rows, 1, playurl);
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
                                getdata(pagesize, page);
                            }
                        });
                    } else {
                        $(".page").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                        $("#mvlist").html('');

                    }

                } else {
                    window.wxc.xcConfirm('获取数据失败！', window.wxc.xcConfirm.typeEnum.error, {
                        title: "错误"
                    });
                }
            });
        }

        getdata(pagesize, pagenum);


    });
</script>
<div class="col-md-offset-1">
    <div id="mvlist"></div>
    <div class="page"></div>
</div>