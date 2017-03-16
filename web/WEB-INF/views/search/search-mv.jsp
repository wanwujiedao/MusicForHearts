<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">
    var search='${musickeyword}';
    var searchmusic=$_ctx+'/music/search';
    var playmvurl='${ctx}/page/mv-player';
    var mvpagenum=1;
    var mvpagesize=12;

    var searchmv=function(mvpagesize,mvpagenum){  $.post(searchmusic,{
        pagesize:mvpagesize,
        pagenum:mvpagenum,
        search:search,
        type:1
    },function(data,stadius){
        if (stadius == 'success') {
            var  count=Math.ceil(data.data.total/12);
            var  start=data.data.pagenum;

            $('.page').css({
                'margin-left': '500px'
            });
            if(count>=1) {
                musiclist(data.data.rows, 1,playmvurl);
                $('.mvrs').html('mv共有<font color="#dc143c">'+data.data.total+'</font>条记录')
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
                        searchmv(mvpagesize, page);
                    }
                });
            }else{
                $(".page").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">MV~暂无数据</span>');
                $("#mvlist").html('');
            }
        }
    });}


    $(function(){
        searchmv(mvpagesize,mvpagenum);
    });
</script>

<div class="mvrs" style="font-size: 20px;text-align: center;color: #517607"></div>
<div class="col-md-offset-1">
    <div id="mvlist" ></div>
    <div class="page"></div></div>