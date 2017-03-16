<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/song/songrdm.js"></script>
<script type="text/javascript">

    var getlist = '${ctx}/music/findMusicInfoByRadom';

    $(function () {

        $('#getsongrd').click(function () {
            getsonglist();
        });
        $('#getsongrd').trigger('click')

    });
    var getsonglist = function () {
        $.post(getlist, {
            type: 0,
            num: 4
        }, function (data, status) {
            console.info(data)
            if (status == 'success') {
                songrdm(data.data.rows);
            }
        });
    }
</script>
<style>
    #getsongrd{
        display: block;
        width: 200px;
        text-align: center;
        font-size: 25px;
        margin-top:20px ;
        margin-left: 50px;
        border: 1px solid #2a9c7c;
        border-radius: 12px;
        color: #97FFFF;
        background-color: #1d3f16;
        cursor: hand;
    }
    #getsongrd:hover{
        color: #b9ff1b;
        background-color: #79564a;
    }

</style>

<div class="col-md-3">
    <span id="getsongrd">换一批</span>

    <div class="song_list">

    </div>
</div>


