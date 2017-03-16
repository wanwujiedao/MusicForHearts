<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">
    var search='${musickeyword}';
    var searchmusic=$_ctx+'/music/search';
    var playsongurl='${ctx}/page/song-player';
    var songpagenum=1;
    var songpagesize=10;

    var searchsong=function(songpagesize,songpagenum){  $.post(searchmusic,{
        pagesize:songpagesize,
        pagenum:songpagenum,
        search:search,
        type:0
    },function(data,stadius){
        if (stadius == 'success') {
            var  count=Math.ceil(data.data.total/10);
            var  start=data.data.pagenum;

            $('.songpage').css({
                'margin-left': '500px'
            });
            if(count>=1) {
                musiclist(data.data.rows,0,playsongurl);
                $('.songrs').html('歌曲共有<font color="#dc143c">'+data.data.total+'</font>条记录')
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
                        searchsong(songpagesize, page);
                    }
                });
            }else{
                $(".songpage").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">歌曲~暂无数据</span>');
                $("#songlist").html('');
            }
        }
    });}


    $(function(){
        searchsong(songpagesize,songpagenum);
    });
</script>

<div class="songrs" style="font-size: 20px;text-align: center;color: #517607"></div>
<div class="col-xs-offset-1 col-xs-10">
    <table class="table table-striped" id="songlist">
    </table>
    <div class="songpage"></div></div>