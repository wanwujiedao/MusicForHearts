<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">
    var musicurl = '${ctx}/music/findMusicInfo';
    var playurl = '${ctx}/page/mv-player';
    var pagenum = 1;
    var pagesize = 4;
    var pagetotal = 100;
    $(function () {
        var getmvdata = function (pagesize, pagenum) {
            $.post(musicurl, {
                pagesize: pagesize,
                pagenum: pagenum,
                type: 1
            }, function (data, stadius) {
                if (stadius == 'success') {

                    var count = Math.ceil(data.data.total / 4);
                    pagetotal = count;

                    setTimeout(function () {
                        musiclist(data.data.rows, 1, playurl)
                    }, 50);

                    $('#getrd').trigger('click');

                }
            });
        }

        getmvdata(pagesize, pagenum);


        $('#premv').click(function () {
            if (pagenum > 1) {
                pagenum--;
                getmvdata(pagesize, pagenum);
            } else {
                window.wxc.xcConfirm('已经是第一页了！', window.wxc.xcConfirm.typeEnum.info, {
                    title: "温馨提示"
                });
            }
        });
        $('#nextmv').click(function () {
            if (pagenum < pagetotal) {
                pagenum++;
                getmvdata(pagesize, pagenum);
            } else {
                window.wxc.xcConfirm('我们再也没有其他资源了！', window.wxc.xcConfirm.typeEnum.info, {
                    title: "温馨提示"
                });
            }
        });


    });
</script>


<div class="home-bar home-mv"><span>MV推荐</span></div>
<div class="col-md-1">
    <a class="mymv"
       id="premv" role="button">
        <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
    </a>

</div>

<div class="col-md-10">

    <div id="mvlist"></div>
</div>
<div class="col-md-1">
    <a id="nextmv" class="mymv"
       role="button"> <span
            class="glyphicon glyphicon-menu-right" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
    </a>
</div>
