<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="${ctx}/static/js/music/music-list.js"></script>

<script type="text/javascript">

    var getsonglisturl = '${ctx}/music/findMusicInfoByRadom';
    var songplayurl = '${ctx}/page/song-player';

    $(function () {

        $('#getrd').click(function () {
            getsonglist();
        });


    });
    var getsonglist = function () {
        $.post(getsonglisturl, {
            type: 0,
            num: 5
        }, function (data, status) {
            if (status == 'success') {
                 musiclist(data.data.rows, 0, songplayurl);

                $('#getartrd').trigger('click');

            }
        });
    }
</script>

<style>
    #getrd{
        cursor: hand;
    }
</style>
<div class="row" style="margin-top: 250px">
    <div class="home-bar home-song"><span id="getrd">歌曲推荐</span></div>
    <div class="col-md-10 col-md-offset-1">
        <table class="table table-striped table-hover" id="songlist">


        </table>
    </div>
</div>

