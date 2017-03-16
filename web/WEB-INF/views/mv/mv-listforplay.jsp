<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/music/music-list.js"></script>
<script type="text/javascript">

    var getlist = '${ctx}/music/findMusicInfoByRadom';
    var playurl = '${ctx}/page/mv-player';

    $(function () {

        $('#getmvrd').click(function () {
            getmvlist();
        });


    });
    var getmvlist = function () {
        $.post(getlist, {
            type: 1,
            num: 4
        }, function (data, status) {
            if (status == 'success') {

                musiclist(data.data.rows, 1, playurl);
            }
        });
    }
</script>
<style>
    #getmvrd{
        display: block;
        width: 260px;
        text-align: center;
        font-size: 25px;
        margin-top:20px ;
        border: 1px solid #2a9c7c;
        border-radius: 12px;
        color: #97FFFF;
        background-color: #1d3f16;
        cursor: hand;
    }
    #getmvrd:hover{
        color: #b9ff1b;
        background-color: #79564a;
    }

</style>

<div class="col-md-3">
    <span id="getmvrd">换一批</span>

    <div id="mvlist">

    </div>
</div>


